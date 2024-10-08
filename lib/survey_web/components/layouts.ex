defmodule SurveyWeb.Layouts do
  @moduledoc """
  This module holds different layouts used by your application.

  See the `layouts` directory for all templates available.
  The "root" layout is a skeleton rendered as part of the
  application router. The "app" layout is set as the default
  layout on both `use SurveyWeb, :controller` and
  `use SurveyWeb, :live_view`.
  """
  use SurveyWeb, :html

  embed_templates "layouts/*"

  def navhead(assigns)

  def sidebar(assigns)

  def footer(assigns)
end
