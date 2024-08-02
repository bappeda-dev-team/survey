defmodule SurveyWeb.ResponLive.FormComponent do
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
        id="respon-form"
        phx-target={@myself}
        phx-change="validate"
        phx-submit="save"
      >
        <.input
          field={@form[:kode_peserta]}
          type="select"
          options={Survey.Respons.peserta_opts()}
          label="Peserta"
        />
        <.input
          field={@form[:kode_pertanyaan]}
          type="select"
          options={Survey.Respons.pertanyaan_opts()}
          label="Pertanyaan"
        />
        <.input field={@form[:respon]} type="text" label="Respon" />
        <:actions>
          <.button class="w-full" phx-disable-with="Menyimpan...">Simpan</.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  @impl true
  def update(%{respon: respon} = assigns, socket) do
    {:ok,
     socket
     |> assign(assigns)
     |> assign_new(:form, fn ->
       to_form(Respons.change_respon(respon))
     end)}
  end

  @impl true
  def handle_event("validate", %{"respon" => respon_params}, socket) do
    changeset = Respons.change_respon(socket.assigns.respon, respon_params)
    {:noreply, assign(socket, form: to_form(changeset, action: :validate))}
  end

  def handle_event("save", %{"respon" => respon_params}, socket) do
    save_respon(socket, socket.assigns.action, respon_params)
  end

  defp save_respon(socket, :edit, respon_params) do
    case Respons.update_respon(socket.assigns.respon, respon_params) do
      {:ok, respon} ->
        notify_parent({:saved, respon})

        {:noreply,
         socket
         |> put_flash(:info, "Respon updated successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp save_respon(socket, :new, respon_params) do
    case Respons.create_respon(respon_params) do
      {:ok, respon} ->
        notify_parent({:saved, respon})

        {:noreply,
         socket
         |> put_flash(:info, "Respon created successfully")
         |> push_patch(to: socket.assigns.patch)}

      {:error, %Ecto.Changeset{} = changeset} ->
        {:noreply, assign(socket, form: to_form(changeset))}
    end
  end

  defp notify_parent(msg), do: send(self(), {__MODULE__, msg})
end
