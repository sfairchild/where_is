defmodule WhereIsWeb.PageController do
  use WhereIsWeb, :controller

  def index(conn, _params) do
     {:ok, json} = """
            {
            "attachments": [
            {
            "fallback": "test",
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

  def test1(conn, params) do
    #IO.inspect(conn)
    #IO.inspect(conn["text"])
    text = params["text"]
    user_name = params["user_name"]

    IO.inspect(params["text"])
    #tester = WhereIs.Methodologies._return_text() 
    {:ok, json} = """
      {
        "stuffs":
        {
          "response1":"hello #{user_name}",
          "response2": "you said #{text}", 
          "ha":"ha"
        }
      }
      """
    |> Jason.decode 

    json(conn, json)
  end

end
