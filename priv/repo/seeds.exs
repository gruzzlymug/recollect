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
alias Recollect.Album

#Repo.insert!(%Album{title: "", artist: "", label: "", year: 1990, condition: "Good"})
Repo.insert!(%Album{title: "Sticky Fingers", artist: "Rolling Stones", label: "Rolling Stones", year: 1971, condition: "Good"})
Repo.insert!(%Album{title: "Some Girls", artist: "Rolling Stones", label: "Rolling Stones", year: 1978, condition: "Good"})
Repo.insert!(%Album{title: "Licensed to Ill", artist: "Beastie Boys", label: "Def Jam", year: 1986, condition: "Good"})
Repo.insert!(%Album{title: "Paul's Boutique", artist: "Beastie Boys", label: "Capitol", year: 1989, condition: "Good"})
Repo.insert!(%Album{title: "Damaged", artist: "Black Flag", label: "SST Records", year: 1981, condition: "Good"})
Repo.insert!(%Album{title: "The Bends", artist: "Radiohead", label: "Parlophone", year: 1995, condition: "Good"})
Repo.insert!(%Album{title: "OK Computer", artist: "Radiohead", label: "Parlophone", year: 1997, condition: "Good"})
Repo.insert!(%Album{title: "Kid A", artist: "Radiohead", label: "Parlophone", year: 2000, condition: "Good"})
Repo.insert!(%Album{title: "The Roots of Dub", artist: "King Tubby", label: "Total Sounds", year: 1974, condition: "Good"})
Repo.insert!(%Album{title: "No Strings Attached", artist: "NSYNC", label: "Jive", year: 2000, condition: "Good"})
Repo.insert!(%Album{title: "Are You In or Out?", artist: "The Growlers", label: "Everloving Records", year: 2009, condition: "Good"})
Repo.insert!(%Album{title: "Hung at Heart", artist: "The Growlers", label: "Everloving Records", year: 2013, condition: "Good"})
Repo.insert!(%Album{title: "Chinese Fountain", artist: "The Growlers", label: "Everloving Records", year: 2014, condition: "Good"})
Repo.insert!(%Album{title: "Light Up Gold", artist: "Parquet Courts", label: "Dull Tools", year: 2012, condition: "Good"})
Repo.insert!(%Album{title: "Desire Lines", artist: "Camera Obscura", label: "4AD", year: 2013, condition: "Good"})
Repo.insert!(%Album{title: "Black Sabbath", artist: "Black Sabbath", label: "Vertigo", year: 1970, condition: "Good"})
Repo.insert!(%Album{title: "Paranoid", artist: "Black Sabbath", label: "Vertigo", year: 1971, condition: "Good"})
Repo.insert!(%Album{title: "Master of Reality", artist: "Black Sabbath", label: "Vertigo", year: 1971, condition: "Good"})
Repo.insert!(%Album{title: "Sabotage", artist: "Black Sabbath", label: "Vertigo", year: 1975, condition: "Good"})
#Repo.insert!(%Album{title: "", artist: "", label: "", year: 1990, condition: "Good"})
#Repo.insert!(%Album{title: "", artist: "", label: "", year: 1990, condition: "Good"})
#Repo.insert!(%Album{title: "", artist: "", label: "", year: 1990, condition: "Good"})
