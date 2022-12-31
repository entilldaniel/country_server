defmodule ServerApp.Router do
  use Plug.Router
  alias ServerApp.World.{Country, City, Repo}
  import Ecto.Query
  
  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "Hello! #{get_name(conn.query_string)}")
  end

  get "/city/:code" do
    query = from(City, where: [country_code: ^code])
    result = Repo.all(query)
    cities = Enum.map(result, fn c -> c.name end);

    conn = put_resp_content_type(conn, "application/json")
    if Enum.empty?(cities) do
      send_resp(conn, 404, "Not cities found for #{code}")
    else
      #send_resp(conn, 200, Enum.join(cities, ", "))
      send_resp(conn, 200, Jason.encode!(cities))
    end
  end
  
  get "/country/:code" do
    country = Repo.get_by!(Country, code: code)

    conn
    |> put_resp_content_type("application/json")
    |> send_resp(200, Jason.encode!(country))
  end

  match _ do
    send_resp(conn, 404, "Not Found")
  end

  defp get_name(query) do
    [_, value | _] = String.split query, "="
    value
  end
end



