defmodule Api.Router do
  use Plug.Router

  alias Api.Controllers.BaseController

  plug :match
  plug :dispatch

  get "/", do: BaseController.index(conn, %{})

  match _ do
    response = %{
      error: true,
      status: 404,
      message: "Not found"
    }

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(404, Jason.encode!(response))
  end
end