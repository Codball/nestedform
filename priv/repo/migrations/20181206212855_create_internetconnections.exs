defmodule Nestedform.Repo.Migrations.CreateInternetconnections do
  use Ecto.Migration

  def change do
    create table(:internetconnections) do
      add :int_conn_type, :string
      add :isp, :string
      add :isp_account, :string
      add :isp_support, :string
      add :store_phone, :string
      add :network_type, :string
      add :network_speed, :string
      add :account_username, :string
      add :account_password, :string
      add :account_pin, :integer
      add :static_ip, :string
      add :static_subnet_mask, :string
      add :static_gateway, :string
      add :static_dns_one, :string
      add :static_dns_two, :string
      add :store_id, references(:stores, on_delete: :nothing)

      timestamps()
    end

    create index(:internetconnections, [:store_id])
  end
end
