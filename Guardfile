# compile markdown files to html and odt
guard 'shell' do
  # build with pandoc
  watch(/src\/(.*)\.md$/) do |m|
    # m[0] = relative file path and file name with extension
    # m[1] = relative matched file path and file name without extension
    # `mkdir -p output/#{m[1][0,m[1].rindex('/')]}`  if m[1].rindex('/')
    `pandoc -5 #{m[0]} --template src/template/base.html --toc -o output/#{m[1]}.html`
    puts "built #{m[1]}.html"

    # `ruby make_index.rb > output/index.html`
  end
end

# reload browser on html changing
guard 'livereload', :apply_js_live => false do
  watch(%r{output/.+\.(html)})
end
