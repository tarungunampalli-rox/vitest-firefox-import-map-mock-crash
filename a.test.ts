import { expect, test, vi } from 'vitest'
import { f } from './mod'

vi.mock('./mod', () => ({ f: () => 'mocked' }))

test('mocks the module', () => {
  expect(f()).toBe('mocked')
})
