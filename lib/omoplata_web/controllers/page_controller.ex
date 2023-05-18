defmodule OmoplataWeb.PageController do
  use OmoplataWeb, :controller

  def home(conn, _params) do
    render(conn, :home)
  end

  def about(conn, _params) do
    render(conn, :about)
  end

  def classes(conn, _params) do
    render(conn, :classes)
  end

  def instructor(conn, _params) do
    render(conn, :instructor)
  end

  def schedule(conn, _params) do
    render(conn, :schedule)
  end

  def contact(conn, _params) do
    render(conn, :contact)
  end
end
