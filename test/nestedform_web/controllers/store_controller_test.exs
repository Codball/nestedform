defmodule NestedformWeb.StoreControllerTest do
  use NestedformWeb.ConnCase

  alias Nestedform.Stores

  @create_attrs %{city: "some city", name: "some name", state: "some state"}
  @update_attrs %{city: "some updated city", name: "some updated name", state: "some updated state"}
  @invalid_attrs %{city: nil, name: nil, state: nil}

  def fixture(:store) do
    {:ok, store} = Stores.create_store(@create_attrs)
    store
  end

  describe "index" do
    test "lists all stores", %{conn: conn} do
      conn = get(conn, Routes.store_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Stores"
    end
  end

  describe "new store" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.store_path(conn, :new))
      assert html_response(conn, 200) =~ "New Store"
    end
  end

  describe "create store" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.store_path(conn, :create), store: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.store_path(conn, :show, id)

      conn = get(conn, Routes.store_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Store"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.store_path(conn, :create), store: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Store"
    end
  end

  describe "edit store" do
    setup [:create_store]

    test "renders form for editing chosen store", %{conn: conn, store: store} do
      conn = get(conn, Routes.store_path(conn, :edit, store))
      assert html_response(conn, 200) =~ "Edit Store"
    end
  end

  describe "update store" do
    setup [:create_store]

    test "redirects when data is valid", %{conn: conn, store: store} do
      conn = put(conn, Routes.store_path(conn, :update, store), store: @update_attrs)
      assert redirected_to(conn) == Routes.store_path(conn, :show, store)

      conn = get(conn, Routes.store_path(conn, :show, store))
      assert html_response(conn, 200) =~ "some updated city"
    end

    test "renders errors when data is invalid", %{conn: conn, store: store} do
      conn = put(conn, Routes.store_path(conn, :update, store), store: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Store"
    end
  end

  describe "delete store" do
    setup [:create_store]

    test "deletes chosen store", %{conn: conn, store: store} do
      conn = delete(conn, Routes.store_path(conn, :delete, store))
      assert redirected_to(conn) == Routes.store_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.store_path(conn, :show, store))
      end
    end
  end

  defp create_store(_) do
    store = fixture(:store)
    {:ok, store: store}
  end
end
