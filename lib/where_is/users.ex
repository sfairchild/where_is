defmodule WhereIs.Users do
  use GenServer

 def start_link(_) do
    GenServer.start_link(__MODULE__, %{users: []}, name: __MODULE__)
  end

  # Callbacks

   @impl true
   def init(state) do
    users = WhereIs.MattermostUser.fetchCurrentMattermostUsersList()
    # schedule_matter_most_user_call()
     {:ok, %{users: users}}
  end

  def get_users do
    GenServer.call(__MODULE__, :get_users)
  end

  def handle_call(:get_users, _, state) do
    {:reply, state.users, state}
  end

  def handle_info(:work, state) do
    users = WhereIs.MattermostUser.fetchCurrentMattermostUsersList()

    #after doing the work; schedule more work
    #kind of like sisyphus if you think about it;
    #you push the proverbial boulder up a hill, only for it to fall down again; and in 12 hours;
    #you push the boulder up again
    schedule_matter_most_user_call()

    {:noreply, %{state | users: users}}
  end

  #call mattermost users every 12 hours
  defp schedule_matter_most_user_call() do
    :timer.sleep(4000);
    send self(), :work
  end

#
end

#needed functions
#update user
#make list
