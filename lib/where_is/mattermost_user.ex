defmodule WhereIs.MattermostUser do
 @enforce_keys [:id, :username, :email]
 defstruct id: "", username: "", first_name: "", last_name: "", email: "", location_id: ""
  # defstruct id: "", username: "", first_name: "", last_name: "", email: "", nickname: "", position: "", auth_data: "", auth_service: "", roles: [], timezone: %{automatic_timezone: "", manual_timezone: "", use_automaticTimezone: ""}, create_at: "", update_at: "", delete_at: ""
	alias WhereIs.MattermostUser, as: MattermostUser 


  def makeUser(userMap) do
  	keys = Map.keys(userMap)
  	user = createUser(userMap, keys)
  	IO.inspect(user)

  	#fTODO: fix when we have more time
  	buildUser(keys, userMap, user)
  	IO.inspect(user)
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

  defp buildUser(keys, userMap, user) do
  		Enum.each(keys, fn(s) -> assignVariable(s, userMap, user) end)		
  end

  defp assignVariable(key, userMap, user) do
  	IO.inspect(key)
  	{value, userMap} = Map.pop(userMap, key)
  	IO.inspect(userMap)
  	Map.put(user, key, value)
  	IO.inspect(user)
  end

  defp assignVariable()
  def assignLocationId(user, locationId) do
  	
  end

end

