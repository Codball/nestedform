defmodule Nestedform.Repo do
  use Ecto.Repo,
    otp_app: :nestedform,
    adapter: Ecto.Adapters.Postgres
end
