
processBooleanOperation :: () {
    _processBooleanOperation(P0, index0, P1, index1);
}

#scope_file

P0 :: Vector3.[
    .{-0.5, 0.5, 0.5},
    .{0.5, 0.5, 0.5},
    .{-0.5, -0.5, 0.5},
    .{0.5, -0.5, 0.5},
    .{0.5, 0.5, -0.5},
    .{-0.5, 0.5, -0.5},
    .{0.5, -0.5, -0.5},
    .{-0.5, -0.5, -0.5}
];
index0 :: u32.[0, 2, 1, 1, 2, 3, 4, 6, 5, 5, 6, 7, 5, 0, 4, 4, 0, 1, 2, 7, 3, 3, 7, 6, 1, 3, 4, 4, 3, 6, 5, 7, 0, 0, 7, 2];

P1 :: Vector3.[
    .{0, 1, 1},
    .{1, 1, 1},
    .{0, 0, 1},
    .{1, 0, 1},
    .{1, 1, 0},
    .{0, 1, 0},
    .{1, 0, 0},
    .{0, 0, 0}
];
index1 :: u32.[0, 2, 1, 1, 2, 3, 4, 6, 5, 5, 6, 7, 5, 0, 4, 4, 0, 1, 2, 7, 3, 3, 7, 6, 1, 3, 4, 4, 3, 6, 5, 7, 0, 0, 7, 2];

PROPS_COUNT :u64: 3;

_processBooleanOperation :: (P0:[]Vector3, index0:[]u32, P1:[]Vector3, index1:[]u32) {
    manifoldMeshGL0 := manifold_meshgl(
		mem=alloc(cast(s64)manifold_meshgl_size(),,allocator=temp),
		vert_props=cast(*float)P0.data,
		n_verts = cast(u64)(P0.count),
		n_props = PROPS_COUNT,
		tri_verts = index0.data,
		n_tris = cast(u64)(index0.count/3)
	);
	manifoldMeshGL1 := manifold_meshgl(
		mem=alloc(cast(s64)(manifold_meshgl_size()),,allocator=temp),
		vert_props=cast(*float)P1.data,
		n_verts = cast(u64)(P1.count),
		n_props = PROPS_COUNT,
		tri_verts = index1.data,
		n_tris = cast(u64)(index1.count/3)
	);
	assert(manifoldMeshGL0 != null);
	assert(manifoldMeshGL1 != null);
	manifold0 := manifold_of_meshgl(
		mem=alloc(cast(s64)manifold_manifold_size(),,allocator=temp),
		manifoldMeshGL0
	);
	manifold1 := manifold_of_meshgl(
		mem=alloc(cast(s64)manifold_manifold_size(),,allocator=temp),
		manifoldMeshGL1
	);
	assert(manifold0 != null);
	assert(manifold1 != null);

	result := manifold_boolean(
		mem=alloc(cast(s64)(manifold_manifold_size()),,allocator=temp),
		a = manifold0,
		b = manifold1,
		op = .SUBTRACT
	);
	status := manifold_status(result);
	assert(status == .NO_ERROR);
	pointsCount := manifold_num_vert(result);
	trianglesCount := manifold_num_tri(result);
	print("pointsCount:%\n", pointsCount);
	print("trianglesCount:%\n", trianglesCount);
	indicesCount := trianglesCount * 3;

	meshGL := manifold_get_meshgl(
		mem=alloc(cast(s64)(manifold_meshgl_size()),,allocator=temp),
		result,
	);

	P:[..]Vector3;
	P.count = cast(s64)pointsCount;
	index:[..]u32;
	index.count = cast(s64)indicesCount;
	maybe_grow(*P);
	maybe_grow(*index);
	manifold_meshgl_vert_properties(
		P.data,
		meshGL
	);
	manifold_meshgl_tri_verts(
		index.data,
		meshGL
	);

	// expected result:
	print("result:\n");
	print("P:%\n", P);
	print("index:%\n", index);
	// P:[{-0.5, -0.5, -0.5}, {-0.5, -0.5, 0.5}, {-0.5, 0.5, -0.5}, {-0.5, 0.5, 0.5}, {0.5, -0.5, -0.5}, {0.5, -0.5, 0.5}, {0.5, 0.5, -0.5}, {0, 0, 0}, {0, 0, 0.5}, {0, 0.5, 0}, {0, 0.5, 0.5}, {0.5, 0, 0}, {0.5, 0, 0.5}, {0.5, 0.5, 0}]
	// index:[0, 2, 4, 0, 1, 3, 0, 5, 1, 0, 3, 2, 1, 10, 3, 3, 9, 2, 1, 8, 10, 3, 10, 9, 0, 4, 5, 1, 5, 8, 4, 11, 5, 5, 12, 8, 5, 11, 12, 2, 6, 4, 2, 9, 6, 4, 6, 11, 6, 9, 13, 6, 13, 11, 7, 8, 11, 7, 10, 8, 7, 9, 10, 7, 13, 9, 7, 11, 13, 12, 11, 8]
}