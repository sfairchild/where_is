# WhereIs

To start your Phoenix server:

  * Install dependencies with `mix deps.get`
  * Install Node.js dependencies with `cd assets && npm install`

  * Set your environmental Variables 
  	- We currently use Environmental Variables to store Tokens for accessing MatterMost and Nexient.Rooms
  		ROOMS_TOKEN: To get the Rooms token you will need to log in to 'rooms.nexient.com'. Open your browser dev tools and adjust the date/time in Rooms so there will be a call back to the server. In the dev tools 'network' tab, click on any of the calls. In the call click on the 'Headers' tab and look for the "X-Rooms-Authorization:" under 'Request Headers'. You will need to copy the Token, including the "Bearer". It will look something like this (Bearer eyxxxxxxxxxxxxxxxxxxxxxxx...). You will need to assign this to an environmental variable 'ROOMS_TOKEN'.

  		MATTERMOST_TOKEN: To get the MatterMost token you will need to log in to 'chat.nexient.com'. MatterMost stores its token in a cookie. Access the cookies however you prefer. In Firefox and Crome you can click on the lock symbol to the left of the address in the address bar. In Safari you can open your browser dev tools and the 'cookies' are under the 'storage' tab. IE or Edge, Figure it out I guess. "https://chat.nexient.com" will have a cookie named "MMAUTHTOKEN". Copy the String in the 'value' column. You will need to assign this Sting to an environmental variable 'MATTERMOST_TOKEN'.

  * Start Phoenix endpoint with `mix phx.server`


Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](https://hexdocs.pm/phoenix/deployment.html).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: https://hexdocs.pm/phoenix/overview.html
  * Docs: https://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
