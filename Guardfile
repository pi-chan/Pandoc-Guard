# compile markdown files to html and odt
guard 'shell' do
  # build with pandoc
  watch(/.*src\/(.*)\.md$/) do |m|
    # m[0] = relative file path and file name with extension
    # m[1] = relative matched file path and file name without extension
    `pandoc -5 #{m[0]} --template output/template/base.html -c /css/style.css --toc -o output/#{m[1]}.html`
    puts "built #{m[1]}.html"
    `pandoc -s #{m[0]} --toc -o output/#{m[1]}.odt`
    puts "built #{m[1]}.odt"
  end
end

# reload browser on html changing
guard 'livereload', :apply_js_live => false do
  watch(%r{output/.+\.(html)})
end
