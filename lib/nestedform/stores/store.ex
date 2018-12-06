defmodule Nestedform.Stores.Store do
  use Ecto.Schema
  import Ecto.Changeset


  schema "stores" do
    field :city, :string
    field :name, :string
    field :state, :string
    has_one :siteinfo, Nestedform.Stores.Siteinfo

    timestamps()
  end

  @doc false
  def changeset(%Store{} = store, attrs) do
    store
    |> cast(attrs, [:name, :state, :city])
    |> validate_required([:name, :state, :city])
    |> cast_assoc(:siteinfo, required: true)
    |> unique_constraint(:name)
  end

    @doc false
  def update_changeset(%Store{} = store, attrs) do
    invoice
    |> cast(attrs, [:name, :state, :city])
    |> validate_required([:name, :state, :city])
    |> cast_assoc(:siteinfo)
  end
end
