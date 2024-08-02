defmodule SurveyWeb.PesertaLive.FormComponent do
  use SurveyWeb, :live_component

  alias Survey.Respons

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
      </.header>

      <.simple_form
        for={@form}
        id="peserta-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input
          field={@form[:tahun]}
          type="select"
          options={Respons.tahun_peserta_opts()}
          label="Tahun ikut serta"
        />
        <.input
          field={@form[:jenis_identitas]}
          type="select"
          options={Respons.jenis_identitas_peserta_opts()}
          label="Jenis identitas"
        />
        <.input
          field={@form[:kode_peserta]}
          type="select"
          options={peserta_penduduk_opts()}
          label="Kode peserta (identitas peserta)"
        />
        <.input field={@form[:nama_peserta]} type="text" label="Nama peserta" />
        <.input field={@form[:keterangan]} type="text" label="Keterangan" />
        <:actions>
          <.button class="w-full" phx-disable-with="Saving...">Save Peserta</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{peserta: peserta} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Respons.change_peserta(peserta))
     end)}
  end

  @impl true
  def handle_event("validate", %{"peserta" => peserta_params}, socket) do
    changeset = Respons.change_peserta(socket.assigns.peserta, peserta_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"peserta" => peserta_params}, socket) do
    save_peserta(socket, socket.assigns.action, peserta_params)
  end

  defp save_peserta(socket, :edit, peserta_params) do
    case Respons.update_peserta(socket.assigns.peserta, peserta_params) do
      {:ok, peserta} ->
        notify_parent({:saved, peserta})

        {:noreply,
         socket
         |> put_flash(:info, "Peserta updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_peserta(socket, :new, peserta_params) do
    case Respons.create_peserta(peserta_params) do
      {:ok, peserta} ->
        notify_parent({:saved, peserta})

        {:noreply,
         socket
         |> put_flash(:info, "Peserta created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})

  defp peserta_penduduk_opts() do
    for pend <- Survey.Penduduks.list_penduduks(),
        do: [key: Survey.Penduduks.nip_nama_penduduk(pend), value: pend.nik]
  end
end
