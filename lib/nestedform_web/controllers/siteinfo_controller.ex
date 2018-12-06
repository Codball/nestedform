defmodule NestedformWeb.SiteinfoController do
  use NestedformWeb, :controller

  alias Nestedform.Stores
  alias Nestedform.Stores.Siteinfo

  def index(conn, _params) do
    siteinfo = Stores.list_siteinfo()
    render(conn, "index.html", siteinfo: siteinfo)
  end

  def new(conn, _params) do
    changeset = Stores.change_siteinfo(%Siteinfo{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"siteinfo" => siteinfo_params}) do
    case Stores.create_siteinfo(siteinfo_params) do
      {:ok, siteinfo} ->
        conn
        |> put_flash(:info, "Siteinfo created successfully.")
        |> redirect(to: Routes.siteinfo_path(conn, :show, siteinfo))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    siteinfo = Stores.get_siteinfo!(id)
    render(conn, "show.html", siteinfo: siteinfo)
  end

  def edit(conn, %{"id" => id}) do
    siteinfo = Stores.get_siteinfo!(id)
    changeset = Stores.change_siteinfo(siteinfo)
    render(conn, "edit.html", siteinfo: siteinfo, changeset: changeset)
  end

  def update(conn, %{"id" => id, "siteinfo" => siteinfo_params}) do
    siteinfo = Stores.get_siteinfo!(id)

    case Stores.update_siteinfo(siteinfo, siteinfo_params) do
      {:ok, siteinfo} ->
        conn
        |> put_flash(:info, "Siteinfo updated successfully.")
        |> redirect(to: Routes.siteinfo_path(conn, :show, siteinfo))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", siteinfo: siteinfo, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    siteinfo = Stores.get_siteinfo!(id)
    {:ok, _siteinfo} = Stores.delete_siteinfo(siteinfo)

    conn
    |> put_flash(:info, "Siteinfo deleted successfully.")
    |> redirect(to: Routes.siteinfo_path(conn, :index))
  end
end
