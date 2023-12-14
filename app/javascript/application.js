// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "trix"
import "@rails/actiontext"

Trix.config.blockAttributes.heading1.tagName = "h3" // Turn h1 to h3 tags