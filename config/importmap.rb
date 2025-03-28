# frozen_string_literal: true

# Pin npm packages by running ./bin/importmap

pin 'application', preload: true
pin '@hotwired/turbo-rails', to: 'turbo.min.js', preload: true
pin '@hotwired/stimulus', to: 'stimulus.min.js', preload: true
pin '@hotwired/stimulus-loading', to: 'stimulus-loading.js', preload: true
pin_all_from 'app/javascript/controllers', under: 'controllers'
pin 'tom-select', to: 'https://ga.jspm.io/npm:tom-select@2.2.2/dist/js/tom-select.complete.js'
pin 'el-transition', to: 'https://ga.jspm.io/npm:el-transition@0.0.7/index.js'
pin '@orchidjs/sifter', to: '@orchidjs--sifter.js' # @1.1.0
pin '@orchidjs/unicode-variants', to: '@orchidjs--unicode-variants.js' # @1.1.2
