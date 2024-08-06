defmodule SurveyWeb.NamaDataLive.NewPertanyaan do
  use SurveyWeb, :live_component

  alias Survey.Kuesioners

  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
      </.header>
      <.simple_form
        for={@form}
        id="pertanyaan-nama_data-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <input type="hidden" name="pertanyaan[nama_data_id]" value={@nama_data.id} readonly />
        <.input field={@form[:kode_pertanyaan]} type="text" label="Kode pertanyaan" />
        <.input field={@form[:pertanyaan]} type="text" label="Pertanyaan" />
        <:actions>
          <.button class="w-full" phx-disable-with="Menyimpan...">Simpan Data</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{pertanyaan: pertanyaan} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Kuesioners.change_pertanyaan(pertanyaan))
     end)}
  end

  @impl true
  def handle_event("validate", %{"pertanyaan" => pertanyaan_params}, socket) do
    changeset = Kuesioners.change_pertanyaan(socket.assigns.pertanyaan, pertanyaan_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"pertanyaan" => pertanyaan_params}, socket) do
    save_pertanyaan(socket, socket.assigns.action, pertanyaan_params)
  end

  defp save_pertanyaan(socket, :new_pertanyaan, pertanyaan_params) do
    case Kuesioners.create_pertanyaan(pertanyaan_params) do
      {:ok, pertanyaan} ->
        notify_parent({:saved, pertanyaan})

        {:noreply,
         socket
         |> put_flash(:info, "Pertanyaan ditambahkan")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
