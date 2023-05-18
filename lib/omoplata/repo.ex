defmodule Omoplata.Repo do
  use Ecto.Repo,
    otp_app: :omoplata,
    adapter: Ecto.Adapters.Postgres
end
