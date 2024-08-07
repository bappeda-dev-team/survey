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

  alias Survey.Respons.Respon

  @doc """
  Returns the list of respons.

  ## Examples

      iex> list_respons()
      [%Respon{}, ...]

  """
  def list_respons do
    Repo.all(Respon)
  end

  @doc """
  Gets a single respon.

  Raises `Ecto.NoResultsError` if the Respon does not exist.

  ## Examples

      iex> get_respon!(123)
      %Respon{}

      iex> get_respon!(456)
      ** (Ecto.NoResultsError)

  """
  def get_respon!(id), do: Repo.get!(Respon, id)

  @doc """
  Creates a respon.

  ## Examples

      iex> create_respon(%{field: value})
      {:ok, %Respon{}}

      iex> create_respon(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_respon(attrs \\ %{}) do
    %Respon{}
    |> Respon.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a respon.

  ## Examples

      iex> update_respon(respon, %{field: new_value})
      {:ok, %Respon{}}

      iex> update_respon(respon, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_respon(%Respon{} = respon, attrs) do
    respon
    |> Respon.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a respon.

  ## Examples

      iex> delete_respon(respon)
      {:ok, %Respon{}}

      iex> delete_respon(respon)
      {:error, %Ecto.Changeset{}}

  """
  def delete_respon(%Respon{} = respon) do
    Repo.delete(respon)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking respon changes.

  ## Examples

      iex> change_respon(respon)
      %Ecto.Changeset{data: %Respon{}}

  """
  def change_respon(%Respon{} = respon, attrs \\ %{}) do
    Respon.changeset(respon, attrs)
  end

  def penduduk_opts() do
    for pend <- Survey.Penduduks.list_penduduks(),
        do: [key: Survey.Penduduks.nip_nama_penduduk(pend), value: pend.nik]
  end

  def peserta_opts() do
    for p <- list_pesertas(),
        do: [key: p.nama_peserta, value: p.kode_peserta]
  end

  def pertanyaan_opts() do
    for p <- Survey.Kuesioners.list_pertanyaans(),
        do: [key: p.pertanyaan, value: p.kode_pertanyaan]
  end

  # respon_pertanyaan
  def respons(kode_pertanyaan) do
    query =
      from Respon,
        where: [kode_pertanyaan: ^kode_pertanyaan],
        select: [:respon, :kode_peserta]

    Repo.all(query)
  end

  def list_responden(kode_pertanyaan) do
    query =
      from Respon,
        where: [kode_pertanyaan: ^kode_pertanyaan],
        select: [:kode_peserta]

    Repo.all(query)
  end

  def respon_pertanyaan_peserta(kode_pertanyaan: kode_pertanyaan, kode_peserta: kode_peserta) do
    query =
      from r in Respon,
        where: r.kode_pertanyaan == ^kode_pertanyaan,
        where: r.kode_peserta == ^kode_peserta,
        limit: 1,
        select: r.respon

    Repo.all(query)
  end

  def nama_responden(kode_responden: kode_responden) do
    query =
      from p in Survey.Penduduks.Penduduk,
        where: p.nik == ^kode_responden,
        limit: 1,
        select: p.nama

    Repo.all(query)
  end

  alias Survey.Respons.Jawaban

  @doc """
  Returns the list of jawabans.

  ## Examples

      iex> list_jawabans()
      [%Jawaban{}, ...]

  """
  def list_jawabans do
    Repo.all(Jawaban)
  end

  @doc """
  Gets a single jawaban.

  Raises `Ecto.NoResultsError` if the Jawaban does not exist.

  ## Examples

      iex> get_jawaban!(123)
      %Jawaban{}

      iex> get_jawaban!(456)
      ** (Ecto.NoResultsError)

  """
  def get_jawaban!(id), do: Repo.get!(Jawaban, id)

  @doc """
  Creates a jawaban.

  ## Examples

      iex> create_jawaban(%{field: value})
      {:ok, %Jawaban{}}

      iex> create_jawaban(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_jawaban(attrs \\ %{}) do
    %Jawaban{}
    |> Jawaban.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a jawaban.

  ## Examples

      iex> update_jawaban(jawaban, %{field: new_value})
      {:ok, %Jawaban{}}

      iex> update_jawaban(jawaban, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_jawaban(%Jawaban{} = jawaban, attrs) do
    jawaban
    |> Jawaban.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a jawaban.

  ## Examples

      iex> delete_jawaban(jawaban)
      {:ok, %Jawaban{}}

      iex> delete_jawaban(jawaban)
      {:error, %Ecto.Changeset{}}

  """
  def delete_jawaban(%Jawaban{} = jawaban) do
    Repo.delete(jawaban)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking jawaban changes.

  ## Examples

      iex> change_jawaban(jawaban)
      %Ecto.Changeset{data: %Jawaban{}}

  """
  def change_jawaban(%Jawaban{} = jawaban, attrs \\ %{}) do
    Jawaban.changeset(jawaban, attrs)
  end
end
