
build_wasm :: () {
    set_build_options_dc(.{do_output = false});

    w := compiler_create_workspace("Wasm");

    options := get_build_options(w);
    copy_commonly_propagated_fields(get_build_options(), *options);

    options.output_type                         = .EXECUTABLE;
    options.backend                             = .LLVM; // WASM only works with the LLVM backend, obviously.
    options.os_target                           = .WASM;
    options.cpu_target                          = .CUSTOM;
    options.emit_debug_info                     = .DWARF;
    options.backtrace_on_crash                  = .OFF; // Runtime_Support_Crash_Handler doesn’t support WASM (yet?)
    options.output_path                         = "../../../public/";
    options.output_executable_name              = "main";
    options.llvm_options.target_system_features = "+bulk-memory"; // "This options is needed so that "memcpy" and "memset" are mapped to "memory.copy" and "memory.fill" instructions in WASM.
    options.llvm_options.enable_split_modules   = false;
    options.llvm_options.function_sections      = true; // To get around "LLVM ERROR: section already has a defining function: .text"

   // Add our own modules folder first so that we can override modules with our own version, if necessary.
    import_paths: [..]string;
	modulesRelativeToThisFile := tprint("%../modules", #filepath);
	modulesRelativeToThisFile_path := parse_path(modulesRelativeToThisFile, reduce=true);
	array_add(*import_paths, path_to_string(modulesRelativeToThisFile_path));
	for options.import_path array_add(*import_paths, it);
	options.import_path = import_paths;

    // This was compiled from https://github.com/wingo/walloc via "clang -Oz --target=wasm64 -nostdlib -c -o walloc.o walloc.c".
    // We should probably port this allocator to Jai instead…
    //  -rluba, 2023-11-15
    walloc_object_file_path := tprint("%/walloc/walloc.o", path_to_string(modulesRelativeToThisFile_path));
    print("walloc_object_file_path:%\n", walloc_object_file_path);

    STACK_SIZE :: 24 * 1024;
    options.additional_linker_arguments = .[
        "--stack-first",
        "-z",
        tprint("stack-size=%", STACK_SIZE),
        walloc_object_file_path
    ];

    set_build_options(options, w);

    // Replace the default allocator with Walloc (https://github.com/wingo/walloc).
    remap_import(w, "*", "Default_Allocator", "walloc");

    add_build_file("../main_wasm.jai", w);

}


#run build_wasm();

#import "Basic";
#import "Compiler";
#import "File_Utilities";