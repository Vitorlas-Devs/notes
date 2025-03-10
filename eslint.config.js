import antfu from '@antfu/eslint-config'

export default antfu({
  rules: {
    'no-console': 'off',
    'curly': ['warn', 'multi-or-nest', 'consistent'],
  },
  ignores: ['**/vendor/**'],
  solid: true,
  formatters: {
    html: true,
  },
})
