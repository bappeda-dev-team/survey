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
  def get_kuesioner!(id) do
    Repo.get!(Kuesioner, id)
    |> Repo.preload([:pesertas, nama_datas: [:bidang_urusan]])
  end

  @doc """
  Gets a single kuesioner with pertanyaan from nama_data.

  Raises `Ecto.NoResultsError` if the Kuesioner does not exist.

  ## Examples

      iex> get_pertanyaan_kuesioner!(123)
      %Kuesioner{
      ....,
      nama_datas:[
        %Survey.Kuesioners.NamaData{
          ....,
          bidang_urusan: %Survey.Opds.BidangUrusan{....},
          pertanyaans: [
            %Survey.Kuesioners.Pertanyaan{
            ...}]
        }]
      }

      iex> get_pertanyaan_kuesioner!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pertanyaan_kuesioner!(id) do
    Repo.get!(Kuesioner, id)
    |> Repo.preload(nama_datas: [:bidang_urusan, :pertanyaans])
  end

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

  alias Survey.Kuesioners.NamaData

  @doc """
  Returns the list of nama_datas.

  ## Examples

      iex> list_nama_datas()
      [%NamaData{}, ...]

  """
  def list_nama_datas do
    Repo.all(NamaData)
    |> Repo.preload(:bidang_urusan)
    |> Enum.filter(fn nd -> not is_nil(nd.kode_bidang_urusan) end)
  end

  @doc """
  Gets a single nama_data.

  Raises `Ecto.NoResultsError` if the Nama data does not exist.

  ## Examples

      iex> get_nama_data!(123)
      %NamaData{}

      iex> get_nama_data!(456)
      ** (Ecto.NoResultsError)

  """
  def get_nama_data!(id),
    do: Repo.get!(NamaData, id) |> Repo.preload([:bidang_urusan, :pertanyaans])

  @doc """
  Creates a nama_data.

  ## Examples

      iex> create_nama_data(%{field: value})
      {:ok, %NamaData{}}

      iex> create_nama_data(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_nama_data(attrs \\ %{}) do
    %NamaData{}
    |> NamaData.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a nama_data.

  ## Examples

      iex> update_nama_data(nama_data, %{field: new_value})
      {:ok, %NamaData{}}

      iex> update_nama_data(nama_data, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_nama_data(%NamaData{} = nama_data, attrs) do
    nama_data
    |> NamaData.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a nama_data.

  ## Examples

      iex> delete_nama_data(nama_data)
      {:ok, %NamaData{}}

      iex> delete_nama_data(nama_data)
      {:error, %Ecto.Changeset{}}

  """
  def delete_nama_data(%NamaData{} = nama_data) do
    Repo.delete(nama_data)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking nama_data changes.

  ## Examples

      iex> change_nama_data(nama_data)
      %Ecto.Changeset{data: %NamaData{}}

  """
  def change_nama_data(%NamaData{} = nama_data, attrs \\ %{}) do
    NamaData.changeset(nama_data, attrs)
  end

  alias Survey.Kuesioners.Pertanyaan

  @doc """
  Returns the list of pertanyaans.

  ## Examples

      iex> list_pertanyaans()
      [%Pertanyaan{}, ...]

  """
  def list_pertanyaans do
    Repo.all(Pertanyaan)
    |> Repo.preload(:nama_data)
    |> Enum.filter(fn p -> not is_nil(p.nama_data_id) end)
  end

  @doc """
  Gets a single pertanyaan.

  Raises `Ecto.NoResultsError` if the Pertanyaan does not exist.

  ## Examples

      iex> get_pertanyaan!(123)
      %Pertanyaan{}

      iex> get_pertanyaan!(456)
      ** (Ecto.NoResultsError)

  """
  def get_pertanyaan!(id) do
    Repo.get!(Pertanyaan, id)
    |> Repo.preload([:nama_data, :jawabans])
  end

  @doc """
  Creates a pertanyaan.

  ## Examples

      iex> create_pertanyaan(%{field: value})
      {:ok, %Pertanyaan{}}

      iex> create_pertanyaan(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_pertanyaan(attrs \\ %{}) do
    %Pertanyaan{}
    |> Pertanyaan.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a pertanyaan.

  ## Examples

      iex> update_pertanyaan(pertanyaan, %{field: new_value})
      {:ok, %Pertanyaan{}}

      iex> update_pertanyaan(pertanyaan, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_pertanyaan(%Pertanyaan{} = pertanyaan, attrs) do
    pertanyaan
    |> Pertanyaan.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a pertanyaan.

  ## Examples

      iex> delete_pertanyaan(pertanyaan)
      {:ok, %Pertanyaan{}}

      iex> delete_pertanyaan(pertanyaan)
      {:error, %Ecto.Changeset{}}

  """
  def delete_pertanyaan(%Pertanyaan{} = pertanyaan) do
    Repo.delete(pertanyaan)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking pertanyaan changes.

  ## Examples

      iex> change_pertanyaan(pertanyaan)
      %Ecto.Changeset{data: %Pertanyaan{}}

  """
  def change_pertanyaan(%Pertanyaan{} = pertanyaan, attrs \\ %{}) do
    Pertanyaan.changeset(pertanyaan, attrs)
  end

  def judul_kuesioner_peserta(nil) do
    "-"
  end

  def judul_kuesioner_peserta(kuesioner_id) do
    kuesioner = get_kuesioner!(kuesioner_id)

    if is_nil(kuesioner), do: "-", else: kuesioner.judul
  end

  def nama_data_opts() do
    for data <- list_nama_datas(),
        do: [key: data.nama_data, value: data.id]
  end
end
