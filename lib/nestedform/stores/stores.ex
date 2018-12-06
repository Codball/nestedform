defmodule Nestedform.Stores do
  @moduledoc """
  The Stores context.
  """

  import Ecto.Query, warn: false
  alias Nestedform.Repo

  alias Nestedform.Stores.Store

  @doc """
  Returns the list of stores.

  ## Examples

      iex> list_stores()
      [%Store{}, ...]

  """
  def list_stores do
    Repo.all(Store)
  end

  @doc """
  Gets a single store.

  Raises `Ecto.NoResultsError` if the Store does not exist.

  ## Examples

      iex> get_store!(123)
      %Store{}

      iex> get_store!(456)
      ** (Ecto.NoResultsError)

  """
  def get_store!(id), do: Repo.get!(Store, id) |> Repo.preload(:siteinfo)

  @doc """
  Creates a store.

  ## Examples

      iex> create_store(%{field: value})
      {:ok, %Store{}}

      iex> create_store(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  #def create_store(attrs \\ %{}) do
  #  %Store{}
  #  |> Store.changeset(attrs)
  #  |> Repo.insert()
  #end

  @doc """
  Updates a store.

  ## Examples

      iex> update_store(store, %{field: new_value})
      {:ok, %Store{}}

      iex> update_store(store, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_store(%Store{} = store, attrs) do
    store
    |> Store.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Store.

  ## Examples

      iex> delete_store(store)
      {:ok, %Store{}}

      iex> delete_store(store)
      {:error, %Ecto.Changeset{}}

  """
  def delete_store(%Store{} = store) do
    Repo.delete(store)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking store changes.

  ## Examples

      iex> change_store(store)
      %Ecto.Changeset{source: %Store{}}

  """
  def change_store(%Store{} = store) do
    Store.changeset(store, %{})
  end


  def add_records(%{store: store}, attrs) do
    records =
      Enum.map(attrs["siteinfo"], fn {_, d} ->
        Map.put(d, "store_id", store.id)
      end)
      |> Enum.map(
        &Nestedform.Stores.Siteinfo.changeset(%Nestedform.Stores.Siteinfo{}, &1)
      )
      |> Enum.map(fn ch -> {:ok, _d} = Repo.insert(ch) end)

    {:ok, records}
  end

  def save_store(store_changeset, attrs) do
    Multi.new()
    |> Multi.insert(:store, store_changeset)
    |> Multi.run(:add_siteinfo, &add_records(&1, attrs))
  end

  def create_store(attrs \\ %{}) do
    store_changeset =
      %Store{}
      |> Store.changeset(attrs)

    case Repo.transaction(save_store(store_changeset, attrs)) do
      {:ok, %{store: store, add_siteinfo: _siteinfo}} ->
        {:ok, store}

      {:error, _failed_operation, _failed_value, _changes_so_far} ->
        {:error, store_changeset}
    end
  end


  alias Nestedform.Stores.Siteinfo

  @doc """
  Returns the list of siteinfo.

  ## Examples

      iex> list_siteinfo()
      [%Siteinfo{}, ...]

  """
  def list_siteinfo do
    Repo.all(Siteinfo)
  end

  @doc """
  Gets a single siteinfo.

  Raises `Ecto.NoResultsError` if the Siteinfo does not exist.

  ## Examples

      iex> get_siteinfo!(123)
      %Siteinfo{}

      iex> get_siteinfo!(456)
      ** (Ecto.NoResultsError)

  """
  def get_siteinfo!(id), do: Repo.get!(Siteinfo, id)

  @doc """
  Creates a siteinfo.

  ## Examples

      iex> create_siteinfo(%{field: value})
      {:ok, %Siteinfo{}}

      iex> create_siteinfo(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_siteinfo(attrs \\ %{}) do
    %Siteinfo{}
    |> Siteinfo.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a siteinfo.

  ## Examples

      iex> update_siteinfo(siteinfo, %{field: new_value})
      {:ok, %Siteinfo{}}

      iex> update_siteinfo(siteinfo, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_siteinfo(%Siteinfo{} = siteinfo, attrs) do
    siteinfo
    |> Siteinfo.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Siteinfo.

  ## Examples

      iex> delete_siteinfo(siteinfo)
      {:ok, %Siteinfo{}}

      iex> delete_siteinfo(siteinfo)
      {:error, %Ecto.Changeset{}}

  """
  def delete_siteinfo(%Siteinfo{} = siteinfo) do
    Repo.delete(siteinfo)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking siteinfo changes.

  ## Examples

      iex> change_siteinfo(siteinfo)
      %Ecto.Changeset{source: %Siteinfo{}}

  """
  def change_siteinfo(%Siteinfo{} = siteinfo) do
    Siteinfo.changeset(siteinfo, %{})
  end
end
