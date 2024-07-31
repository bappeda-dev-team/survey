defmodule Survey.Kuesioners do
  @moduledoc """
  The Kuesioners context.
  """

  import Ecto.Query, warn: false
  alias Survey.Repo

  alias Survey.Kuesioners.Kuesioner

  @doc """
  Returns the list of kuesioners.

  ## Examples

      iex> list_kuesioners()
      [%Kuesioner{}, ...]

  """
  def list_kuesioners do
    Repo.all(Kuesioner)
  end

  @doc """
  Gets a single kuesioner.

  Raises `Ecto.NoResultsError` if the Kuesioner does not exist.

  ## Examples

      iex> get_kuesioner!(123)
      %Kuesioner{}

      iex> get_kuesioner!(456)
      ** (Ecto.NoResultsError)

  """
  def get_kuesioner!(id), do: Repo.get!(Kuesioner, id)

  @doc """
  Creates a kuesioner.

  ## Examples

      iex> create_kuesioner(%{field: value})
      {:ok, %Kuesioner{}}

      iex> create_kuesioner(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_kuesioner(attrs \\ %{}) do
    %Kuesioner{}
    |> Kuesioner.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a kuesioner.

  ## Examples

      iex> update_kuesioner(kuesioner, %{field: new_value})
      {:ok, %Kuesioner{}}

      iex> update_kuesioner(kuesioner, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_kuesioner(%Kuesioner{} = kuesioner, attrs) do
    kuesioner
    |> Kuesioner.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a kuesioner.

  ## Examples

      iex> delete_kuesioner(kuesioner)
      {:ok, %Kuesioner{}}

      iex> delete_kuesioner(kuesioner)
      {:error, %Ecto.Changeset{}}

  """
  def delete_kuesioner(%Kuesioner{} = kuesioner) do
    Repo.delete(kuesioner)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking kuesioner changes.

  ## Examples

      iex> change_kuesioner(kuesioner)
      %Ecto.Changeset{data: %Kuesioner{}}

  """
  def change_kuesioner(%Kuesioner{} = kuesioner, attrs \\ %{}) do
    Kuesioner.changeset(kuesioner, attrs)
  end
end
