how to build for linux:

-   clone manifold: `git clone git@github.com:elalish/manifold.git`
-   enter repo: `cd manifold`
-   checkout the expected version: `git checkout v3.2.1`
-   build: `cmake -Bbuild -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DMANIFOLD_CBIND=ON -DMANIFOLD_TEST=OFF`
-   run make from build dir: `cd build && make`

-   we need to copy .so files to polygon
-   `libmanifold.so*` including symlinks from `manifold/build/src`
-   `libmanifoldc.so*` including symlinks from `manifold/build/bindings/c`

-   copy those files to `<POLYGON>/src/jai/modules/manifold/linux/`

-   recreate the symlinks if needed:
-   delete existing symlinks or files that have been converted from a symlink to a file:
-   `rm libmanifoldc.so libmanifoldc.so.3 libmanifold.so libmanifold.so.3`
-   `ln -s libmanifoldc.so.3.2.1 libmanifoldc.so.3 && ln -s libmanifoldc.so.3 libmanifoldc.so && ln -s libmanifold.so.3.2.1 libmanifold.so.3 && ln -s libmanifold.so.3 libmanifold.so`

-   run the binding generator: `jai src/jai/modules/manifold/generate_bindings/jai`

-   copy the files next to the executable, and there we can only keep some files, without the symlinks. We tried to keep files without the version suffix, but while that would compile, it would not run. We had the error `bin/polygon: error while loading shared libraries: libmanifoldc.so.3: cannot open shared object file: No such file or directory`. So for now, that version number has to be there.
-   in modules/manifold/linux: `cp libmanifold* ../../../../../bin/`
-   in /bin: `rm libmanifoldc.so libmanifoldc.so.3 libmanifold.so libmanifold.so.3`
-   `mv libmanifold.so.3.2.1 libmanifold.so`
-   `mv libmanifoldc.so.3.2.1 libmanifoldc.so.3`
