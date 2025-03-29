import antfu from '@antfu/eslint-config'

export default antfu({
  rules: {
    'no-console': 'off',
    'curly': ['warn', 'multi-or-nest', 'consistent'],
  },
  ignores: ['**/vendor/**'],
  react: true,
  formatters: {
    html: true,
  },
})
