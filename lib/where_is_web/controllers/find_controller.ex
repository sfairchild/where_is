defmodule WhereIsWeb.FindController do
  use WhereIsWeb, :controller

  def index(conn, _params) do
    url = "http://54.91.189.149:8065/api/v4/users"
    headers = [{"Authorization", "Bearer ambmsf88wtnefbmup6drr7qhrh"},
      {"Content-Type", "application/json; charset=utf-8"}]
    body = {}
    {:ok, json} =

    case HTTPoison.post!(url, body, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.puts body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
                    json(conn, json)
  end

  defmodule MattermostUser do
    @derive [Poison.Encoder]
    defstruct [
                :id,
                :username,
                :email,
                :roles
                ]
  end


  def fetchMattermostUsers do
    url = "http://54.91.189.149:8065/api/v4/users"
    headers = [{"Authorization", "Bearer ambmsf88wtnefbmup6drr7qhrh"},
               {"Content-Type", "application/json; charset=utf-8"}]


    case HTTPoison.post(url, headers) do
    {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
    IO.puts body
    {:ok, %HTTPoison.Response{status_code: 404}} ->
    IO.puts "Not found :("
    {:error, %HTTPoison.Error{reason: reason}} ->
    IO.inspect reason
    end

  end



  def fetchMattermostUser(userId) do
    url = "http://54.91.189.149:8065/api/v4/users/"<>userId
    headers = ["Content-Type: application/json",
                "Authorization: Bearer "]

    case HTTPoison.post(url, headers) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.puts body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end



end
