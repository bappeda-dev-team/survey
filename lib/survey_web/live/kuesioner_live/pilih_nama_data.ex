defmodule SurveyWeb.KuesionerLive.PilihNamaData do
  use SurveyWeb, :live_component

  alias Survey.Kuesioners

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
      </.header>

      <div id="nama_data-selector">
        <form phx-submit="pilih-nama_data" phx-target={@myself}>
          <div class="mt-10 space-y-8 bg-white">
            <input type="hidden" name="kuesioner_id" value={@kuesioner.id} readonly />
            <.input
              type="select"
              id="nama_data"
              name="nama_data_id"
              value=""
              options={Kuesioners.nama_data_opts()}
              label="Nama Data"
            />
            <div class="mt-6 flex items-center justify-between gap-6">
              <.button type="submit" class="w-full" phx-disable-with="Menyimpan...">Pilih</.button>
            </div>
          </div>
        </form>
      </div>
    </div>
    """
  end

  @impl true
  def handle_event(
        "pilih-nama_data",
        %{"kuesioner_id" => kuesioner_id, "nama_data_id" => nama_data_id},
        socket
      ) do
    nama_data = Kuesioners.get_nama_data!(nama_data_id)

    case Kuesioners.update_nama_data(nama_data, %{kuesioner_id: kuesioner_id}) do
      {:ok, _nama_data} ->
        {:noreply,
         socket
         |> put_flash(:info, "Nama data ditambahkan")
         |> push_patch(to: socket.assigns.patch)}

      {:error, _} ->
        {:noreply,
         socket
         |> put_flash(:error, "Terjadi kesalahan")
         |> push_patch(to: socket.assigns.patch)}
    end
  end
end
