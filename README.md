# Mjmleex

Renders EEx to MJML and MJML to HTML (eex -> mjml -> html)

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `mjmleex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:mjmleex, "~> 0.1.0"}
  ]
end
```

## Usage
1. Install the MJML globally: `npm install -g mjml`
2. Create template with *.mjml.eex extension
3. Render the template: `Mjmleex.render(PageView, "mail.mjml", %{name: 'John Smith'})`
4. Send recived html via email

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/mjmleex](https://hexdocs.pm/mjmleex).

