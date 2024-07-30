defmodule SurveyWeb.OpdLive.FormComponent do
  use SurveyWeb, :live_component

  alias Survey.Opds

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
      </.header>

      <.simple_form
        for={@form}
        id="opd-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:kode_opd]} type="text" label="Kode OPD" />
        <.input field={@form[:nama_opd]} type="text" label="Nama OPD" />
        <:actions>
          <.button class="w-full" phx-disable-with="Menyimpan...">Simpan Data OPD</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{opd: opd} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Opds.change_opd(opd))
     end)}
  end

  @impl true
  def handle_event("validate", %{"opd" => opd_params}, socket) do
    changeset = Opds.change_opd(socket.assigns.opd, opd_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"opd" => opd_params}, socket) do
    save_opd(socket, socket.assigns.action, opd_params)
  end

  defp save_opd(socket, :edit, opd_params) do
    case Opds.update_opd(socket.assigns.opd, opd_params) do
      {:ok, opd} ->
        notify_parent({:saved, opd})

        {:noreply,
         socket
         |> put_flash(:info, "Data Opd Berhasil Diperbarui")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_opd(socket, :new, opd_params) do
    case Opds.create_opd(opd_params) do
      {:ok, opd} ->
        notify_parent({:saved, opd})

        {:noreply,
         socket
         |> put_flash(:info, "Data OPD Berhasil Dibuat")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
