defmodule SurveyWeb.OpdLiveTest do
  use SurveyWeb.ConnCase

  import Phoenix.LiveViewTest
  import Survey.OpdsFixtures

  @create_attrs %{nama_opd: "some nama_opd", kode_opd: "some kode_opd", aktif: true}
  @update_attrs %{nama_opd: "some updated nama_opd", kode_opd: "some updated kode_opd", aktif: false}
  @invalid_attrs %{nama_opd: nil, kode_opd: nil, aktif: false}

  defp create_opd(_) do
    opd = opd_fixture()
    %{opd: opd}
  end

  describe "Index" do
    setup [:create_opd]

    test "lists all opds", %{conn: conn, opd: opd} do
      {:ok, _index_live, html} = live(conn, ~p"/opds")

      assert html =~ "Listing Opds"
      assert html =~ opd.nama_opd
    end

    test "saves new opd", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/opds")

      assert index_live |> element("a", "New Opd") |> render_click() =~
               "New Opd"

      assert_patch(index_live, ~p"/opds/new")

      assert index_live
             |> form("#opd-form", opd: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#opd-form", opd: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/opds")

      html = render(index_live)
      assert html =~ "Opd created successfully"
      assert html =~ "some nama_opd"
    end

    test "updates opd in listing", %{conn: conn, opd: opd} do
      {:ok, index_live, _html} = live(conn, ~p"/opds")

      assert index_live |> element("#opds-#{opd.id} a", "Edit") |> render_click() =~
               "Edit Opd"

      assert_patch(index_live, ~p"/opds/#{opd}/edit")

      assert index_live
             |> form("#opd-form", opd: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#opd-form", opd: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/opds")

      html = render(index_live)
      assert html =~ "Opd updated successfully"
      assert html =~ "some updated nama_opd"
    end

    test "deletes opd in listing", %{conn: conn, opd: opd} do
      {:ok, index_live, _html} = live(conn, ~p"/opds")

      assert index_live |> element("#opds-#{opd.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#opds-#{opd.id}")
    end
  end

  describe "Show" do
    setup [:create_opd]

    test "displays opd", %{conn: conn, opd: opd} do
      {:ok, _show_live, html} = live(conn, ~p"/opds/#{opd}")

      assert html =~ "Show Opd"
      assert html =~ opd.nama_opd
    end

    test "updates opd within modal", %{conn: conn, opd: opd} do
      {:ok, show_live, _html} = live(conn, ~p"/opds/#{opd}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Opd"

      assert_patch(show_live, ~p"/opds/#{opd}/show/edit")

      assert show_live
             |> form("#opd-form", opd: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#opd-form", opd: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/opds/#{opd}")

      html = render(show_live)
      assert html =~ "Opd updated successfully"
      assert html =~ "some updated nama_opd"
    end
  end
end
