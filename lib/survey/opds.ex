defmodule Survey.Opds do
  @moduledoc """
  The Opds context.
  """

  import Ecto.Query, warn: false
  alias Survey.Repo

  alias Survey.Opds.Opd

  @doc """
  Returns the list of opds.

  ## Examples

      iex> list_opds()
      [%Opd{}, ...]

  """
  def list_opds do
    Repo.all(Opd)
  end

  @doc """
  Gets a single opd.

  Raises `Ecto.NoResultsError` if the Opd does not exist.

  ## Examples

      iex> get_opd!(123)
      %Opd{}

      iex> get_opd!(456)
      ** (Ecto.NoResultsError)

  """
  def get_opd!(id), do: Repo.get!(Opd, id)

  @doc """
  Creates a opd.

  ## Examples

      iex> create_opd(%{field: value})
      {:ok, %Opd{}}

      iex> create_opd(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_opd(attrs \\ %{}) do
    %Opd{}
    |> Opd.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a opd.

  ## Examples

      iex> update_opd(opd, %{field: new_value})
      {:ok, %Opd{}}

      iex> update_opd(opd, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_opd(%Opd{} = opd, attrs) do
    opd
    |> Opd.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a opd.

  ## Examples

      iex> delete_opd(opd)
      {:ok, %Opd{}}

      iex> delete_opd(opd)
      {:error, %Ecto.Changeset{}}

  """
  def delete_opd(%Opd{} = opd) do
    Repo.delete(opd)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking opd changes.

  ## Examples

      iex> change_opd(opd)
      %Ecto.Changeset{data: %Opd{}}

  """
  def change_opd(%Opd{} = opd, attrs \\ %{}) do
    Opd.changeset(opd, attrs)
  end

  alias Survey.Opds.Urusan

  @doc """
  Returns the list of urusans.

  ## Examples

      iex> list_urusans()
      [%Urusan{}, ...]

  """
  def list_urusans do
    Repo.all(Urusan)
  end

  @doc """
  Gets a single urusan.

  Raises `Ecto.NoResultsError` if the Urusan does not exist.

  ## Examples

      iex> get_urusan!(123)
      %Urusan{}

      iex> get_urusan!(456)
      ** (Ecto.NoResultsError)

  """
  def get_urusan!(id), do: Repo.get!(Urusan, id)

  @doc """
  Creates a urusan.

  ## Examples

      iex> create_urusan(%{field: value})
      {:ok, %Urusan{}}

      iex> create_urusan(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_urusan(attrs \\ %{}) do
    %Urusan{}
    |> Urusan.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a urusan.

  ## Examples

      iex> update_urusan(urusan, %{field: new_value})
      {:ok, %Urusan{}}

      iex> update_urusan(urusan, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_urusan(%Urusan{} = urusan, attrs) do
    urusan
    |> Urusan.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a urusan.

  ## Examples

      iex> delete_urusan(urusan)
      {:ok, %Urusan{}}

      iex> delete_urusan(urusan)
      {:error, %Ecto.Changeset{}}

  """
  def delete_urusan(%Urusan{} = urusan) do
    Repo.delete(urusan)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking urusan changes.

  ## Examples

      iex> change_urusan(urusan)
      %Ecto.Changeset{data: %Urusan{}}

  """
  def change_urusan(%Urusan{} = urusan, attrs \\ %{}) do
    Urusan.changeset(urusan, attrs)
  end

  alias Survey.Opds.BidangUrusan

  @doc """
  Returns the list of bidang_urusans.

  ## Examples

      iex> list_bidang_urusans()
      [%BidangUrusan{}, ...]

  """
  def list_bidang_urusans do
    Repo.all(BidangUrusan)
  end

  @doc """
  Gets a single bidang_urusan.

  Raises `Ecto.NoResultsError` if the Bidang urusan does not exist.

  ## Examples

      iex> get_bidang_urusan!(123)
      %BidangUrusan{}

      iex> get_bidang_urusan!(456)
      ** (Ecto.NoResultsError)

  """
  def get_bidang_urusan!(id), do: Repo.get!(BidangUrusan, id)

  @doc """
  Creates a bidang_urusan.

  ## Examples

      iex> create_bidang_urusan(%{field: value})
      {:ok, %BidangUrusan{}}

      iex> create_bidang_urusan(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_bidang_urusan(attrs \\ %{}) do
    %BidangUrusan{}
    |> BidangUrusan.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a bidang_urusan.

  ## Examples

      iex> update_bidang_urusan(bidang_urusan, %{field: new_value})
      {:ok, %BidangUrusan{}}

      iex> update_bidang_urusan(bidang_urusan, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_bidang_urusan(%BidangUrusan{} = bidang_urusan, attrs) do
    bidang_urusan
    |> BidangUrusan.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a bidang_urusan.

  ## Examples

      iex> delete_bidang_urusan(bidang_urusan)
      {:ok, %BidangUrusan{}}

      iex> delete_bidang_urusan(bidang_urusan)
      {:error, %Ecto.Changeset{}}

  """
  def delete_bidang_urusan(%BidangUrusan{} = bidang_urusan) do
    Repo.delete(bidang_urusan)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking bidang_urusan changes.

  ## Examples

      iex> change_bidang_urusan(bidang_urusan)
      %Ecto.Changeset{data: %BidangUrusan{}}

  """
  def change_bidang_urusan(%BidangUrusan{} = bidang_urusan, attrs \\ %{}) do
    BidangUrusan.changeset(bidang_urusan, attrs)
  end
end
