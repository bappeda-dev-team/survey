defmodule SurveyWeb.PertanyaanLive.FormComponent do
  use SurveyWeb, :live_component

  alias Survey.Kuesioners

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage pertanyaan records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="pertanyaan-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input
          field={@form[:nama_data_id]}
          type="select"
          options={nama_data_opts()}
          label="Nama Data"
        />
        <.input field={@form[:kode_pertanyaan]} type="text" label="Kode pertanyaan" />
        <.input field={@form[:pertanyaan]} type="text" label="Pertanyaan" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Pertanyaan</.button>
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

  defp save_pertanyaan(socket, :edit, pertanyaan_params) do
    case Kuesioners.update_pertanyaan(socket.assigns.pertanyaan, pertanyaan_params) do
      {:ok, pertanyaan} ->
        notify_parent({:saved, pertanyaan})

        {:noreply,
         socket
         |> put_flash(:info, "Pertanyaan updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_pertanyaan(socket, :new, pertanyaan_params) do
    case Kuesioners.create_pertanyaan(pertanyaan_params) do
      {:ok, pertanyaan} ->
        notify_parent({:saved, pertanyaan})

        {:noreply,
         socket
         |> put_flash(:info, "Pertanyaan created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})

  defp nama_data_opts() do
    for data <- Survey.Kuesioners.list_nama_datas(),
        do: [key: data.nama_data, value: data.id]
  end
end
