defmodule SurveyWeb.PertanyaanLive.TambahPilihanJawaban do
  use SurveyWeb, :live_component

  alias Survey.Respons

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage jawaban records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="jawaban-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <input
          type="hidden"
          name="jawaban[kode_pertanyaan]"
          value={@pertanyaan.kode_pertanyaan}
          readonly
        />
        <.input field={@form[:kode_jawaban]} type="text" label="Kode jawaban" />
        <.input field={@form[:jawaban]} type="text" label="Jawaban" />
        <.input field={@form[:skor]} type="number" label="Skor" />
        <.input field={@form[:bobot]} type="number" label="Bobot" step="0.1" max="1" min="0" />
        <:actions>
          <.button class="w-full" phx-disable-with="Menyimpan...">Simpan</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{jawaban: jawaban} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Respons.change_jawaban(jawaban))
     end)}
  end

  @impl true
  def handle_event("validate", %{"jawaban" => jawaban_params}, socket) do
    changeset = Respons.change_jawaban(socket.assigns.jawaban, jawaban_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"jawaban" => jawaban_params}, socket) do
    save_jawaban(socket, socket.assigns.action, jawaban_params)
  end

  defp save_jawaban(socket, :tambah_jawaban, jawaban_params) do
    case Respons.create_jawaban(jawaban_params) do
      {:ok, jawaban} ->
        notify_parent({:saved, jawaban})

        {:noreply,
         socket
         |> put_flash(:info, "Pilihan Jawaban Ditambahkan")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
