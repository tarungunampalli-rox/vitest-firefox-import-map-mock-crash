# Vitest 5.1 import-map `vi.mock` intermittently crashes Firefox

```sh
npm install
npx playwright install firefox
npx vitest run                                # import-map mocks (default): crashes in ~half of runs
npx vitest run --browser.importMapMocks=false # crashes rarely (1/20 runs)
```

The crash is intermittent, so run `npx vitest run` several times.

A crashing run prints:

```
Error: The firefox page crashed while running tests. This can happen if the browser ran out of memory.
Serialized Error: { code: 'VITEST_BROWSER_CONNECTION_CLOSED' }
```

Without `vi.mock`, or on Vitest 5.0.5 with the same test, it never crashed in 20 runs.
