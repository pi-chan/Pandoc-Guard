require 'erb'

contents =<<EOS
<!DOCTYPE html>
<html>
<head>
  <meta charset="utf-8">
  <meta name="generator" content="pandoc">
  <title>Pandoc Guard</title>
  <!--[if lt IE 9]>
    <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
  <![endif]-->
  <link rel="stylesheet" href="/css/github.css">
  <link rel="stylesheet" href="/css/style.css">
</head>
<body>

<div id="TOC">
<h2 id="heading">Table of Contents</h2>
<ul>
<%- @tags.each do |tag| -%>
  <li><%= tag -%></li>
<%- end -%>
</ul>
</div>

</body>
</html>
EOS

class FileTag
  def initialize(url, text, depth)
    @url = url
    @text = text
    @depth = depth
  end

  def to_s
    ("  " * @depth) + "<div class='depth file depth#{@depth}'><a href='#{@url}' target='_blank'>#{@text}</a></div>"
  end
end

class DirTag
  def initialize(text, depth)
    @text = text
    @depth = depth
  end

  def to_s
    ("  " * @depth) + "<div class='depth dir depth#{@depth}'>#{@text}</div>"
  end
  
end

def process_dir(dir, depth=0)
  html = []

  entries = Dir[File.join(dir,'*')]
  entries.each do |e|
    if File.file?(e) and e.match("\.html$")
      name = File.basename(e)
      html += [FileTag.new(e,name,depth+1)]
    else
      html += process_dir(e,depth+1)
    end
  end

  if html.any? and depth != 0
    name = File.basename(dir)
    html = [DirTag.new(name,depth)] + html
  end

  return html
end

Dir.chdir('./output') do
  @tags = process_dir('./')
end

erb = ERB.new(contents, nil, '-')
puts erb.result(binding)


