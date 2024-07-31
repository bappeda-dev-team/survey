defmodule SurveyWeb.NamaDataLive.Index do
  use SurveyWeb, :live_view

  alias Survey.Kuesioners
  alias Survey.Kuesioners.NamaData

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :nama_datas, Kuesioners.list_nama_datas())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Nama data")
    |> assign(:nama_data, Kuesioners.get_nama_data!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Nama data")
    |> assign(:nama_data, %NamaData{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Nama datas")
    |> assign(:nama_data, nil)
  end

  @impl true
  def handle_info({SurveyWeb.NamaDataLive.FormComponent, {:saved, nama_data}}, socket) do
    {:noreply, stream_insert(socket, :nama_datas, nama_data)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    nama_data = Kuesioners.get_nama_data!(id)
    {:ok, _} = Kuesioners.delete_nama_data(nama_data)

    {:noreply, stream_delete(socket, :nama_datas, nama_data)}
  end
end
