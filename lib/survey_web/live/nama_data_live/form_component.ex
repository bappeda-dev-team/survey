defmodule SurveyWeb.NamaDataLive.FormComponent do
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
        id="nama_data-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:tahun]} type="select" options={tahun_opts()} label="Tahun" />
        <.input
          field={@form[:kode_bidang_urusan]}
          type="select"
          options={bidang_urusan_opts()}
          label="Bidang urusan"
        />
        <.input field={@form[:nama_data]} type="text" label="Nama data" />
        <.input field={@form[:konsep]} type="text" label="Konsep" />
        <.input field={@form[:metodologi]} type="text" label="Metodologi" />
        <.input field={@form[:keterangan]} type="text" label="Keterangan" />
        <:actions>
          <.button class="w-full" phx-disable-with="Menyimpan...">Simpan Data</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{nama_data: nama_data} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Kuesioners.change_nama_data(nama_data))
     end)}
  end

  @impl true
  def handle_event("validate", %{"nama_data" => nama_data_params}, socket) do
    changeset = Kuesioners.change_nama_data(socket.assigns.nama_data, nama_data_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"nama_data" => nama_data_params}, socket) do
    save_nama_data(socket, socket.assigns.action, nama_data_params)
  end

  defp save_nama_data(socket, :edit, nama_data_params) do
    case Kuesioners.update_nama_data(socket.assigns.nama_data, nama_data_params) do
      {:ok, nama_data} ->
        notify_parent({:saved, nama_data})

        {:noreply,
         socket
         |> put_flash(:info, "Nama data updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_nama_data(socket, :new, nama_data_params) do
    case Kuesioners.create_nama_data(nama_data_params) do
      {:ok, nama_data} ->
        notify_parent({:saved, nama_data})

        {:noreply,
         socket
         |> put_flash(:info, "Nama data created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})

  defp bidang_urusan_opts() do
    for bd_ur <- Survey.Opds.list_bidang_urusans(),
        do: [key: Survey.Opds.BidangUrusan.kode_nama(bd_ur), value: bd_ur.kode_bidang_urusan]
  end

  defp tahun_opts() do
    2019..2029
  end
end
