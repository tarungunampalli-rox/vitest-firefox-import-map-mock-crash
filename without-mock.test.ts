import { expect, test } from 'vitest'
import { f } from './mod'

test('uses the real module', () => {
  expect(f()).toBe('real')
})
