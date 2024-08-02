defmodule Survey.Respons do
  @moduledoc """
  The Respons context.
  """

  import Ecto.Query, warn: false
  alias Survey.Repo

  alias Survey.Respons.Peserta

  @doc """
  Returns the list of pesertas.

  ## Examples

      iex> list_pesertas()
      [%Peserta{}, ...]

  """
  def list_pesertas do
    Repo.all(Peserta)
  end

  @doc """
  Gets a single peserta.

  Raises `Ecto.NoResultsError` if the Peserta does not exist.

  ## Examples

      iex> get_peserta!(123)
      %Peserta{}

      iex> get_peserta!(456)
      ** (Ecto.NoResultsError)

  """
  def get_peserta!(id), do: Repo.get!(Peserta, id)

  @doc """
  Creates a peserta.

  ## Examples

      iex> create_peserta(%{field: value})
      {:ok, %Peserta{}}

      iex> create_peserta(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_peserta(attrs \\ %{}) do
    %Peserta{}
    |> Peserta.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a peserta.

  ## Examples

      iex> update_peserta(peserta, %{field: new_value})
      {:ok, %Peserta{}}

      iex> update_peserta(peserta, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_peserta(%Peserta{} = peserta, attrs) do
    peserta
    |> Peserta.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a peserta.

  ## Examples

      iex> delete_peserta(peserta)
      {:ok, %Peserta{}}

      iex> delete_peserta(peserta)
      {:error, %Ecto.Changeset{}}

  """
  def delete_peserta(%Peserta{} = peserta) do
    Repo.delete(peserta)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking peserta changes.

  ## Examples

      iex> change_peserta(peserta)
      %Ecto.Changeset{data: %Peserta{}}

  """
  def change_peserta(%Peserta{} = peserta, attrs \\ %{}) do
    Peserta.changeset(peserta, attrs)
  end

  def jenis_identitas_peserta_opts() do
    ["KTP", "Baru"]
  end

  def tahun_peserta_opts() do
    2019..2029
  end
end
