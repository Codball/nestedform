defmodule Nestedform.Repo.Migrations.CreateSiteinfo do
  use Ecto.Migration

  def change do
    create table(:siteinfo) do
      add :store_number, :string
      add :acronym, :string
      add :sales_contact, :string
      add :service_tech, :string
      add :facilities_manager, :string
      add :street_address, :string
      add :zip, :string
      add :store_id, references(:stores, on_delete: :nothing)

      timestamps()
    end

    create index(:siteinfo, [:store_id])
  end
end
