# Vitest 5.1 import-map `vi.mock` intermittently crashes Firefox

```sh
npm ci
npx playwright install firefox
./repro.sh 10                               # import-map mocks (default): some runs crash
./repro.sh 10 --browser.importMapMocks=false # no crashes
```

A crashing run prints:

```
Error: The firefox page crashed while running tests. This can happen if the browser ran out of memory.
Serialized Error: { code: 'VITEST_BROWSER_CONNECTION_CLOSED' }
```

`nomock.test.ts`-style files without `vi.mock` never crash, and 5.0.5 with the same test never crashes.
