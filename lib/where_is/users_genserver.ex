defmodule WhereIs.Users do
  use GenServer

 def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end


  # Callbacks

   @impl true
   def init(state) do
    call_matter_most_user_list()
     {:ok, state}
  end


  def handle_info(:work, state) do

    #call method to get userInfo

    #upload userInfo to database.



    #after doing the work; schedule more work
    #kind of like sisyphus if you think about it;
    #you push the proverbial boulder up a hill, only for it to fall down again; and in 12 hours;
    #you push the boulder up again
    call_matter_most_user_list()

    Process.send_after(self(), :work, 12 * 60 * 60 * 1000)

    {:noreply, state}
  end

  #call mattermost users every 12 hours
  defp call_matter_most_user_list() do
    
  end

#
end

#needed functions
#update user 
#make list 