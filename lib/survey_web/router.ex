defmodule SurveyWeb.Router do
  use SurveyWeb, :router

  import SurveyWeb.UserAuth

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_live_flash
    plug :put_root_layout, html: {SurveyWeb.Layouts, :root}
    plug :protect_from_forgery
    plug :put_secure_browser_headers
    plug :fetch_current_user
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", SurveyWeb do
    pipe_through :browser

    # end
  end

  # Other scopes may use custom stacks.
  # scope "/api", SurveyWeb do
  #   pipe_through :api
  # end

  # Enable LiveDashboard and Swoosh mailbox preview in development
  if Application.compile_env(:survey, :dev_routes) do
    # If you want to use the LiveDashboard in production, you should put
    # it behind authentication and allow only admins to access it.
    # If your application does not have an admins-only section yet,
    # you can use Plug.BasicAuth to set up some basic authentication
    # as long as you are also using SSL (which you should anyway).
    import Phoenix.LiveDashboard.Router

    scope "/dev" do
      pipe_through :browser

      live_dashboard "/dashboard", metrics: SurveyWeb.Telemetry
      forward "/mailbox", Plug.Swoosh.MailboxPreview
    end
  end

  ## Authentication routes

  scope "/", SurveyWeb do
    pipe_through [:browser, :redirect_if_user_is_authenticated]

    live_session :redirect_if_user_is_authenticated,
      on_mount: [{SurveyWeb.UserAuth, :redirect_if_user_is_authenticated}] do
      live "/users/register", UserRegistrationLive, :new
      live "/users/log_in", UserLoginLive, :new
      live "/users/reset_password", UserForgotPasswordLive, :new
      live "/users/reset_password/:token", UserResetPasswordLive, :edit
    end

    post "/users/log_in", UserSessionController, :create
  end

  scope "/", SurveyWeb do
    pipe_through [:browser, :require_authenticated_user]

    live_session :require_authenticated_user,
      on_mount: [{SurveyWeb.UserAuth, :ensure_authenticated}] do
      live "/users/settings", UserSettingsLive, :edit
      live "/users/settings/confirm_email/:token", UserSettingsLive, :confirm_email

      get "/", PageController, :home

      # penduduks
      live "/penduduks", PendudukLive.Index, :index
      live "/penduduks/new", PendudukLive.Index, :new
      live "/penduduks/:id/edit", PendudukLive.Index, :edit

      live "/penduduks/:id", PendudukLive.Show, :show
      live "/penduduks/:id/show/edit", PendudukLive.Show, :edit

      # opds
      live "/opds", OpdLive.Index, :index
      live "/opds/new", OpdLive.Index, :new
      live "/opds/:id/edit", OpdLive.Index, :edit

      live "/opds/:id", OpdLive.Show, :show
      live "/opds/:id/show/edit", OpdLive.Show, :edit

      # urusans
      live "/urusans", UrusanLive.Index, :index
      live "/urusans/new", UrusanLive.Index, :new
      live "/urusans/:id/edit", UrusanLive.Index, :edit

      live "/urusans/:id", UrusanLive.Show, :show
      live "/urusans/:id/show/edit", UrusanLive.Show, :edit

      # bidang urusans
      live "/bidang_urusans", BidangUrusanLive.Index, :index
      live "/bidang_urusans/new", BidangUrusanLive.Index, :new
      live "/bidang_urusans/:id/edit", BidangUrusanLive.Index, :edit

      live "/bidang_urusans/:id", BidangUrusanLive.Show, :show
      live "/bidang_urusans/:id/show/edit", BidangUrusanLive.Show, :edit

      # kuesioners
      live "/kuesioners", KuesionerLive.Index, :index
      live "/kuesioners/new", KuesionerLive.Index, :new
      live "/kuesioners/:id/edit", KuesionerLive.Index, :edit

      live "/kuesioners/:id", KuesionerLive.Show, :show
      live "/kuesioners/:id/show/edit", KuesionerLive.Show, :edit
      live "/kuesioners/:id/pilih_nama_data", KuesionerLive.Show, :pilih_nama_data

      live "/kuesioners/:id/respons_kuesioner", KuesionerLive.ResponsKuesioner, :respons_kuesioner

      # nama_data
      live "/nama_datas", NamaDataLive.Index, :index
      live "/nama_datas/new", NamaDataLive.Index, :new
      live "/nama_datas/:id/edit", NamaDataLive.Index, :edit

      live "/nama_datas/:id", NamaDataLive.Show, :show
      live "/nama_datas/:id/show/edit", NamaDataLive.Show, :edit
      live "/nama_datas/:id/new_pertanyaan", NamaDataLive.Show, :new_pertanyaan

      # pertanyaan - nama data
      live "/pertanyaans", PertanyaanLive.Index, :index
      live "/pertanyaans/new", PertanyaanLive.Index, :new
      live "/pertanyaans/:id/edit", PertanyaanLive.Index, :edit

      live "/pertanyaans/:id", PertanyaanLive.Show, :show
      live "/pertanyaans/:id/show/edit", PertanyaanLive.Show, :edit

      # peserta
      live "/pesertas", PesertaLive.Index, :index
      live "/pesertas/new", PesertaLive.Index, :new
      live "/pesertas/:id/edit", PesertaLive.Index, :edit

      live "/pesertas/:id", PesertaLive.Show, :show
      live "/pesertas/:id/show/edit", PesertaLive.Show, :edit

      # respons
      live "/respons", ResponLive.Index, :index
      live "/respons/new", ResponLive.Index, :new
      live "/respons/:id/edit", ResponLive.Index, :edit

      live "/respons/:id", ResponLive.Show, :show
      live "/respons/:id/show/edit", ResponLive.Show, :edit
    end
  end

  scope "/", SurveyWeb do
    pipe_through [:browser]

    delete "/users/log_out", UserSessionController, :delete

    live_session :current_user,
      on_mount: [{SurveyWeb.UserAuth, :mount_current_user}] do
      live "/users/confirm/:token", UserConfirmationLive, :edit
      live "/users/confirm", UserConfirmationInstructionsLive, :new
    end
  end
end
