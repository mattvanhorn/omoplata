defmodule Omoplata.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      OmoplataWeb.Telemetry,
      # Start the Ecto repository
      Omoplata.Repo,
      # Start the PubSub system
      {Phoenix.PubSub, name: Omoplata.PubSub},
      # Start Finch
      {Finch, name: Omoplata.Finch},
      # Start the Endpoint (http/https)
      OmoplataWeb.Endpoint
      # Start a worker by calling: Omoplata.Worker.start_link(arg)
      # {Omoplata.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Omoplata.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    OmoplataWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
