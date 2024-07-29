defmodule Survey.Penduduks do
  @moduledoc """
  The Penduduks context.
  """

  import Ecto.Query, warn: false
  alias Survey.Repo

  alias Survey.Penduduks.Penduduk

  @doc """
  Returns the list of penduduks.

  ## Examples

      iex> list_penduduks()
      [%Penduduk{}, ...]

  """
  def list_penduduks do
    Repo.all(Penduduk)
  end

  @doc """
  Gets a single penduduk.

  Raises `Ecto.NoResultsError` if the Penduduk does not exist.

  ## Examples

      iex> get_penduduk!(123)
      %Penduduk{}

      iex> get_penduduk!(456)
      ** (Ecto.NoResultsError)

  """
  def get_penduduk!(id), do: Repo.get!(Penduduk, id)

  @doc """
  Creates a penduduk.

  ## Examples

      iex> create_penduduk(%{field: value})
      {:ok, %Penduduk{}}

      iex> create_penduduk(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_penduduk(attrs \\ %{}) do
    %Penduduk{}
    |> Penduduk.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a penduduk.

  ## Examples

      iex> update_penduduk(penduduk, %{field: new_value})
      {:ok, %Penduduk{}}

      iex> update_penduduk(penduduk, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_penduduk(%Penduduk{} = penduduk, attrs) do
    penduduk
    |> Penduduk.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a penduduk.

  ## Examples

      iex> delete_penduduk(penduduk)
      {:ok, %Penduduk{}}

      iex> delete_penduduk(penduduk)
      {:error, %Ecto.Changeset{}}

  """
  def delete_penduduk(%Penduduk{} = penduduk) do
    Repo.delete(penduduk)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking penduduk changes.

  ## Examples

      iex> change_penduduk(penduduk)
      %Ecto.Changeset{data: %Penduduk{}}

  """
  def change_penduduk(%Penduduk{} = penduduk, attrs \\ %{}) do
    Penduduk.changeset(penduduk, attrs)
  end
end
