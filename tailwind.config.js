module.exports = {
  content: [
    './app/views/**/*.html.erb',
    './app/helpers/**/*.rb',
    './app/assets/stylesheets/**/*.css',
    './app/javascript/**/*.js',
    './app/assets/images/*.svg'
  ],
  theme: {
    extend: {
      maxHeight: {
        "128": "32rem",
        "80vh": "80vh"
      },
      maxWidth: {
        "128": "32rem",
        "80vw": "80vw"
      }
    }
  }
}
