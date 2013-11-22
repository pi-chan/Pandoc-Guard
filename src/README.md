Pandoc Guard
============

forked from [aaronmcadam/Pandoc-Guard](https://github.com/aaronmcadam/Pandoc-Guard).

# Prerequisites

- pandoc [Pandoc - About pandoc](http://johnmacfarlane.net/pandoc/)
- ruby and bundler
- node and npm
- livereload extension for your browser.

# Initial Settings

1. `$ bundle install` or `$ bundle install --path .bundle`
1. `$ npm install`

# Run

1. `$ node static_server.js`
1. `$ guard` or `$ bundle exec guard`

# How to Use

Put markdown files into `src` dir as `*.md`, then `html` files are generated automatically.

And you cannot convert `src/index.md` to `output/index.html`, because `output/index.html` is reserved for this program. `output/index.html` lists all html files under the `output` directory, 


