defmodule UserApiWeb.UserView do
    use UserApiWeb, :view

    def render("index.json", %{users: users}) do
         Enum.map(users, fn user -> %{id: user.id, points: user.points} end)  
    end
end