# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     UserApi.Repo.insert!(%UserApi.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias UserApi.Repo
alias UserApi.Accounts

 Enum.each(1..10, fn _x -> Repo.insert(%Accounts{points: 0}) end)
  
 