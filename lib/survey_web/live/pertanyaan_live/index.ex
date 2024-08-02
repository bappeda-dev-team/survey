defmodule SurveyWeb.PertanyaanLive.Index do
  use SurveyWeb, :live_view

  alias Survey.Kuesioners
  alias Survey.Kuesioners.Pertanyaan

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :pertanyaans, Kuesioners.list_pertanyaans())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Pertanyaan")
    |> assign(:pertanyaan, Kuesioners.get_pertanyaan!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Pertanyaan")
    |> assign(:pertanyaan, %Pertanyaan{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Pertanyaans")
    |> assign(:pertanyaan, nil)
  end

  @impl true
  def handle_info({SurveyWeb.PertanyaanLive.FormComponent, {:saved, pertanyaan}}, socket) do
    {:noreply, stream_insert(socket, :pertanyaans, pertanyaan)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    pertanyaan = Kuesioners.get_pertanyaan!(id)
    {:ok, _} = Kuesioners.delete_pertanyaan(pertanyaan)

    {:noreply, stream_delete(socket, :pertanyaans, pertanyaan)}
  end
end
