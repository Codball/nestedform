defmodule Nestedform.StoresTest do
  use Nestedform.DataCase

  alias Nestedform.Stores

  describe "stores" do
    alias Nestedform.Stores.Store

    @valid_attrs %{city: "some city", name: "some name", state: "some state"}
    @update_attrs %{city: "some updated city", name: "some updated name", state: "some updated state"}
    @invalid_attrs %{city: nil, name: nil, state: nil}

    def store_fixture(attrs \\ %{}) do
      {:ok, store} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Stores.create_store()

      store
    end

    test "list_stores/0 returns all stores" do
      store = store_fixture()
      assert Stores.list_stores() == [store]
    end

    test "get_store!/1 returns the store with given id" do
      store = store_fixture()
      assert Stores.get_store!(store.id) == store
    end

    test "create_store/1 with valid data creates a store" do
      assert {:ok, %Store{} = store} = Stores.create_store(@valid_attrs)
      assert store.city == "some city"
      assert store.name == "some name"
      assert store.state == "some state"
    end

    test "create_store/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stores.create_store(@invalid_attrs)
    end

    test "update_store/2 with valid data updates the store" do
      store = store_fixture()
      assert {:ok, %Store{} = store} = Stores.update_store(store, @update_attrs)
      assert store.city == "some updated city"
      assert store.name == "some updated name"
      assert store.state == "some updated state"
    end

    test "update_store/2 with invalid data returns error changeset" do
      store = store_fixture()
      assert {:error, %Ecto.Changeset{}} = Stores.update_store(store, @invalid_attrs)
      assert store == Stores.get_store!(store.id)
    end

    test "delete_store/1 deletes the store" do
      store = store_fixture()
      assert {:ok, %Store{}} = Stores.delete_store(store)
      assert_raise Ecto.NoResultsError, fn -> Stores.get_store!(store.id) end
    end

    test "change_store/1 returns a store changeset" do
      store = store_fixture()
      assert %Ecto.Changeset{} = Stores.change_store(store)
    end
  end

  describe "siteinfo" do
    alias Nestedform.Stores.Siteinfo

    @valid_attrs %{acronym: "some acronym", facilities_manager: "some facilities_manager", sales_contact: "some sales_contact", service_tech: "some service_tech", store_number: "some store_number", street_address: "some street_address", zip: "some zip"}
    @update_attrs %{acronym: "some updated acronym", facilities_manager: "some updated facilities_manager", sales_contact: "some updated sales_contact", service_tech: "some updated service_tech", store_number: "some updated store_number", street_address: "some updated street_address", zip: "some updated zip"}
    @invalid_attrs %{acronym: nil, facilities_manager: nil, sales_contact: nil, service_tech: nil, store_number: nil, street_address: nil, zip: nil}

    def siteinfo_fixture(attrs \\ %{}) do
      {:ok, siteinfo} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Stores.create_siteinfo()

      siteinfo
    end

    test "list_siteinfo/0 returns all siteinfo" do
      siteinfo = siteinfo_fixture()
      assert Stores.list_siteinfo() == [siteinfo]
    end

    test "get_siteinfo!/1 returns the siteinfo with given id" do
      siteinfo = siteinfo_fixture()
      assert Stores.get_siteinfo!(siteinfo.id) == siteinfo
    end

    test "create_siteinfo/1 with valid data creates a siteinfo" do
      assert {:ok, %Siteinfo{} = siteinfo} = Stores.create_siteinfo(@valid_attrs)
      assert siteinfo.acronym == "some acronym"
      assert siteinfo.facilities_manager == "some facilities_manager"
      assert siteinfo.sales_contact == "some sales_contact"
      assert siteinfo.service_tech == "some service_tech"
      assert siteinfo.store_number == "some store_number"
      assert siteinfo.street_address == "some street_address"
      assert siteinfo.zip == "some zip"
    end

    test "create_siteinfo/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stores.create_siteinfo(@invalid_attrs)
    end

    test "update_siteinfo/2 with valid data updates the siteinfo" do
      siteinfo = siteinfo_fixture()
      assert {:ok, %Siteinfo{} = siteinfo} = Stores.update_siteinfo(siteinfo, @update_attrs)
      assert siteinfo.acronym == "some updated acronym"
      assert siteinfo.facilities_manager == "some updated facilities_manager"
      assert siteinfo.sales_contact == "some updated sales_contact"
      assert siteinfo.service_tech == "some updated service_tech"
      assert siteinfo.store_number == "some updated store_number"
      assert siteinfo.street_address == "some updated street_address"
      assert siteinfo.zip == "some updated zip"
    end

    test "update_siteinfo/2 with invalid data returns error changeset" do
      siteinfo = siteinfo_fixture()
      assert {:error, %Ecto.Changeset{}} = Stores.update_siteinfo(siteinfo, @invalid_attrs)
      assert siteinfo == Stores.get_siteinfo!(siteinfo.id)
    end

    test "delete_siteinfo/1 deletes the siteinfo" do
      siteinfo = siteinfo_fixture()
      assert {:ok, %Siteinfo{}} = Stores.delete_siteinfo(siteinfo)
      assert_raise Ecto.NoResultsError, fn -> Stores.get_siteinfo!(siteinfo.id) end
    end

    test "change_siteinfo/1 returns a siteinfo changeset" do
      siteinfo = siteinfo_fixture()
      assert %Ecto.Changeset{} = Stores.change_siteinfo(siteinfo)
    end
  end

  describe "internetconnections" do
    alias Nestedform.Stores.InternetConnection

    @valid_attrs %{account_password: "some account_password", account_pin: 42, account_username: "some account_username", int_conn_type: "some int_conn_type", isp: "some isp", isp_account: "some isp_account", isp_support: "some isp_support", network_speed: "some network_speed", network_type: "some network_type", static_dns_one: "some static_dns_one", static_dns_two: "some static_dns_two", static_gateway: "some static_gateway", static_ip: "some static_ip", static_subnet_mask: "some static_subnet_mask", store_phone: "some store_phone"}
    @update_attrs %{account_password: "some updated account_password", account_pin: 43, account_username: "some updated account_username", int_conn_type: "some updated int_conn_type", isp: "some updated isp", isp_account: "some updated isp_account", isp_support: "some updated isp_support", network_speed: "some updated network_speed", network_type: "some updated network_type", static_dns_one: "some updated static_dns_one", static_dns_two: "some updated static_dns_two", static_gateway: "some updated static_gateway", static_ip: "some updated static_ip", static_subnet_mask: "some updated static_subnet_mask", store_phone: "some updated store_phone"}
    @invalid_attrs %{account_password: nil, account_pin: nil, account_username: nil, int_conn_type: nil, isp: nil, isp_account: nil, isp_support: nil, network_speed: nil, network_type: nil, static_dns_one: nil, static_dns_two: nil, static_gateway: nil, static_ip: nil, static_subnet_mask: nil, store_phone: nil}

    def internet_connection_fixture(attrs \\ %{}) do
      {:ok, internet_connection} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Stores.create_internet_connection()

      internet_connection
    end

    test "list_internetconnections/0 returns all internetconnections" do
      internet_connection = internet_connection_fixture()
      assert Stores.list_internetconnections() == [internet_connection]
    end

    test "get_internet_connection!/1 returns the internet_connection with given id" do
      internet_connection = internet_connection_fixture()
      assert Stores.get_internet_connection!(internet_connection.id) == internet_connection
    end

    test "create_internet_connection/1 with valid data creates a internet_connection" do
      assert {:ok, %InternetConnection{} = internet_connection} = Stores.create_internet_connection(@valid_attrs)
      assert internet_connection.account_password == "some account_password"
      assert internet_connection.account_pin == 42
      assert internet_connection.account_username == "some account_username"
      assert internet_connection.int_conn_type == "some int_conn_type"
      assert internet_connection.isp == "some isp"
      assert internet_connection.isp_account == "some isp_account"
      assert internet_connection.isp_support == "some isp_support"
      assert internet_connection.network_speed == "some network_speed"
      assert internet_connection.network_type == "some network_type"
      assert internet_connection.static_dns_one == "some static_dns_one"
      assert internet_connection.static_dns_two == "some static_dns_two"
      assert internet_connection.static_gateway == "some static_gateway"
      assert internet_connection.static_ip == "some static_ip"
      assert internet_connection.static_subnet_mask == "some static_subnet_mask"
      assert internet_connection.store_phone == "some store_phone"
    end

    test "create_internet_connection/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Stores.create_internet_connection(@invalid_attrs)
    end

    test "update_internet_connection/2 with valid data updates the internet_connection" do
      internet_connection = internet_connection_fixture()
      assert {:ok, %InternetConnection{} = internet_connection} = Stores.update_internet_connection(internet_connection, @update_attrs)
      assert internet_connection.account_password == "some updated account_password"
      assert internet_connection.account_pin == 43
      assert internet_connection.account_username == "some updated account_username"
      assert internet_connection.int_conn_type == "some updated int_conn_type"
      assert internet_connection.isp == "some updated isp"
      assert internet_connection.isp_account == "some updated isp_account"
      assert internet_connection.isp_support == "some updated isp_support"
      assert internet_connection.network_speed == "some updated network_speed"
      assert internet_connection.network_type == "some updated network_type"
      assert internet_connection.static_dns_one == "some updated static_dns_one"
      assert internet_connection.static_dns_two == "some updated static_dns_two"
      assert internet_connection.static_gateway == "some updated static_gateway"
      assert internet_connection.static_ip == "some updated static_ip"
      assert internet_connection.static_subnet_mask == "some updated static_subnet_mask"
      assert internet_connection.store_phone == "some updated store_phone"
    end

    test "update_internet_connection/2 with invalid data returns error changeset" do
      internet_connection = internet_connection_fixture()
      assert {:error, %Ecto.Changeset{}} = Stores.update_internet_connection(internet_connection, @invalid_attrs)
      assert internet_connection == Stores.get_internet_connection!(internet_connection.id)
    end

    test "delete_internet_connection/1 deletes the internet_connection" do
      internet_connection = internet_connection_fixture()
      assert {:ok, %InternetConnection{}} = Stores.delete_internet_connection(internet_connection)
      assert_raise Ecto.NoResultsError, fn -> Stores.get_internet_connection!(internet_connection.id) end
    end

    test "change_internet_connection/1 returns a internet_connection changeset" do
      internet_connection = internet_connection_fixture()
      assert %Ecto.Changeset{} = Stores.change_internet_connection(internet_connection)
    end
  end
end
