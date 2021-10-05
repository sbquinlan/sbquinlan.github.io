module.exports = {
  plugins: [
    require('autoprefixer'),
    require('tailwindcss'),
    ...process.env.HUGO_ENVIRONMENT === 'production'
      ? [purgecss]
      : []
  ]
}
