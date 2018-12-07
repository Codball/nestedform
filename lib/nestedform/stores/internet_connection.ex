defmodule Nestedform.Stores.InternetConnection do
  use Ecto.Schema
  import Ecto.Changeset
  alias Nestedform.Stores.{InternetConnection,Store}

  schema "internetconnections" do
    field :account_password, :string
    field :account_pin, :integer
    field :account_username, :string
    field :int_conn_type, :string
    field :isp, :string
    field :isp_account, :string
    field :isp_support, :string
    field :network_speed, :string
    field :network_type, :string
    field :static_dns_one, :string
    field :static_dns_two, :string
    field :static_gateway, :string
    field :static_ip, :string
    field :static_subnet_mask, :string
    field :store_phone, :string
    field :delete, :boolean, virtual: true
    belongs_to :store, Store

    timestamps()
  end

  @doc false
  def changeset(%InternetConnection{} = internet_connection, attrs) do
    internet_connection
    |> cast(attrs, [:int_conn_type, :isp, :isp_account, :isp_support, :store_phone, 
                    :network_type, :network_speed, :account_username, :account_password, 
                    :account_pin, :static_ip, :static_subnet_mask, :static_gateway, :static_dns_one, 
                    :static_dns_two
                    ])
  end
  @doc false
  def update_changeset(%InternetConnection{store_id: nil}, attrs, store) do
    Ecto.build_assoc(store, :internetconnections)
    |> cast(attrs, [:int_conn_type, :isp, :isp_account, :isp_support, :store_phone, 
                    :network_type, :network_speed, :account_username, :account_password, 
                    :account_pin, :static_ip, :static_subnet_mask, :static_gateway, :static_dns_one, 
                    :static_dns_two
                    ])
    |> validate_required(:store_id)
  end

  @doc false
  def update_changeset(%InternetConnection{} = internet_connection, attrs, _store) do
    internet_connection
    |> cast(attrs, [:int_conn_type, :isp, :isp_account, :isp_support, :store_phone, 
                    :network_type, :network_speed, :account_username, :account_password, 
                    :account_pin, :static_ip, :static_subnet_mask, :static_gateway, :static_dns_one, 
                    :static_dns_two
                    ])
    |> validate_required(:store_id)
    |> mark_for_delete()
  end

  @doc false
  defp mark_for_delete(changeset) do
    if get_change(changeset, :delete) do
      %{changeset | action: :delete}
    else
      changeset
    end
  end
end
