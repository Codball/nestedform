defmodule Nestedform.Stores.Store do
  use Ecto.Schema
  import Ecto.Changeset

  alias Nestedform.Stores.{Store,Siteinfo,InternetConnection}

  schema "stores" do
    field :city, :string
    field :name, :string
    field :state, :string
    has_one :siteinfo, Siteinfo, on_delete: :delete_all
    has_one :internetconnections, InternetConnection, on_delete: :delete_all

    timestamps()
  end

  @doc false
  def changeset(%Store{} = store, attrs) do
    store
    |> cast(attrs, [:name, :state, :city])
    |> validate_required([:name, :state, :city])
    |> cast_assoc(:siteinfo, required: true)
    |> cast_assoc(:internetconnections, required: true)
    |> unique_constraint(:name)
  end

    @doc false
  def update_changeset(%Store{} = store, attrs) do
    store
    |> cast(attrs, [:name, :state, :city])
    |> validate_required([:name, :state, :city])
    |> cast_assoc(:siteinfo)
    |> cast_assoc(:internetconnections)
  end
end
