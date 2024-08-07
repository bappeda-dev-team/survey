defmodule SurveyWeb.PertanyaanLive.Show do
  use SurveyWeb, :live_view

  alias Survey.Kuesioners
  alias Survey.Respons

  @impl true
  def mount(_params, _session, socket) do
    {:ok, socket}
  end

  @impl true
  def handle_params(%{"id" => id, "jawaban_id" => jawaban_id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:jawaban, Respons.get_jawaban!(jawaban_id))
     |> assign(:pertanyaan, Kuesioners.get_pertanyaan!(id))}
  end

  @impl true
  def handle_params(%{"id" => id}, _, socket) do
    {:noreply,
     socket
     |> assign(:page_title, page_title(socket.assigns.live_action))
     |> assign(:jawaban, %Respons.Jawaban{})
     |> assign(:pertanyaan, Kuesioners.get_pertanyaan!(id))}
  end

  defp page_title(:show), do: "Show Pertanyaan"
  defp page_title(:edit), do: "Edit Pertanyaan"
  defp page_title(:tambah_jawaban), do: "Tambah Pilihan Jawaban"
  defp page_title(:edit_jawaban), do: "Edit Jawaban"
end
