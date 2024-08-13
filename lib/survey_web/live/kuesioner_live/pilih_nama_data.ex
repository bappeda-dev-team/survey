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

      <.simple_form for={@form} id={@id} phx-target={@myself} phx-change="validate" phx-submit="save">
        <.input field={@form[:judul]} type="text" label="Judul Kuesioner" readonly />
        <.input field={@form[:tahun]} type="text" label="Tahun Pelaksanaan" readonly />
        <.input
          field={@form[:nama_data_ids]}
          type="select"
          multiple={true}
          options={Kuesioners.nama_data_opts(@change_data)}
          label="Nama Data"
        />
        <div class="mt-6 flex items-center justify-between gap-6">
          <.button type="submit" class="w-full" phx-disable-with="Menyimpan...">Pilih</.button>
        </div>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{kuesioner: kuesioner} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign(change_data: Kuesioners.change_kuesioner(kuesioner))
     |> assign_new(:form, fn ->
       to_form(Kuesioners.change_kuesioner(kuesioner))
     end)}
  end

  @impl true
  def handle_event("validate", %{"kuesioner" => kuesioner_params}, socket) do
    changeset = Kuesioners.change_kuesioner(socket.assigns.kuesioner, kuesioner_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"kuesioner" => kuesioner_params}, socket) do
    save_kuesioner(socket, socket.assigns.action, kuesioner_params)
  end

  defp save_kuesioner(socket, :pilih_nama_data, kuesioner_params) do
    case Kuesioners.update_kuesioner(socket.assigns.kuesioner, kuesioner_params) do
      {:ok, kuesioner} ->
        notify_parent({:saved, kuesioner})

        {:noreply,
         socket
         |> put_flash(:info, "Data Kuesioner Berhasil Diperbarui")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
