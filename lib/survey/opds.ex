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
end
