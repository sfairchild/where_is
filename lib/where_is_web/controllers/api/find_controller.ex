defmodule WhereIsWeb.Api.FindController do
  use WhereIsWeb, :controller

  def index(conn, _params) do

                    json(conn, fetchMattermostUsers())
  end

  # defmodule MattermostUser do
  #   @derive [Poison.Encoder]
  #   defstruct [
  #               :id,
  #               :username,
  #               :email,
  #               :roles
  #               ]
  # end


  def fetchMattermostUsers do
    url = "http://54.91.189.149:8065/api/v4/users"
    headers = [{"Authorization", "Bearer ih7cgnr3otd5igzkawtwrhu5ia"},
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
