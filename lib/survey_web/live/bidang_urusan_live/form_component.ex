defmodule SurveyWeb.BidangUrusanLive.FormComponent do
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
        id="bidang_urusan-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:kode_bidang_urusan]} type="text" label="Kode bidang urusan" />
        <.input field={@form[:nama_bidang_urusan]} type="text" label="Nama bidang urusan" />
        <:actions>
          <.button class="w-full" phx-disable-with="Saving...">Save Bidang urusan</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{bidang_urusan: bidang_urusan} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Opds.change_bidang_urusan(bidang_urusan))
     end)}
  end

  @impl true
  def handle_event("validate", %{"bidang_urusan" => bidang_urusan_params}, socket) do
    changeset = Opds.change_bidang_urusan(socket.assigns.bidang_urusan, bidang_urusan_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"bidang_urusan" => bidang_urusan_params}, socket) do
    save_bidang_urusan(socket, socket.assigns.action, bidang_urusan_params)
  end

  defp save_bidang_urusan(socket, :edit, bidang_urusan_params) do
    case Opds.update_bidang_urusan(socket.assigns.bidang_urusan, bidang_urusan_params) do
      {:ok, bidang_urusan} ->
        notify_parent({:saved, bidang_urusan})

        {:noreply,
         socket
         |> put_flash(:info, "Data Bidang Urusan Berhasil Diperbarui")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_bidang_urusan(socket, :new, bidang_urusan_params) do
    case Opds.create_bidang_urusan(bidang_urusan_params) do
      {:ok, bidang_urusan} ->
        notify_parent({:saved, bidang_urusan})

        {:noreply,
         socket
         |> put_flash(:info, "Data Bidang Urusan Berhasil Dibuat")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
