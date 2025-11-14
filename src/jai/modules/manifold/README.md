Start with the build instruction on the manifold repo:

```
git clone --recurse-submodules https://github.com/elalish/manifold.git
cd manifold
mkdir build
cd build
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON .. && make
```

Repository version (this currently matches the wasm version, in package.json)

```
git checkout v3.1.1
```

Although I've changed the cmd command to:

```
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=ON -DMANIFOLD_CBIND=ON .. && make -j 8 &&
cmake -DCMAKE_BUILD_TYPE=Release -DBUILD_SHARED_LIBS=OFF -DMANIFOLD_CBIND=ON .. && make -j 8
```

So that for linux, this creates both .so and .a files.

Then copy the library files to the module folder:

```
cp <MANIFOLD_FOLDER>build/src/libmanifold.* <POLYGON_FOLDER>/src/jai/modules/manifold/<OS>
```

Then remove the files with a version number, such as:

```
rm <POLYGON_FOLDER>/src/jai/modules/manifold/<OS>/*.so.3*
```

Note that I've tried using the library files in the bindings/c folder, but those trigger several `undefined symbol` errors at linking stage.

---

And the binding_generator currently fails with:
/usr/include/c++/11/bits/hashtable_policy.h:603:5: Stripping function that’s missing from foreign libs: \_M_state
/usr/include/c++/11/bits/hashtable_policy.h:607:5: Stripping function that’s missing from foreign libs: \_M_reset
/usr/include/c++/11/bits/hashtable_policy.h:611:5: Stripping function that’s missing from foreign libs: \_M_reset
/usr/include/c++/11/bits/enable_special_members.h:44:24: Stripping function that’s missing from foreign libs: Constructor
/home/gui/work/web/github/manifold/include/manifold/linalg.h:1177:22: Stripping function that’s missing from foreign libs: Constructor
/home/gui/work/web/github/manifold/include/manifold/linalg.h:1213:22: Unexpected child of CallExpr: IntegerLiteral
/home/gui/work/web/github/manifold/include/manifold/linalg.h:1213:31: depth 0: parent '' meet child '' with kind IntegerLiteral ref name "" is_const 0 is_reference false is_volatile 0 is_pointer {Invalid, [null, 7148_d000_0e90]} is_const_ref false
/home/gui/work/web/github/manifold/include/manifold/common.h:35:11: Unhandled cursor kind: NamespaceAlias
Stack trace:
'create_namespace' at /home/gui/work/web/games/jai/compiler/jai-beta-2-008/jai/modules/Bindings_Generator/module.jai:4081
'create_declaration' at /home/gui/work/web/games/jai/compiler/jai-beta-2-008/jai/modules/Bindings_Generator/module.jai:4697
'generate_bindings' at /home/gui/work/web/games/jai/compiler/jai-beta-2-008/jai/modules/Bindings_Generator/module.jai:406
'generate' at /home/gui/work/web/games/polygon/src/jai/modules/manifold/generate_bindings.jai:73
'' at /home/gui/work/web/games/polygon/src/jai/modules/manifold/generate_bindings.jai:1
/home/gui/work/web/games/jai/compiler/jai-beta-2-008/jai/modules/Bindings_Generator/module.jai:1879,21: Assertion failed!
