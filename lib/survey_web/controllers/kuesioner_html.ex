defmodule SurveyWeb.KuesionerHTML do
  use SurveyWeb, :html

  embed_templates "kuesioner_html/*"

  @doc """
  Renders a kuesioner form.
  """
  attr :changeset, Ecto.Changeset, required: true
  attr :action, :string, required: true

  def kuesioner_form(assigns)
end
