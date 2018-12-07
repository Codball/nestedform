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


  def create_store(attrs \\ %{}) do
    %Store{}
    |> Store.changeset(attrs)
    |> Repo.insert()
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

  alias Nestedform.Stores.InternetConnection

  @doc """
  Returns the list of internetconnections.

  ## Examples

      iex> list_internetconnections()
      [%InternetConnection{}, ...]

  """
  def list_internetconnections do
    Repo.all(InternetConnection)
  end

  @doc """
  Gets a single internet_connection.

  Raises `Ecto.NoResultsError` if the Internet connection does not exist.

  ## Examples

      iex> get_internet_connection!(123)
      %InternetConnection{}

      iex> get_internet_connection!(456)
      ** (Ecto.NoResultsError)

  """
  def get_internet_connection!(id), do: Repo.get!(InternetConnection, id)

  @doc """
  Creates a internet_connection.

  ## Examples

      iex> create_internet_connection(%{field: value})
      {:ok, %InternetConnection{}}

      iex> create_internet_connection(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_internet_connection(attrs \\ %{}) do
    %InternetConnection{}
    |> InternetConnection.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a internet_connection.

  ## Examples

      iex> update_internet_connection(internet_connection, %{field: new_value})
      {:ok, %InternetConnection{}}

      iex> update_internet_connection(internet_connection, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_internet_connection(%InternetConnection{} = internet_connection, attrs) do
    internet_connection
    |> InternetConnection.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a InternetConnection.

  ## Examples

      iex> delete_internet_connection(internet_connection)
      {:ok, %InternetConnection{}}

      iex> delete_internet_connection(internet_connection)
      {:error, %Ecto.Changeset{}}

  """
  def delete_internet_connection(%InternetConnection{} = internet_connection) do
    Repo.delete(internet_connection)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking internet_connection changes.

  ## Examples

      iex> change_internet_connection(internet_connection)
      %Ecto.Changeset{source: %InternetConnection{}}

  """
  def change_internet_connection(%InternetConnection{} = internet_connection) do
    InternetConnection.changeset(internet_connection, %{})
  end
end
