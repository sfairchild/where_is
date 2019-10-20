defmodule WhereIs.MattermostUser do
 @enforce_keys [:id, :username, :email]
 defstruct id: "", username: "", first_name: "", last_name: "", email: "", location_id: ""
  # defstruct id: "", username: "", first_name: "", last_name: "", email: "", nickname: "", position: "", auth_data: "", auth_service: "", roles: [], timezone: %{automatic_timezone: "", manual_timezone: "", use_automaticTimezone: ""}, create_at: "", update_at: "", delete_at: ""
	alias WhereIs.MattermostUser, as: MattermostUser 


  def makeUser(userMap) do
  	keys = Map.keys(userMap)
  	user = createUser(userMap, keys)
  	# IO.inspect(user)

  	#fTODO: fix when we have more time
  	# buildUserFromMap(keys, userMap, user)
  	# IO.inspect(user)
  end

  def makeUsers(users) do
  	numOfUsers = Enum.count(users)
  	IO.inspect(numOfUsers)
  	userslist = []
  	makeUsers(users, userslist, numOfUsers - 1)
  end

  defp makeUsers(users, usersList, n) when n <= 0 do
  	  	IO.inspect(n, label: "1 or below")
  	{:ok, userMap} = Enum.fetch(users, n)
  	user = makeUser(userMap)
  	usersList = [user | usersList]
  end

  defp makeUsers(users, usersList, n) do
  	IO.inspect(n, label: "above 1")
  	{:ok, userMap} = Enum.fetch(users, n)
  	user = makeUser(userMap)
  	usersList = [user | usersList]
  	makeUsers(users, usersList, n - 1)
  end


  defp createUser(userMap, keys) do
  	{:ok, id} = Map.fetch(userMap, "id")
  	{:ok, username} = Map.fetch(userMap, "id")
  	{:ok, email} = Map.fetch(userMap, "email")
  	{:ok, firstName} = Map.fetch(userMap, "first_name")
  	{:ok, lastName} = Map.fetch(userMap, "last_name")

  	%__MODULE__{id: id, username: username, first_name: firstName, last_name: lastName, email: email,}
  end

  defp buildUserFromMap([head | tail], userMap, user) do
  	IO.inspect(head)
  	{value, userMap} = Map.pop(userMap, head)
  	{value, userMap} = Map.pop(userMap, head)
  	IO.inspect(userMap)
  	IO.inspect(value)
  	user = assignVariable(head, value, user)

  	buildUserFromMap(tail, userMap, user)	
  end

  defp buildUserFromMap([], userMap, user) do
  	user
  end

  defp assignVariable(key, value, user) do
  		Map.put(user, key, value)
  end

  def fetchCurrentMattermostUsersList do
    {:ok, users} = fetchUsersFromMattermost()

    usersList = WhereIs.MattermostUser.makeUsers(users)
    IO.inspect(usersList)
  end

  def fetchUsersFromMattermost do 
	url = "http://54.91.189.149:8065/api/v4/users"
	headers = [{"Authorization", "Bearer ih7cgnr3otd5igzkawtwrhu5ia"},
	           {"Content-Type", "application/json; charset=utf-8"}]

	{:ok, response} = HTTPoison.get(url, headers)
	Jason.decode(response.body())
  end





end

