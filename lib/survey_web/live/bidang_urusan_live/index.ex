defmodule SurveyWeb.BidangUrusanLive.Index do
  use SurveyWeb, :live_view

  alias Survey.Opds
  alias Survey.Opds.BidangUrusan

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :bidang_urusans, Opds.list_bidang_urusans())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Bidang urusan")
    |> assign(:bidang_urusan, Opds.get_bidang_urusan!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "Tambah Data Bidang urusan")
    |> assign(:bidang_urusan, %BidangUrusan{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Master Bidang Urusan")
    |> assign(:bidang_urusan, nil)
  end

  @impl true
  def handle_info({SurveyWeb.BidangUrusanLive.FormComponent, {:saved, bidang_urusan}}, socket) do
    {:noreply, stream_insert(socket, :bidang_urusans, bidang_urusan)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    bidang_urusan = Opds.get_bidang_urusan!(id)
    {:ok, _} = Opds.delete_bidang_urusan(bidang_urusan)

    {:noreply, stream_delete(socket, :bidang_urusans, bidang_urusan)}
  end
end
