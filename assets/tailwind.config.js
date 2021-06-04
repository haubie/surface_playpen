module.exports = {
  purge: [
    '../lib/**/*.ex',
    '../lib/**/*.leex',
    '../lib/**/*.eex',
    '../lib/**/*.*sface',
    './js/**/*.js',
    '../lib/**/theme.ex',
    '../priv/catalogue/**/*.ex'
  ],
  darkMode: false, // or 'media' or 'class'
  theme: {
    extend: {},
  },
  variants: {
    extend: {},
  },
  plugins: [],
}
