defmodule SurveyWeb.KuesionerLive.PilihNamaData do
  use SurveyWeb, :live_component

  def render(assigns) do
    ~H"""
    <div>
      <.header>
        <%= @title %>
      </.header>
    </div>
    """
  end
end
