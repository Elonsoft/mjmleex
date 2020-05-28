defmodule Mjmleex do
  @moduledoc """
  Renders EEx to MJML and MJML to HTML

  How to use:
  1. Install the MJML globally
  2. Create template with mjml.eex extension
  3. Render the template: `Mjmleex.render(PageView, "mail.mjml", %{name: 'John Smith'})`
  4. Send recived html via email
  """

  @typedoc """
  Phoenix view module wich contains email template
  """
  @type view_module() :: module()

  @typedoc """
  Email template name (like mail.mjml.eex)
  """
  @type view_template() :: String.t()

  @typedoc """
  Template assigns
  """
  @type assigns() :: map()

  @typedoc """
  Html string
  """
  @type html() :: String.t()

  @spec render(view_module(), view_template(), assigns()) :: html()
  def render(module, template, assigns \\ %{}) do
    render_html(module, template, assigns)
    |> compile_mjml()
  end

  defp render_html(module, template, assigns) do
    Phoenix.View.render_to_string(module, template, assigns)
  end

  defp compile_mjml(mjml) do
    File.mkdir("tmp")
    path = "/tmp/#{UUID.uuid4()}"
    File.write!(path, mjml)

    case System.cmd("mjml", [path, "-s"]) do
      {html, 0} ->
        File.rm!(path)
        html

      _ ->
        File.rm!(path)
        raise "Mjml exited with non zero status, mail has not been compiled"
    end
  end
end
