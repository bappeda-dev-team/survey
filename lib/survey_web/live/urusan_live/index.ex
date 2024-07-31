defmodule SurveyWeb.UrusanLive.Index do
  use SurveyWeb, :live_view

  alias Survey.Opds
  alias Survey.Opds.Urusan

  @impl true
  def mount(_params, _session, socket) do
    {:ok, stream(socket, :urusans, Opds.list_urusans())}
  end

  @impl true
  def handle_params(params, _url, socket) do
    {:noreply, apply_action(socket, socket.assigns.live_action, params)}
  end

  defp apply_action(socket, :edit, %{"id" => id}) do
    socket
    |> assign(:page_title, "Edit Urusan")
    |> assign(:urusan, Opds.get_urusan!(id))
  end

  defp apply_action(socket, :new, _params) do
    socket
    |> assign(:page_title, "New Urusan")
    |> assign(:urusan, %Urusan{})
  end

  defp apply_action(socket, :index, _params) do
    socket
    |> assign(:page_title, "Listing Urusans")
    |> assign(:urusan, nil)
  end

  @impl true
  def handle_info({SurveyWeb.UrusanLive.FormComponent, {:saved, urusan}}, socket) do
    {:noreply, stream_insert(socket, :urusans, urusan)}
  end

  @impl true
  def handle_event("delete", %{"id" => id}, socket) do
    urusan = Opds.get_urusan!(id)
    {:ok, _} = Opds.delete_urusan(urusan)

    {:noreply, stream_delete(socket, :urusans, urusan)}
  end
end
