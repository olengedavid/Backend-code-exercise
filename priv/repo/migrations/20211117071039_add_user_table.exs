defmodule UserApi.Repo.Migrations.AddUserTable do
  use Ecto.Migration

  def change do
    create table("users") do
      add :points, :integer

    timestamps()
    end
  end
end
