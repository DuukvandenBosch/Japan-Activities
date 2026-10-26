import { describe, expect, it } from 'vitest'
import { getHealth } from './client'

describe('API client', () => {
  it('exposes a health request function', () => {
    expect(getHealth).toBeTypeOf('function')
  })
})
