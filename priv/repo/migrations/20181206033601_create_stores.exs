defmodule Nestedform.Repo.Migrations.CreateStores do
  use Ecto.Migration

  def change do
    create table(:stores) do
      add :name, :string
      add :state, :string
      add :city, :string

      timestamps()
    end

    create unique_index(:stores, [:name])
  end
end
