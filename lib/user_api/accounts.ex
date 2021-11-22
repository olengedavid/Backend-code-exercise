defmodule UserApi.Accounts do
    use Ecto.Schema
    import Ecto.Changeset

    schema "users" do
        field :points, :integer, default: 0

        timestamps()
    end

    def changeset(user, params \\%{}) do
        user 
        |> cast(params, [:points])
        |> validate_inclusion(:points, 0..100)
    end
end