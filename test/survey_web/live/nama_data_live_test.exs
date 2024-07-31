defmodule SurveyWeb.NamaDataLiveTest do
  use SurveyWeb.ConnCase

  import Phoenix.LiveViewTest
  import Survey.KuesionersFixtures

  @create_attrs %{nama_data: "some nama_data", konsep: "some konsep", metodologi: "some metodologi", kode_bidang_urusan: "some kode_bidang_urusan", keterangan: "some keterangan"}
  @update_attrs %{nama_data: "some updated nama_data", konsep: "some updated konsep", metodologi: "some updated metodologi", kode_bidang_urusan: "some updated kode_bidang_urusan", keterangan: "some updated keterangan"}
  @invalid_attrs %{nama_data: nil, konsep: nil, metodologi: nil, kode_bidang_urusan: nil, keterangan: nil}

  defp create_nama_data(_) do
    nama_data = nama_data_fixture()
    %{nama_data: nama_data}
  end

  describe "Index" do
    setup [:create_nama_data]

    test "lists all nama_datas", %{conn: conn, nama_data: nama_data} do
      {:ok, _index_live, html} = live(conn, ~p"/nama_datas")

      assert html =~ "Listing Nama datas"
      assert html =~ nama_data.nama_data
    end

    test "saves new nama_data", %{conn: conn} do
      {:ok, index_live, _html} = live(conn, ~p"/nama_datas")

      assert index_live |> element("a", "New Nama data") |> render_click() =~
               "New Nama data"

      assert_patch(index_live, ~p"/nama_datas/new")

      assert index_live
             |> form("#nama_data-form", nama_data: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#nama_data-form", nama_data: @create_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/nama_datas")

      html = render(index_live)
      assert html =~ "Nama data created successfully"
      assert html =~ "some nama_data"
    end

    test "updates nama_data in listing", %{conn: conn, nama_data: nama_data} do
      {:ok, index_live, _html} = live(conn, ~p"/nama_datas")

      assert index_live |> element("#nama_datas-#{nama_data.id} a", "Edit") |> render_click() =~
               "Edit Nama data"

      assert_patch(index_live, ~p"/nama_datas/#{nama_data}/edit")

      assert index_live
             |> form("#nama_data-form", nama_data: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert index_live
             |> form("#nama_data-form", nama_data: @update_attrs)
             |> render_submit()

      assert_patch(index_live, ~p"/nama_datas")

      html = render(index_live)
      assert html =~ "Nama data updated successfully"
      assert html =~ "some updated nama_data"
    end

    test "deletes nama_data in listing", %{conn: conn, nama_data: nama_data} do
      {:ok, index_live, _html} = live(conn, ~p"/nama_datas")

      assert index_live |> element("#nama_datas-#{nama_data.id} a", "Delete") |> render_click()
      refute has_element?(index_live, "#nama_datas-#{nama_data.id}")
    end
  end

  describe "Show" do
    setup [:create_nama_data]

    test "displays nama_data", %{conn: conn, nama_data: nama_data} do
      {:ok, _show_live, html} = live(conn, ~p"/nama_datas/#{nama_data}")

      assert html =~ "Show Nama data"
      assert html =~ nama_data.nama_data
    end

    test "updates nama_data within modal", %{conn: conn, nama_data: nama_data} do
      {:ok, show_live, _html} = live(conn, ~p"/nama_datas/#{nama_data}")

      assert show_live |> element("a", "Edit") |> render_click() =~
               "Edit Nama data"

      assert_patch(show_live, ~p"/nama_datas/#{nama_data}/show/edit")

      assert show_live
             |> form("#nama_data-form", nama_data: @invalid_attrs)
             |> render_change() =~ "can&#39;t be blank"

      assert show_live
             |> form("#nama_data-form", nama_data: @update_attrs)
             |> render_submit()

      assert_patch(show_live, ~p"/nama_datas/#{nama_data}")

      html = render(show_live)
      assert html =~ "Nama data updated successfully"
      assert html =~ "some updated nama_data"
    end
  end
end
