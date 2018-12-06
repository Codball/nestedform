defmodule NestedformWeb.SiteinfoControllerTest do
  use NestedformWeb.ConnCase

  alias Nestedform.Stores

  @create_attrs %{acronym: "some acronym", facilities_manager: "some facilities_manager", sales_contact: "some sales_contact", service_tech: "some service_tech", store_number: "some store_number", street_address: "some street_address", zip: "some zip"}
  @update_attrs %{acronym: "some updated acronym", facilities_manager: "some updated facilities_manager", sales_contact: "some updated sales_contact", service_tech: "some updated service_tech", store_number: "some updated store_number", street_address: "some updated street_address", zip: "some updated zip"}
  @invalid_attrs %{acronym: nil, facilities_manager: nil, sales_contact: nil, service_tech: nil, store_number: nil, street_address: nil, zip: nil}

  def fixture(:siteinfo) do
    {:ok, siteinfo} = Stores.create_siteinfo(@create_attrs)
    siteinfo
  end

  describe "index" do
    test "lists all siteinfo", %{conn: conn} do
      conn = get(conn, Routes.siteinfo_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Siteinfo"
    end
  end

  describe "new siteinfo" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.siteinfo_path(conn, :new))
      assert html_response(conn, 200) =~ "New Siteinfo"
    end
  end

  describe "create siteinfo" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.siteinfo_path(conn, :create), siteinfo: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.siteinfo_path(conn, :show, id)

      conn = get(conn, Routes.siteinfo_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Siteinfo"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.siteinfo_path(conn, :create), siteinfo: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Siteinfo"
    end
  end

  describe "edit siteinfo" do
    setup [:create_siteinfo]

    test "renders form for editing chosen siteinfo", %{conn: conn, siteinfo: siteinfo} do
      conn = get(conn, Routes.siteinfo_path(conn, :edit, siteinfo))
      assert html_response(conn, 200) =~ "Edit Siteinfo"
    end
  end

  describe "update siteinfo" do
    setup [:create_siteinfo]

    test "redirects when data is valid", %{conn: conn, siteinfo: siteinfo} do
      conn = put(conn, Routes.siteinfo_path(conn, :update, siteinfo), siteinfo: @update_attrs)
      assert redirected_to(conn) == Routes.siteinfo_path(conn, :show, siteinfo)

      conn = get(conn, Routes.siteinfo_path(conn, :show, siteinfo))
      assert html_response(conn, 200) =~ "some updated acronym"
    end

    test "renders errors when data is invalid", %{conn: conn, siteinfo: siteinfo} do
      conn = put(conn, Routes.siteinfo_path(conn, :update, siteinfo), siteinfo: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Siteinfo"
    end
  end

  describe "delete siteinfo" do
    setup [:create_siteinfo]

    test "deletes chosen siteinfo", %{conn: conn, siteinfo: siteinfo} do
      conn = delete(conn, Routes.siteinfo_path(conn, :delete, siteinfo))
      assert redirected_to(conn) == Routes.siteinfo_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.siteinfo_path(conn, :show, siteinfo))
      end
    end
  end

  defp create_siteinfo(_) do
    siteinfo = fixture(:siteinfo)
    {:ok, siteinfo: siteinfo}
  end
end
