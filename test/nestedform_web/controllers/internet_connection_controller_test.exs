defmodule NestedformWeb.InternetConnectionControllerTest do
  use NestedformWeb.ConnCase

  alias Nestedform.Stores

  @create_attrs %{account_password: "some account_password", account_pin: 42, account_username: "some account_username", int_conn_type: "some int_conn_type", isp: "some isp", isp_account: "some isp_account", isp_support: "some isp_support", network_speed: "some network_speed", network_type: "some network_type", static_dns_one: "some static_dns_one", static_dns_two: "some static_dns_two", static_gateway: "some static_gateway", static_ip: "some static_ip", static_subnet_mask: "some static_subnet_mask", store_phone: "some store_phone"}
  @update_attrs %{account_password: "some updated account_password", account_pin: 43, account_username: "some updated account_username", int_conn_type: "some updated int_conn_type", isp: "some updated isp", isp_account: "some updated isp_account", isp_support: "some updated isp_support", network_speed: "some updated network_speed", network_type: "some updated network_type", static_dns_one: "some updated static_dns_one", static_dns_two: "some updated static_dns_two", static_gateway: "some updated static_gateway", static_ip: "some updated static_ip", static_subnet_mask: "some updated static_subnet_mask", store_phone: "some updated store_phone"}
  @invalid_attrs %{account_password: nil, account_pin: nil, account_username: nil, int_conn_type: nil, isp: nil, isp_account: nil, isp_support: nil, network_speed: nil, network_type: nil, static_dns_one: nil, static_dns_two: nil, static_gateway: nil, static_ip: nil, static_subnet_mask: nil, store_phone: nil}

  def fixture(:internet_connection) do
    {:ok, internet_connection} = Stores.create_internet_connection(@create_attrs)
    internet_connection
  end

  describe "index" do
    test "lists all internetconnections", %{conn: conn} do
      conn = get(conn, Routes.internet_connection_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Internetconnections"
    end
  end

  describe "new internet_connection" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.internet_connection_path(conn, :new))
      assert html_response(conn, 200) =~ "New Internet connection"
    end
  end

  describe "create internet_connection" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.internet_connection_path(conn, :create), internet_connection: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.internet_connection_path(conn, :show, id)

      conn = get(conn, Routes.internet_connection_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Internet connection"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.internet_connection_path(conn, :create), internet_connection: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Internet connection"
    end
  end

  describe "edit internet_connection" do
    setup [:create_internet_connection]

    test "renders form for editing chosen internet_connection", %{conn: conn, internet_connection: internet_connection} do
      conn = get(conn, Routes.internet_connection_path(conn, :edit, internet_connection))
      assert html_response(conn, 200) =~ "Edit Internet connection"
    end
  end

  describe "update internet_connection" do
    setup [:create_internet_connection]

    test "redirects when data is valid", %{conn: conn, internet_connection: internet_connection} do
      conn = put(conn, Routes.internet_connection_path(conn, :update, internet_connection), internet_connection: @update_attrs)
      assert redirected_to(conn) == Routes.internet_connection_path(conn, :show, internet_connection)

      conn = get(conn, Routes.internet_connection_path(conn, :show, internet_connection))
      assert html_response(conn, 200) =~ "some updated account_password"
    end

    test "renders errors when data is invalid", %{conn: conn, internet_connection: internet_connection} do
      conn = put(conn, Routes.internet_connection_path(conn, :update, internet_connection), internet_connection: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Internet connection"
    end
  end

  describe "delete internet_connection" do
    setup [:create_internet_connection]

    test "deletes chosen internet_connection", %{conn: conn, internet_connection: internet_connection} do
      conn = delete(conn, Routes.internet_connection_path(conn, :delete, internet_connection))
      assert redirected_to(conn) == Routes.internet_connection_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.internet_connection_path(conn, :show, internet_connection))
      end
    end
  end

  defp create_internet_connection(_) do
    internet_connection = fixture(:internet_connection)
    {:ok, internet_connection: internet_connection}
  end
end
