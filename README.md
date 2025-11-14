# build and run for native

- `jai src/jai/build/native.jai && bin/manifold_jai_native`

This should print the following:

```
START
pointsCount:14
trianglesCount:24
result:
P:[{-0.5, -0.5, -0.5}, {-0.5, -0.5, 0.5}, {-0.5, 0.5, -0.5}, {-0.5, 0.5, 0.5}, {0.5, -0.5, -0.5}, {0.5, -0.5, 0.5}, {0.5, 0.5, -0.5}, {0, 0, 0}, {0, 0, 0.5}, {0, 0.5, 0}, {0, 0.5, 0.5}, {0.5, 0, 0}, {0.5, 0, 0.5}, {0.5, 0.5, 0}]
index:[0, 2, 4, 0, 1, 3, 0, 5, 1, 0, 3, 2, 1, 8, 3, 2, 3, 9, 3, 8, 10, 3, 10, 9, 0, 4, 5, 1, 5, 8, 4, 11, 5, 5, 12, 8, 5, 11, 12, 2, 6, 4, 2, 9, 6, 4, 6, 11, 6, 9, 13, 6, 13, 11, 7, 10, 8, 7, 8, 12, 7, 9, 10, 7, 13, 9, 7, 12, 11, 7, 11, 13]
DONE
```

# build and run for wasm

- compile the .wasm file: `jai src/jai/build/wasm.jai`. This creates the file `public/main.wasm`
- start a local server: `npx http-server -p 8085 -c-1 .`
- open your browser at: `http://localhost:8085/public/`. Note that this needs to be a browser supporting wasm64.
- open the dev console. You should see the following printed out:

```
START
DONE
```

This is only part of the output printed out by the native build above, since manifold is not yet included in the wasm compilation.

Once a manifold library is ready to be used for wasm compilation, un-comment the lines `// processBooleanOperation();` and `// #load "boolean.jai";` in the file `src/jai/main_wasm.jai`.