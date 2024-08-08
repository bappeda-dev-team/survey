defmodule SurveyWeb.PesertaLive.Index do
  use SurveyWeb, :live_view

  alias Survey.Respons
  alias Survey.Respons.Peserta

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :pesertas, Respons.list_pesertas())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Peserta")
    |> assign(:peserta, Respons.get_peserta!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Peserta")
    |> assign(:peserta, %Peserta{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Pesertas")
    |> assign(:peserta, nil)
  end

  @impl true
  def handle_info({SurveyWeb.PesertaLive.FormComponent, {:saved, peserta}}, socket) do
    {:noreply, stream_insert(socket, :pesertas, peserta)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    peserta = Respons.get_peserta!(id)
    {:ok, _} = Respons.delete_peserta(peserta)

    {:noreply, stream_delete(socket, :pesertas, peserta)}
  end

  defp judul_kuesioner(kuesioner_id: kuesioner_id) do
    Survey.Kuesioners.judul_kuesioner_peserta(kuesioner_id)
  end
end
