defmodule EpochWallet.Repo do
  use Ecto.Repo,
    otp_app: :epochwallet,
    adapter: Ecto.Adapters.SQLite3
end
