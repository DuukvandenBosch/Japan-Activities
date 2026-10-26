import { createApp } from 'vue'
import { VueQueryPlugin, QueryClient } from '@tanstack/vue-query'
import App from './App.vue'
import './styles.css'

const queryClient = new QueryClient()

createApp(App).use(VueQueryPlugin, { queryClient }).mount('#app')
