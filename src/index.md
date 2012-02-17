Pandoc Guard
============

Pandoc project set up with guard.

It will automatically output files on save using `guard-shell` and then reload the browser with `guard-livereload`.

Default output setting is HTML and ODT.

HTML output uses Twitter Bootstrap for styling, along with some tweaks.

# A note on livereload

I use node.js to serve up my outputted HTML, as Firefox's LiveReload plugin has issues with the `file://` protocol. 

1. Run `node static_server.js`
2. Navigate to `localhost:10000`
3. Run `guard` from the project root
4. Activate the plugin from your browser
5. Check that your terminal says 'Browser connected'
6. Iterate over your document!

# src folder

Any file structure you use within `src` will be reflected in the `output` directory.

