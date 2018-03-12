defmodule Recollect.Repo do
  use Ecto.Repo, otp_app: :recollect
  use Scrivener, page_size: 8
end
