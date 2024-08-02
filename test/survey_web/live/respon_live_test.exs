defmodule SurveyWeb.ResponLiveTest do
  use SurveyWeb.ConnCase

  import Phoenix.LiveViewTest
  import Survey.ResponsFixtures

  @create_attrs %{kode_peserta: "some kode_peserta", kode_pertanyaan: "some kode_pertanyaan", respon: "some respon"}
  @update_attrs %{kode_peserta: "some updated kode_peserta", kode_pertanyaan: "some updated kode_pertanyaan", respon: "some updated respon"}
  @invalid_attrs %{kode_peserta: nil, kode_pertanyaan: nil, respon: nil}

  defp create_respon(_) do
    respon = respon_fixture()
    %{respon: respon}
  end

  describe "Index" do
    setup [:create_respon]

    test "lists all respons", %{conn: conn, respon: respon} do
      {:ok, _index_live, html} = live(conn, ~p"/respons")

      assert html =~ "Listing Respons"
      assert html =~ respon.kode_peserta
    end

    test "saves new respon", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/respons")

      assert index_live |> element("a", "New Respon") |> render_click() =~
               "New Respon"

      assert_patch(index_live, ~p"/respons/new")

      assert index_live
             |> form("#respon-form", respon: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#respon-form", respon: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/respons")

      html = render(index_live)
      assert html =~ "Respon created successfully"
      assert html =~ "some kode_peserta"
    end

    test "updates respon in listing", %{conn: conn, respon: respon} do
      {:ok, index_live, _html} = live(conn, ~p"/respons")

      assert index_live |> element("#respons-#{respon.id} a", "Edit") |> render_click() =~
               "Edit Respon"

      assert_patch(index_live, ~p"/respons/#{respon}/edit")

      assert index_live
             |> form("#respon-form", respon: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#respon-form", respon: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/respons")

      html = render(index_live)
      assert html =~ "Respon updated successfully"
      assert html =~ "some updated kode_peserta"
    end

    test "deletes respon in listing", %{conn: conn, respon: respon} do
      {:ok, index_live, _html} = live(conn, ~p"/respons")

      assert index_live |> element("#respons-#{respon.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#respons-#{respon.id}")
    end
  end

  describe "Show" do
    setup [:create_respon]

    test "displays respon", %{conn: conn, respon: respon} do
      {:ok, _show_live, html} = live(conn, ~p"/respons/#{respon}")

      assert html =~ "Show Respon"
      assert html =~ respon.kode_peserta
    end

    test "updates respon within modal", %{conn: conn, respon: respon} do
      {:ok, show_live, _html} = live(conn, ~p"/respons/#{respon}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Respon"

      assert_patch(show_live, ~p"/respons/#{respon}/show/edit")

      assert show_live
             |> form("#respon-form", respon: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#respon-form", respon: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/respons/#{respon}")

      html = render(show_live)
      assert html =~ "Respon updated successfully"
      assert html =~ "some updated kode_peserta"
    end
  end
end
