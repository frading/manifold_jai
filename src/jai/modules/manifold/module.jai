#if OS == .WINDOWS {
	#load "windows.jai";
}  else #if OS == .MACOS {
	#load "mac.jai";
} else #if OS == .LINUX {
	#load "linux.jai";
} else #if OS == .WASM {
	#load "wasm.jai";
} else {
	assert(false);
}

