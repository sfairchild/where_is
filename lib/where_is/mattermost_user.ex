defmodule WhereIs.MattermostUser do
 @enforce_keys [:id, :username, :email]
 defstruct id: "", username: "", first_name: "", last_name: "", email: "", location_id: ""
 #defstruct id: "", username: "", first_name: "", last_name: "", email: "", nickname: "", position: "", auth_data: "", auth_service: "", roles: [], timezone: %{automatic_timezone: "", manual_timezone: "", use_automaticTimezone: ""}, create_at: 0, update_at: 0, delete_at: 0, location_id: nil
	alias WhereIs.MattermostUser, as: MattermostUser 


   def fetchCurrentMattermostUsersList do
    {:ok, users} = fetchUsersFromMattermost()

    usersList = makeUsers(users)
    IO.inspect(usersList)
  end

  def fetchUsersFromMattermost do 
    headers = [{"Authorization", System.get_env("MATTERMOST_TOKEN")},
             {"X-Requested-With", "XMLHttpRequest"}]
	url = "https://chat.nexient.com/api/v4/users"

	{:ok, response} = HTTPoison.get(url, headers)
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

