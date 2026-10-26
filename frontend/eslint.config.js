import eslintPluginVue from 'eslint-plugin-vue'

export default [...eslintPluginVue.configs['flat/recommended'], { ignores: ['dist/'] }]
