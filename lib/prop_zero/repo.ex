defmodule PropZero.Repo do
  use Ecto.Repo,
    otp_app: :prop_zero,
    adapter: Ecto.Adapters.Postgres
end
