# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Recollect.Repo.insert!(%Recollect.SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will halt execution if something goes wrong.
alias Recollect.Repo
alias Recollect.Artist
alias Recollect.Label

for artist <- ~w(Radiohead Boredoms) do
  Repo.insert!(%Artist{name: artist})
end

for label <- ~w(Parlophone Avant) do
  Repo.insert!(%Label{name: label})
end
