defmodule NestedformWeb.InternetConnectionController do
  use NestedformWeb, :controller

  alias Nestedform.Stores
  alias Nestedform.Stores.InternetConnection

  def index(conn, _params) do
    internetconnections = Stores.list_internetconnections()
    render(conn, "index.html", internetconnections: internetconnections)
  end

  def new(conn, _params) do
    changeset = Stores.change_internet_connection(%InternetConnection{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"internet_connection" => internet_connection_params}) do
    case Stores.create_internet_connection(internet_connection_params) do
      {:ok, internet_connection} ->
        conn
        |> put_flash(:info, "Internet connection created successfully.")
        |> redirect(to: Routes.internet_connection_path(conn, :show, internet_connection))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    internet_connection = Stores.get_internet_connection!(id)
    render(conn, "show.html", internet_connection: internet_connection)
  end

  def edit(conn, %{"id" => id}) do
    internet_connection = Stores.get_internet_connection!(id)
    changeset = Stores.change_internet_connection(internet_connection)
    render(conn, "edit.html", internet_connection: internet_connection, changeset: changeset)
  end

  def update(conn, %{"id" => id, "internet_connection" => internet_connection_params}) do
    internet_connection = Stores.get_internet_connection!(id)

    case Stores.update_internet_connection(internet_connection, internet_connection_params) do
      {:ok, internet_connection} ->
        conn
        |> put_flash(:info, "Internet connection updated successfully.")
        |> redirect(to: Routes.internet_connection_path(conn, :show, internet_connection))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", internet_connection: internet_connection, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    internet_connection = Stores.get_internet_connection!(id)
    {:ok, _internet_connection} = Stores.delete_internet_connection(internet_connection)

    conn
    |> put_flash(:info, "Internet connection deleted successfully.")
    |> redirect(to: Routes.internet_connection_path(conn, :index))
  end
end
