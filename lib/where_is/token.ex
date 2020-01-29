defmodule WhereIs.Token do

  @namespace "testincance"

  def sign(data) do
    Phoenix.Token.sign(WhereIsWeb.Endpoint, @namespace, data)
  end

  def verify(token) do
    Phoenix.Token.verify(WhereIsWeb.Endpoint, @namespace, token, max_age: 365 * 20 * 3600)
  end
end

