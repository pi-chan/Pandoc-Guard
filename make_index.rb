require 'erb'
require './dir'

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
</head>
<body>

<div id="TOC">
<h2 id="heading">Table of Contents</h2>
<ul>
<% @d.each do |e| %>
  <% if File.file?(e.path) %>
    <% path = e.path.gsub(@d.path+'/','') %>
    <li>
      <a href=<%= path %>> <%= path %> </a>
    </li>
  <% end %>
<% end %>
</ul>
</div>

</body>
</html>
EOS

@d = D.new('./output/', '\.html$')

erb = ERB.new(contents)
puts erb.result(binding)


