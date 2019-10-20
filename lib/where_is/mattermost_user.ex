defmodule WhereIs.MattermostUser do
 @enforce_keys [:id, :username, :email]
 defstruct id: "", username: "", first_name: "", last_name: "", email: "", location_id: "", rank: 0
	alias WhereIs.MattermostUser, as: MattermostUser


  def fuzzy_search_users(str) when is_binary(str) do
    fuzzy_search_users(WhereIs.Users.get_users, String.downcase(str))
  end

  def fuzzy_search_users([%__MODULE__{} = user | users], str ) do
    Enum.sort_by([get_jaro_number(user, str) | fuzzy_search_users(users, str)], fn(u) -> u.rank end)
    |> Enum.reverse
  end

  def fuzzy_search_users([], _str ), do: []

  def get_jaro_number(%__MODULE__{} = user, str) do
    rank = Enum.max [
      String.jaro_distance(String.downcase(user.username), str),
      String.jaro_distance(String.downcase(user.email), str),
      String.jaro_distance(String.downcase("#{user.first_name} #{user.last_name}"), str)
    ]
    %__MODULE__{user | rank: rank}
  end

   def fetchCurrentMattermostUsersList do
	tempUserContainer = []
	usersContainer = []
    users = getAllPagesofMattermostUsers(tempUserContainer, usersContainer, 0)
    
    IO.inspect(Enum.count(users), label: "Number of Users from callMattermostForUsers")
    usersList = makeUsers(users)
    IO.inspect(usersList)
  end

  def getAllPagesofMattermostUsers(tempUsers, usersContainer, n) do
  	{:ok, tempUsers} = callMattermostForUsers(n)
  	cond do
			Enum.empty?(tempUsers) ->
  				usersContainer
  			!Enum.empty?(tempUsers) ->
  				IO.inspect(n)
  				IO.inspect(Enum.empty?(tempUsers))
  				usersContainer = Enum.concat(usersContainer, tempUsers)
  				getAllPagesofMattermostUsers(tempUsers, usersContainer, n + 1)
  		end
  end

  def callMattermostForUsers(page) do 
    headers = [{"Authorization", System.get_env("MATTERMOST_TOKEN")},
             {"X-Requested-With", "XMLHttpRequest"}]
	url = "https://chat.nexient.com/api/v4/users"

	{:ok, response} = HTTPoison.get(url, headers, params: %{per_page: 200, page: page})
	Jason.decode(response.body())
  end

  def makeUserFromMap(userMap) do
  	keys = Map.keys(userMap)
  	user = createUser(userMap)

  	buildUserFromMap(keys, userMap, user)
  end

  def makeUsers(users) do
  	numOfUsers = Enum.count(users)
  	userslist = []
  	makeUsers(users, userslist, numOfUsers - 1)
  end

  defp makeUsers(users, usersList, n) when n <= 0 do
  	{:ok, userMap} = Enum.fetch(users, n)
  	user = makeUserFromMap(userMap)
  	usersList = [user | usersList]
  end

  defp makeUsers(users, usersList, n) do
  	{:ok, userMap} = Enum.fetch(users, n)
  	user = makeUserFromMap(userMap)
  	usersList = [user | usersList]
  	makeUsers(users, usersList, n - 1)
  end


  defp createUser(userMap) do
  	{:ok, id} = Map.fetch(userMap, "id")
  	{:ok, username} = Map.fetch(userMap, "username")
  	{:ok, email} = Map.fetch(userMap, "email")
  	{:ok, firstName} = Map.fetch(userMap, "first_name")
  	{:ok, lastName} = Map.fetch(userMap, "last_name")

  	%__MODULE__{id: id, username: username, first_name: firstName, last_name: lastName, email: email}
  end

  defp buildUserFromMap([head | tail], userMap, user) do
  	{value, userMap} = Map.pop(userMap, head)
  	user = assignVariable(head, value, user)

  	buildUserFromMap(tail, userMap, user)
  end

  defp buildUserFromMap([], userMap, user) do
  	user
  end

  defp assignVariable(keyString, value, user) do
  		key = String.to_atom(keyString)
  		Map.put(user, key, value)

  		cond do
			Map.has_key?(user, key) ->
  				user = %{user | key => value}
  			1 = 1 ->
  				user
  		end
  	end

  	def addLocationIdToUser(locationId, user) do
  		assignVariable("location_id", locationId, user)
  	end
end

