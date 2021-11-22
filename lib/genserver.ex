defmodule UserApi.Genserver do
    use GenServer
    import Ecto.Query
    
    alias UserApi.Repo
    alias UserApi.Accounts

    def start_link(_) do
        GenServer.start_link(__MODULE__, %{max_number: random(), timestamp: nil}, name: Myserver)
    end

    @impl true
    def init(state) do
        schedule_work()
        {:ok, state}
    end

     
    def query_users() do
        GenServer.call(Myserver, :query) 
    end

    @impl true
    def handle_info(:work, state) do
        #the work to be done, update the point column with random values
       
        query = from(u in Accounts, update: [set: [points: fragment("random() * 99 + 1")]])
        Repo.update_all(query, [])
         state = %{state | max_number: random()}

        schedule_work()

        {:noreply, state}
    end

    @impl true
    def handle_call(:query, _from, %{max_number: max} = state) do
         users = from(u in Accounts, where: u.points > ^max, limit: 2)
          |> Repo.all()
       

        state = Map.put(state, :timestamp, DateTime.utc_now())

        IO.inspect(state)
        {:reply, users, state}
    end

    defp schedule_work do
        #schedule the time the work should be done.
        Process.send_after(self(), :work, 2000)
    end

    defp random do
        Enum.random(1..100)
    end
end