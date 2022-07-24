defmodule EpochWalletWeb.PageController do
  use EpochWalletWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
