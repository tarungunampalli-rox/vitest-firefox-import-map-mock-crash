# Vitest 5.1 intermittently crashes the Firefox page on Linux (much more often with `vi.mock`)

```sh
npm install
npx playwright install --with-deps firefox
npx vitest run with-mock.test.ts     # fails: crashes in ~half of runs
npx vitest run without-mock.test.ts  # passes (rare crash)
```

The crash is intermittent, so run each command several times. [`.github/workflows/repro.yml`](.github/workflows/repro.yml) runs each test 20 times on `ubuntu-24.04`.

A crashing run prints:

```
Error: The firefox page crashed while running tests. This can happen if the browser ran out of memory.
Serialized Error: { code: 'VITEST_BROWSER_CONNECTION_CLOSED' }
```

| GitHub Actions `ubuntu-24.04`, 20 runs each | `with-mock.test.ts` | `without-mock.test.ts` |
|---|---|---|
| Vitest 5.1.1 | 10/20 crashed | 1/20 crashed |
| Vitest 5.0.5 | 0/20 crashed | 0/20 crashed |

Not reproduced on macOS (arm64): 0/20 runs crashed.
