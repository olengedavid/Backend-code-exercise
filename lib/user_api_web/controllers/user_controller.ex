defmodule UserApiWeb.UserController do
    use UserApiWeb, :controller

    alias UserApi.Genserver

    def index(conn, _params) do
       users = Genserver.query_users()
       
        render(conn, "index.json", users: users)
    end
end