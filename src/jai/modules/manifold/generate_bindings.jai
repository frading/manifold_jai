#run generate();

//
// run with:
// jai src/jai/modules/manifold/generate_bindings.jai
//

MANIFOLD_ROOT :: "/home/gui/work/web/github/manifold";
MANIFOLD_SRC_FOLDER :: #run sprint("%/src", MANIFOLD_ROOT);
MANIFOLD_INCLUDE_FOLDER :: #run sprint("%/include", MANIFOLD_ROOT);

generate :: () {
	output_filename: string;
	opts: Generate_Bindings_Options;
	{
		#if OS == .WINDOWS {
			array_add(*opts.libnames, "manifold");
			array_add(*opts.libnames, "manifoldc");
			array_add(*opts.libpaths, "windows");
			output_filename = "windows.jai";
		} else #if OS == .LINUX {
			array_add(*opts.libnames, "libmanifold");
			array_add(*opts.libnames, "libmanifoldc");
			array_add(*opts.libpaths, "linux");
			output_filename = "linux.jai";
		} else {
			assert(false);
		}
		
		opts.generate_library_declarations = true;
		array_add(*opts.include_paths, tprint("%/include/manifold", MANIFOLD_ROOT));
		array_add(*opts.include_paths, tprint("%/bindings/c/include/", MANIFOLD_ROOT));
		array_add(*opts.source_files,  tprint("%/bindings/c/include/manifold/manifoldc.h", MANIFOLD_ROOT));
		array_add(*opts.extra_clang_arguments,
			"-x", "c++",
			"-DWIN32_LEAN_AND_MEAN",
			"-DMANIFOLD_PAR=-1"
		);

	}

	generate_bindings(opts, output_filename);
}

#import "Basic";
#import "Compiler";
#import "Bindings_Generator";
#import "String";
#import "File";
