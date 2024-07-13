defmodule ChestnutWeb.ErrorJSONTest do
  use ChestnutWeb.ConnCase, async: true

  test "renders 404" do
    assert ChestnutWeb.ErrorJSON.render("404.json", %{}) == %{errors: %{detail: "Not Found"}}
  end

  test "renders 500" do
    assert ChestnutWeb.ErrorJSON.render("500.json", %{}) ==
             %{errors: %{detail: "Internal Server Error"}}
  end
end
