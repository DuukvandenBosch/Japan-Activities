import axios from 'axios'

const client = axios.create({
  baseURL: import.meta.env.VITE_API_BASE_URL ?? 'http://localhost:8080/api/v1',
  timeout: 5000,
  withCredentials: true,
  headers: { Accept: 'application/json' }
})

export interface HealthResponse {
  status: string
}

export async function getHealth(): Promise<HealthResponse> {
  const response = await client.get<HealthResponse>('/system/health')
  return response.data
}
