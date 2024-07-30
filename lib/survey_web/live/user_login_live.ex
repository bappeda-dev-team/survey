defmodule SurveyWeb.UserLoginLive do
  use SurveyWeb, :live_view

  def render(assigns) do
    ~H"""
    <div class="mx-auto max-w-sm">
      <.header class="text-center">
        Log in ke akun
        <:subtitle>
          Belum memiliki akun?
          <.link navigate={~p"/users/register"} class="font-semibold text-brand hover:underline">
            Klik disini untuk membuat akun.
          </.link>
        </:subtitle>
      </.header>

      <.simple_form for={@form} id="login_form" action={~p"/users/log_in"} phx-update="ignore">
        <.input field={@form[:email]} type="email" label="Email" required />
        <.input field={@form[:password]} type="password" label="Password" required />

        <:actions>
          <.input field={@form[:remember_me]} type="checkbox" label="Tetap login" />
          <.link href={~p"/users/reset_password"} class="text-sm font-semibold">
            Lupa password?
          </.link>
        </:actions>
        <:actions>
          <.button phx-disable-with="Proses log in..." class="w-full">
            Log in <span aria-hidden="true">→</span>
          </.button>
        </:actions>
      </.simple_form>
    </div>
    """
  end

  def mount(_params, _session, socket) do
    email = Phoenix.Flash.get(socket.assigns.flash, :email)
    form = to_form(%{"email" => email}, as: "user")
    {:ok, assign(socket, form: form), temporary_assigns: [form: form]}
  end
end
