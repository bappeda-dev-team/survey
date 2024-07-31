defmodule SurveyWeb.UrusanLive.FormComponent do
  use SurveyWeb, :live_component

  alias Survey.Opds

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage urusan records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="urusan-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:kode_urusan]} type="text" label="Kode urusan" />
        <.input field={@form[:nama_urusan]} type="text" label="Nama urusan" />
        <.input field={@form[:aktif]} type="checkbox" label="Aktif" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Urusan</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{urusan: urusan} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Opds.change_urusan(urusan))
     end)}
  end

  @impl true
  def handle_event("validate", %{"urusan" => urusan_params}, socket) do
    changeset = Opds.change_urusan(socket.assigns.urusan, urusan_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"urusan" => urusan_params}, socket) do
    save_urusan(socket, socket.assigns.action, urusan_params)
  end

  defp save_urusan(socket, :edit, urusan_params) do
    case Opds.update_urusan(socket.assigns.urusan, urusan_params) do
      {:ok, urusan} ->
        notify_parent({:saved, urusan})

        {:noreply,
         socket
         |> put_flash(:info, "Urusan updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_urusan(socket, :new, urusan_params) do
    case Opds.create_urusan(urusan_params) do
      {:ok, urusan} ->
        notify_parent({:saved, urusan})

        {:noreply,
         socket
         |> put_flash(:info, "Urusan created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
