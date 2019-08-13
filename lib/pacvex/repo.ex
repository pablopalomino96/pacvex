defmodule Pacvex.Repo do
  use Ecto.Repo,
    otp_app: :pacvex,
    adapter: Ecto.Adapters.Postgres
end
