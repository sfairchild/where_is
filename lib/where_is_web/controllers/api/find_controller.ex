defmodule WhereIsWeb.Api.FindController do
  use WhereIsWeb, :controller

  def index(conn, params) do
    IO.inspect params

    {:ok, json} = """
                    {
                    "attachments": [
                    {
                    "fallback": "test",
                    "response_type": "in_channel",
                    "color": "#FF8000",
                    "pretext": "This is optional pretext that shows above the attachment.",
                    "text": "This is the text of the attachment. It should appear just above an image of the Mattermost logo. The left border of the attachment should be colored orange, and below the image it should include additional fields that are formatted in columns. At the top of the attachment, there should be an author name followed by a bolded title. Both the author name and the title should be hyperlinks.",
                    "author_name": "Mattermost",
                    "author_icon": "http://www.mattermost.org/wp-content/uploads/2016/04/icon_WS.png",
                    "author_link": "http://www.mattermost.org/",
                    "title": "Example Attachment",
                    "title_link": "http://docs.mattermost.com/developer/message-attachments.html",
                    "fields": [
                    {
                    "short":false,
                    "title":"Long Field",
                    "value":"Testing with a very long piece of text that will take up the whole width of the table. And then some more text to make it extra long."
                    },
                    {
                    "short":true,
                    "title":"Column One",
                    "value":"Testing"
                    },
                    {
                    "short":true,
                    "title":"Column Two",
                    "value":"Testing"
                    },
                    {
                    "short":false,
                    "title":"Another Field",
                    "value":"Testing"
                    }
                    ],
                    "image_url": "http://www.mattermost.org/wp-content/uploads/2016/03/logoHorizontal_WS.png"
                    }
                    ]
                    }
                    """
                    |> Jason.decode

                    json(conn, json)
  
  end

  def find(conn, %{"text" => text, "user_name" => user_name} = params) do
    user_exists = WhereIs.Application.validate(text)
    {:ok, json} = get_json(WhereIs.Application.validate(text), WhereIs.Application.generate_url(text), text)
                  |> Jason.decode
    json(conn, json)
  end

  defp get_json(user_exists = true, image_link, text) when is_binary(image_link) do
    """
      {
        "attachments": [
          {
            "fallback": "test",
            "color": "#FFC0CB",
            "pretext": "stupid fucking lightbulb ",
            "text": "The location of #{text} can be found below.",
            "fields": [
              {
                "short":false,
                "title":"Long Field",
                "value":"here's a super long string of text randomly generated; three is a spectre haunting nexient, the spectre of gooch; many people tried to exorcize his shitposting, but to no avail; here is his code and this is his statement blah blah blah"
              },
              {
                "short":true,
                "title":"Column One",
                "value":"Testing"
              },
              {
                "short":true,
                "title":"Column Two",
                "value":"Testing"
              },
              {
              "short":false,
              "title":"Another Field",
              "value":"Testing"
              }
            ],
            "image_url": "#{image_link}"
          }
        ]
      }
    """
  end

  defp get_json(user_exists = true, _image_link, _text) do
    """
      {
        "attachments":
        [
          {
            "pretext": "svg could not be generated  ",
            "text": "SVG Failed To Generate. ",
            "image_url":"http://dailynous.com/wp-content/uploads/2016/10/poop-emoji-frown.png"
          }
        ]
      }
    """
  end

  defp get_json(_, _, _) do
    """
      {
        "attachments" :
        [
          {
            "pretext": "User Does not exist  ",
            "text": "user doesn't exist, please use a valid user.",
            "image_url":"http://dailynous.com/wp-content/uploads/2016/10/poop-emoji-frown.png"
          }
        ]
      }
    """

  end




  def fetchMapOfCurrentMattermostUsers(conn, params) do
    {:ok, users} = fetchMattermostUsers()

    Enum.map_every(users, 1, fn x -> createMattermostUserFromMap(x) end)

    IO.inspect(map)
    json(conn, map)
  end

  def fetchMattermostUsers(conn, params) do 
    url = "http://54.91.189.149:8065/api/v4/users"
    headers = [{"Authorization", "Bearer ih7cgnr3otd5igzkawtwrhu5ia"},
               {"Content-Type", "application/json; charset=utf-8"}]

    {:ok, response} = HTTPoison.get(url, headers)
    {:ok, json} = Jason.decode(response.body())

    size = Enum.at(json,1)
        |> Map.keys


    
    IO.inspect(size)
    
    

   
    IO.inspect(json)
    json(conn, json)
end

  def fetchMattermostUser(conn, params) do
    url = "http://54.91.189.149:8065/api/v4/users/mkeeywthbtdkpm71tb6gsc7ser"
    headers = [{"Authorization", "Bearer ih7cgnr3otd5igzkawtwrhu5ia"},
               {"Content-Type", "application/json; charset=utf-8"}]

  {:ok, response} = HTTPoison.get(url, headers)
    {:ok, json} = Jason.decode(response.body())

    keys = Map.keys(json)
    size = map_size(json)

    
    IO.inspect(size)
    
    IO.inspect(keys)
    IO.inspect(json)
    json(conn, json)
  end



end

