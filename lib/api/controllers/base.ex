defmodule Api.Controllers.BaseController do
  import Plug.Conn

  def index(conn, _params) do
    response = %{
      error: false,
      message: "Welcome to the penis api!"
    }

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(response))
  end
end