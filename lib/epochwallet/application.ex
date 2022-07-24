defmodule EpochWallet.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      EpochWallet.Repo,
      # Start the Telemetry supervisor
      EpochWalletWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: EpochWallet.PubSub},
      # Start the Endpoint (http/https)
      EpochWalletWeb.Endpoint
      # Start a worker by calling: EpochWallet.Worker.start_link(arg)
      # {EpochWallet.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: EpochWallet.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    EpochWalletWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
