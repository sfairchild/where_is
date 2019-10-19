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

  def find(conn, params) do
    %{"text" => text, "user_name" => user_name} = params
    userExists = WhereIs.Application.validate(text)
    if userExists do 
      imageLink = WhereIs.Application.generateUrl(text)
      #imageLink = "http://www.mattermost.org/wp-content/uploads/2016/03/logoHorizontal_WS.png"
      if imageLink do 

        #IO.inspect(text)
        {:ok, json} = 
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
              "image_url": "#{imageLink}"
            }
          ]
        }
        """
        |> Jason.decode 

        json(conn, json)
      else 
        {:ok, json} = 
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
          |> Jason.decode

          json(conn, json) 
      end

    else 
      {:ok, json} = 
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
      |> Jason.decode

      json(conn, json) 
    end
  end

end
