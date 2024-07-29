defmodule SurveyWeb.PendudukLive.FormComponent do
  use SurveyWeb, :live_component

  alias Survey.Penduduks

  @impl true
  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
        <:subtitle>Use this form to manage penduduk records in your database.</:subtitle>
      </.header>

      <.simple_form
        for={@form}
        id="penduduk-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input field={@form[:kode_unik]} type="text" label="Kode unik" />
        <.input field={@form[:nik]} type="text" label="Nik" />
        <.input field={@form[:nokk]} type="text" label="Nokk" />
        <.input field={@form[:nama]} type="text" label="Nama" />
        <.input field={@form[:tanggal_lahir]} type="date" label="Tanggal lahir" />
        <.input field={@form[:jenis_kelamin]} type="text" label="Jenis kelamin" />
        <.input field={@form[:kelurahan]} type="text" label="Kelurahan" />
        <.input field={@form[:kecamatan]} type="text" label="Kecamatan" />
        <.input field={@form[:kota_kab]} type="text" label="Kota kab" />
        <.input field={@form[:rt]} type="text" label="Rt" />
        <.input field={@form[:rw]} type="text" label="Rw" />
        <:actions>
          <.button phx-disable-with="Saving...">Save Penduduk</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{penduduk: penduduk} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Penduduks.change_penduduk(penduduk))
     end)}
  end

  @impl true
  def handle_event("validate", %{"penduduk" => penduduk_params}, socket) do
    changeset = Penduduks.change_penduduk(socket.assigns.penduduk, penduduk_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"penduduk" => penduduk_params}, socket) do
    save_penduduk(socket, socket.assigns.action, penduduk_params)
  end

  defp save_penduduk(socket, :edit, penduduk_params) do
    case Penduduks.update_penduduk(socket.assigns.penduduk, penduduk_params) do
      {:ok, penduduk} ->
        notify_parent({:saved, penduduk})

        {:noreply,
         socket
         |> put_flash(:info, "Penduduk updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_penduduk(socket, :new, penduduk_params) do
    case Penduduks.create_penduduk(penduduk_params) do
      {:ok, penduduk} ->
        notify_parent({:saved, penduduk})

        {:noreply,
         socket
         |> put_flash(:info, "Penduduk created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
