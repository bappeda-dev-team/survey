defmodule SurveyWeb.NamaDataLive.Show do
  use SurveyWeb, :live_view

  alias Survey.Kuesioners
  alias Survey.Kuesioners.Pertanyaan

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:nama_data, Kuesioners.get_nama_data!(id))
     |> assign(:pertanyaan, %Pertanyaan{})}
  end

  defp page_title(:show), do: "Show Nama data"
  defp page_title(:edit), do: "Edit Nama data"
  defp page_title(:new_pertanyaan), do: "Tambah Pertanyaan"

  def bidang_urusan(%{bidang_urusan: bidang_urusan}) do
    Survey.Opds.BidangUrusan.kode_nama(bidang_urusan)
  end
end
