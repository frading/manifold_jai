build_native :: () {

    _validateJaiVersion();

    set_build_options_dc(.{do_output = false});

	w := compiler_create_workspace("Native");

	options := get_build_options(w);

    options.output_path = "../../../bin";
    options.output_executable_name = "manifold_jai_native";

	// Add our own modules folder first so that we can override modules with our own version, if necessary.
    import_paths: [..]string;
	modulesRelativeToThisFile := tprint("%../modules", #filepath);
	modulesRelativeToThisFile_path := parse_path(modulesRelativeToThisFile, reduce=true);
	array_add(*import_paths, path_to_string(modulesRelativeToThisFile_path));
	for options.import_path array_add(*import_paths, it);
	options.import_path = import_paths;


    set_build_options(options, w);

    add_build_file("../main_native.jai", w);
}


#run build_native();


#scope_file

VERSION_MAJOR :: 0;
VERSION_MINOR :: 2;
VERSION_MICRO :: 19;
_validateJaiVersion :: () {
    versionInfo: Version_Info;
	compiler_get_version_info(*versionInfo);
	VERSION_ERROR_MESSAGE := tprint("requires jai version %.%.%", VERSION_MAJOR, VERSION_MINOR, VERSION_MICRO);
	assert(versionInfo.major == VERSION_MAJOR, VERSION_ERROR_MESSAGE);
	assert(versionInfo.minor == VERSION_MINOR, VERSION_ERROR_MESSAGE);
	assert(versionInfo.micro == VERSION_MICRO, VERSION_ERROR_MESSAGE);
}


#import "Basic";
#import "Compiler";
#import "File_Utilities";
