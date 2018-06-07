
html = File.read!("./bench/benchfile.html")
opts = [
  save: [path: "./bench/save.benchee", tag: String.trim(File.read!("./.git/HEAD"))],
  load: "./bench/save.benchee"
]


Benchee.run(%{
  "noscrub" => fn -> HtmlSanitizeEx.noscrub(html) end,
  "basic_html" => fn -> HtmlSanitizeEx.basic_html(html) end,
  "html5" => fn -> HtmlSanitizeEx.html5(html) end,
  "markdown_html" => fn -> HtmlSanitizeEx.markdown_html(html) end,
  "strip_tags" => fn ->HtmlSanitizeEx.strip_tags(html) end,
}, opts)
