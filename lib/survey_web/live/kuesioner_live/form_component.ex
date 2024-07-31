defmodule SurveyWeb.KuesionerLive.FormComponent do
  use SurveyWeb, :live_component

  alias Survey.Kuesioners

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
      </.header>

      <.simple_form
        for={@form}
        id="kuesioner-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:judul]} type="text" label="Judul" />
        <.input field={@form[:penyelenggara]} type="text" label="Penyelenggara" />
        <.input field={@form[:tahun]} type="number" label="Tahun" />
        <.input field={@form[:deskripsi]} type="text" label="Deskripsi" />
        <:actions>
          <.button class="w-full" phx-disable-with="Menyimpan...">Simpan</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{kuesioner: kuesioner} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
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

  defp save_kuesioner(socket, :edit, kuesioner_params) do
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

  defp save_kuesioner(socket, :new, kuesioner_params) do
    case Kuesioners.create_kuesioner(kuesioner_params) do
      {:ok, kuesioner} ->
        notify_parent({:saved, kuesioner})

        {:noreply,
         socket
         |> put_flash(:info, "Data Kuesioner Berhasil Dibuat")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
