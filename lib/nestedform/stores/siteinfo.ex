defmodule Nestedform.Stores.Siteinfo do
  use Ecto.Schema
  import Ecto.Changeset
  alias Nestedform.Stores.Siteinfo

  schema "siteinfo" do
    field :acronym, :string
    field :facilities_manager, :string
    field :sales_contact, :string
    field :service_tech, :string
    field :store_number, :string
    field :street_address, :string
    field :zip, :string
    belongs_to :store, Nestedform.Stores.Store

    timestamps()
  end

  @doc false
  def changeset(%Siteinfo{} = siteinfo, attrs) do
    siteinfo
    |> cast(attrs, [:store_number, :acronym, :sales_contact, :service_tech, :facilities_manager, :street_address, :zip])
    |> validate_required([:store_number])
  end

  @doc false
  def update_changeset(%Siteinfo{store_id: nil}, attrs, store) do
    Ecto.build_assoc(store, :siteinfo)
    |> cast(attrs, [:store_number, :acronym, :sales_contact, :service_tech, :facilities_manager, :street_address, :zip, :store_id])
    |> validate_required([:store_number, :store_id])
  end

  @doc false
  def update_changeset(%Siteinfo{} = siteinfo, attrs, _store) do
    siteinfo
    |> cast(attrs, [:store_number, :acronym, :sales_contact, :service_tech, :facilities_manager, :street_address, :zip, :delete])
    |> validate_required([:store_number, :store_id])
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
