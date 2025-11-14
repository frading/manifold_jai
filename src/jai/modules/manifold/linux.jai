//
// This file was auto-generated using the following command:
//
// jai src/jai/modules/manifold/generate_bindings.jai
//



MANIFOLD_PAR :: -1;
ManifoldManifold :: struct {}
ManifoldManifoldVec :: struct {}
ManifoldCrossSection :: struct {}
ManifoldCrossSectionVec :: struct {}
ManifoldSimplePolygon :: struct {}
ManifoldPolygons :: struct {}
ManifoldMeshGL :: struct {}
ManifoldMeshGL64 :: struct {}
ManifoldBox :: struct {}
ManifoldRect :: struct {}
ManifoldTriangulation :: struct {}

// structs
ManifoldManifoldPair :: struct {
    first:  *ManifoldManifold;
    second: *ManifoldManifold;
}

ManifoldVec2 :: struct {
    x: float64;
    y: float64;
}

ManifoldVec3 :: struct {
    x: float64;
    y: float64;
    z: float64;
}

ManifoldIVec3 :: struct {
    x: s32;
    y: s32;
    z: s32;
}

ManifoldVec4 :: struct {
    x: float64;
    y: float64;
    z: float64;
    w: float64;
}

ManifoldProperties :: struct {
    surface_area: float64;
    volume:       float64;
}

// enums
ManifoldOpType :: enum u32 {
    ADD       :: 0;
    SUBTRACT  :: 1;
    INTERSECT :: 2;

    MANIFOLD_ADD       :: ADD;
    MANIFOLD_SUBTRACT  :: SUBTRACT;
    MANIFOLD_INTERSECT :: INTERSECT;
}

ManifoldError :: enum u32 {
    NO_ERROR                        :: 0;
    NON_FINITE_VERTEX               :: 1;
    NOT_MANIFOLD                    :: 2;
    VERTEX_INDEX_OUT_OF_BOUNDS      :: 3;
    PROPERTIES_WRONG_LENGTH         :: 4;
    MISSING_POSITION_PROPERTIES     :: 5;
    MERGE_VECTORS_DIFFERENT_LENGTHS :: 6;
    MERGE_INDEX_OUT_OF_BOUNDS       :: 7;
    TRANSFORM_WRONG_LENGTH          :: 8;
    RUN_INDEX_WRONG_LENGTH          :: 9;
    FACE_ID_WRONG_LENGTH            :: 10;
    INVALID_CONSTRUCTION            :: 11;
    RESULT_TOO_LARGE                :: 12;

    MANIFOLD_NO_ERROR                        :: NO_ERROR;
    MANIFOLD_NON_FINITE_VERTEX               :: NON_FINITE_VERTEX;
    MANIFOLD_NOT_MANIFOLD                    :: NOT_MANIFOLD;
    MANIFOLD_VERTEX_INDEX_OUT_OF_BOUNDS      :: VERTEX_INDEX_OUT_OF_BOUNDS;
    MANIFOLD_PROPERTIES_WRONG_LENGTH         :: PROPERTIES_WRONG_LENGTH;
    MANIFOLD_MISSING_POSITION_PROPERTIES     :: MISSING_POSITION_PROPERTIES;
    MANIFOLD_MERGE_VECTORS_DIFFERENT_LENGTHS :: MERGE_VECTORS_DIFFERENT_LENGTHS;
    MANIFOLD_MERGE_INDEX_OUT_OF_BOUNDS       :: MERGE_INDEX_OUT_OF_BOUNDS;
    MANIFOLD_TRANSFORM_WRONG_LENGTH          :: TRANSFORM_WRONG_LENGTH;
    MANIFOLD_RUN_INDEX_WRONG_LENGTH          :: RUN_INDEX_WRONG_LENGTH;
    MANIFOLD_FACE_ID_WRONG_LENGTH            :: FACE_ID_WRONG_LENGTH;
    MANIFOLD_INVALID_CONSTRUCTION            :: INVALID_CONSTRUCTION;
    MANIFOLD_RESULT_TOO_LARGE                :: RESULT_TOO_LARGE;
}

ManifoldFillRule :: enum u32 {
    EVEN_ODD :: 0;
    NON_ZERO :: 1;
    POSITIVE :: 2;
    NEGATIVE :: 3;

    MANIFOLD_FILL_RULE_EVEN_ODD :: EVEN_ODD;
    MANIFOLD_FILL_RULE_NON_ZERO :: NON_ZERO;
    MANIFOLD_FILL_RULE_POSITIVE :: POSITIVE;
    MANIFOLD_FILL_RULE_NEGATIVE :: NEGATIVE;
}

ManifoldJoinType :: enum u32 {
    SQUARE :: 0;
    ROUND  :: 1;
    MITER  :: 2;
    BEVEL  :: 3;

    MANIFOLD_JOIN_TYPE_SQUARE :: SQUARE;
    MANIFOLD_JOIN_TYPE_ROUND  :: ROUND;
    MANIFOLD_JOIN_TYPE_MITER  :: MITER;
    MANIFOLD_JOIN_TYPE_BEVEL  :: BEVEL;
}

// function pointer
ManifoldSdf :: #type (unknown0: float64, unknown1: float64, unknown2: float64, unknown3: *void) -> float64 #c_call;

// Polygons
manifold_simple_polygon :: (mem: *void, ps: *ManifoldVec2, length: u64) -> *ManifoldSimplePolygon #foreign libmanifoldc;

manifold_polygons :: (mem: *void, ps: **ManifoldSimplePolygon, length: u64) -> *ManifoldPolygons #foreign libmanifoldc;

manifold_simple_polygon_length :: (p: *ManifoldSimplePolygon) -> u64 #foreign libmanifoldc;
manifold_polygons_length :: (ps: *ManifoldPolygons) -> u64 #foreign libmanifoldc;
manifold_polygons_simple_length :: (ps: *ManifoldPolygons, idx: u64) -> u64 #foreign libmanifoldc;
manifold_simple_polygon_get_point :: (p: *ManifoldSimplePolygon, idx: u64) -> ManifoldVec2 #foreign libmanifoldc;

manifold_polygons_get_simple :: (mem: *void, ps: *ManifoldPolygons, idx: u64) -> *ManifoldSimplePolygon #foreign libmanifoldc;

manifold_polygons_get_point :: (ps: *ManifoldPolygons, simple_idx: u64, pt_idx: u64) -> ManifoldVec2 #foreign libmanifoldc;

// Mesh Construction
manifold_meshgl :: (mem: *void, vert_props: *float, n_verts: u64, n_props: u64, tri_verts: *u32, n_tris: u64) -> *ManifoldMeshGL #foreign libmanifoldc;

manifold_meshgl_w_tangents :: (mem: *void, vert_props: *float, n_verts: u64, n_props: u64, tri_verts: *u32, n_tris: u64, halfedge_tangent: *float) -> *ManifoldMeshGL #foreign libmanifoldc;

manifold_get_meshgl :: (mem: *void, m: *ManifoldManifold) -> *ManifoldMeshGL #foreign libmanifoldc;
manifold_meshgl_copy :: (mem: *void, m: *ManifoldMeshGL) -> *ManifoldMeshGL #foreign libmanifoldc;
manifold_meshgl_merge :: (mem: *void, m: *ManifoldMeshGL) -> *ManifoldMeshGL #foreign libmanifoldc;

manifold_meshgl64 :: (mem: *void, vert_props: *float64, n_verts: u64, n_props: u64, tri_verts: *u64, n_tris: u64) -> *ManifoldMeshGL64 #foreign libmanifoldc;

manifold_meshgl64_w_tangents :: (mem: *void, vert_props: *float64, n_verts: u64, n_props: u64, tri_verts: *u64, n_tris: u64, halfedge_tangent: *float64) -> *ManifoldMeshGL64 #foreign libmanifoldc;

manifold_get_meshgl64 :: (mem: *void, m: *ManifoldManifold) -> *ManifoldMeshGL64 #foreign libmanifoldc;
manifold_meshgl64_copy :: (mem: *void, m: *ManifoldMeshGL64) -> *ManifoldMeshGL64 #foreign libmanifoldc;
manifold_meshgl64_merge :: (mem: *void, m: *ManifoldMeshGL64) -> *ManifoldMeshGL64 #foreign libmanifoldc;

// SDF
// By default, the execution policy (sequential or parallel) of
// manifold_level_set will be chosen automatically depending on the size of the
// job and whether Manifold has been compiled with a PAR backend. If you are
// using these bindings from a language that has a runtime lock preventing the
// parallel execution of closures, then you should use manifold_level_set_seq to
// force sequential execution.
manifold_level_set :: (mem: *void, sdf: ManifoldSdf, bounds: *ManifoldBox, edge_length: float64, level: float64, tolerance: float64, ctx: *void) -> *ManifoldManifold #foreign libmanifoldc;

manifold_level_set_seq :: (mem: *void, sdf: ManifoldSdf, bounds: *ManifoldBox, edge_length: float64, level: float64, tolerance: float64, ctx: *void) -> *ManifoldManifold #foreign libmanifoldc;

// Manifold Vectors
manifold_manifold_empty_vec :: (mem: *void) -> *ManifoldManifoldVec #foreign libmanifoldc;
manifold_manifold_vec :: (mem: *void, sz: u64) -> *ManifoldManifoldVec #foreign libmanifoldc;
manifold_manifold_vec_reserve :: (ms: *ManifoldManifoldVec, sz: u64) -> void #foreign libmanifoldc;
manifold_manifold_vec_length :: (ms: *ManifoldManifoldVec) -> u64 #foreign libmanifoldc;
manifold_manifold_vec_get :: (mem: *void, ms: *ManifoldManifoldVec, idx: u64) -> *ManifoldManifold #foreign libmanifoldc;

manifold_manifold_vec_set :: (ms: *ManifoldManifoldVec, idx: u64, m: *ManifoldManifold) -> void #foreign libmanifoldc;

manifold_manifold_vec_push_back :: (ms: *ManifoldManifoldVec, m: *ManifoldManifold) -> void #foreign libmanifoldc;

// Manifold Booleans
manifold_boolean :: (mem: *void, a: *ManifoldManifold, b: *ManifoldManifold, op: ManifoldOpType) -> *ManifoldManifold #foreign libmanifoldc;

manifold_batch_boolean :: (mem: *void, ms: *ManifoldManifoldVec, op: ManifoldOpType) -> *ManifoldManifold #foreign libmanifoldc;

manifold_union :: (mem: *void, a: *ManifoldManifold, b: *ManifoldManifold) -> *ManifoldManifold #foreign libmanifoldc;

manifold_difference :: (mem: *void, a: *ManifoldManifold, b: *ManifoldManifold) -> *ManifoldManifold #foreign libmanifoldc;

manifold_intersection :: (mem: *void, a: *ManifoldManifold, b: *ManifoldManifold) -> *ManifoldManifold #foreign libmanifoldc;

manifold_split :: (mem_first: *void, mem_second: *void, a: *ManifoldManifold, b: *ManifoldManifold) -> ManifoldManifoldPair #foreign libmanifoldc;

manifold_split_by_plane :: (mem_first: *void, mem_second: *void, m: *ManifoldManifold, normal_x: float64, normal_y: float64, normal_z: float64, offset: float64) -> ManifoldManifoldPair #foreign libmanifoldc;

manifold_trim_by_plane :: (mem: *void, m: *ManifoldManifold, normal_x: float64, normal_y: float64, normal_z: float64, offset: float64) -> *ManifoldManifold #foreign libmanifoldc;

// 3D to 2D
manifold_slice :: (mem: *void, m: *ManifoldManifold, height: float64) -> *ManifoldPolygons #foreign libmanifoldc;
manifold_project :: (mem: *void, m: *ManifoldManifold) -> *ManifoldPolygons #foreign libmanifoldc;

// Convex Hulls
manifold_hull :: (mem: *void, m: *ManifoldManifold) -> *ManifoldManifold #foreign libmanifoldc;
manifold_batch_hull :: (mem: *void, ms: *ManifoldManifoldVec) -> *ManifoldManifold #foreign libmanifoldc;
manifold_hull_pts :: (mem: *void, ps: *ManifoldVec3, length: u64) -> *ManifoldManifold #foreign libmanifoldc;

// Manifold Transformations
manifold_translate :: (mem: *void, m: *ManifoldManifold, x: float64, y: float64, z: float64) -> *ManifoldManifold #foreign libmanifoldc;

manifold_rotate :: (mem: *void, m: *ManifoldManifold, x: float64, y: float64, z: float64) -> *ManifoldManifold #foreign libmanifoldc;

manifold_scale :: (mem: *void, m: *ManifoldManifold, x: float64, y: float64, z: float64) -> *ManifoldManifold #foreign libmanifoldc;

manifold_transform :: (mem: *void, m: *ManifoldManifold, x1: float64, y1: float64, z1: float64, x2: float64, y2: float64, z2: float64, x3: float64, y3: float64, z3: float64, x4: float64, y4: float64, z4: float64) -> *ManifoldManifold #foreign libmanifoldc;

manifold_mirror :: (mem: *void, m: *ManifoldManifold, nx: float64, ny: float64, nz: float64) -> *ManifoldManifold #foreign libmanifoldc;

manifold_warp :: (mem: *void, m: *ManifoldManifold, fun: #type (unknown0: float64, unknown1: float64, unknown2: float64, unknown3: *void) -> ManifoldVec3 #c_call, ctx: *void) -> *ManifoldManifold #foreign libmanifoldc;

manifold_smooth_by_normals :: (mem: *void, m: *ManifoldManifold, normalIdx: s32) -> *ManifoldManifold #foreign libmanifoldc;

manifold_smooth_out :: (mem: *void, m: *ManifoldManifold, minSharpAngle: float64, minSmoothness: float64) -> *ManifoldManifold #foreign libmanifoldc;

manifold_refine :: (mem: *void, m: *ManifoldManifold, refine: s32) -> *ManifoldManifold #foreign libmanifoldc;
manifold_refine_to_length :: (mem: *void, m: *ManifoldManifold, length: float64) -> *ManifoldManifold #foreign libmanifoldc;

manifold_refine_to_tolerance :: (mem: *void, m: *ManifoldManifold, tolerance: float64) -> *ManifoldManifold #foreign libmanifoldc;

// Manifold Shapes / Constructors
manifold_empty :: (mem: *void) -> *ManifoldManifold #foreign libmanifoldc;
manifold_copy :: (mem: *void, m: *ManifoldManifold) -> *ManifoldManifold #foreign libmanifoldc;
manifold_tetrahedron :: (mem: *void) -> *ManifoldManifold #foreign libmanifoldc;
manifold_cube :: (mem: *void, x: float64, y: float64, z: float64, center: s32) -> *ManifoldManifold #foreign libmanifoldc;

manifold_cylinder :: (mem: *void, height: float64, radius_low: float64, radius_high: float64, circular_segments: s32, center: s32) -> *ManifoldManifold #foreign libmanifoldc;

manifold_sphere :: (mem: *void, radius: float64, circular_segments: s32) -> *ManifoldManifold #foreign libmanifoldc;

manifold_of_meshgl :: (mem: *void, mesh: *ManifoldMeshGL) -> *ManifoldManifold #foreign libmanifoldc;
manifold_of_meshgl64 :: (mem: *void, mesh: *ManifoldMeshGL64) -> *ManifoldManifold #foreign libmanifoldc;
manifold_smooth :: (mem: *void, mesh: *ManifoldMeshGL, half_edges: *u64, smoothness: *float64, n_idxs: u64) -> *ManifoldManifold #foreign libmanifoldc;

manifold_smooth64 :: (mem: *void, mesh: *ManifoldMeshGL64, half_edges: *u64, smoothness: *float64, n_idxs: u64) -> *ManifoldManifold #foreign libmanifoldc;

manifold_extrude :: (mem: *void, cs: *ManifoldPolygons, height: float64, slices: s32, twist_degrees: float64, scale_x: float64, scale_y: float64) -> *ManifoldManifold #foreign libmanifoldc;

manifold_revolve :: (mem: *void, cs: *ManifoldPolygons, circular_segments: s32, revolve_degrees: float64) -> *ManifoldManifold #foreign libmanifoldc;

manifold_compose :: (mem: *void, ms: *ManifoldManifoldVec) -> *ManifoldManifold #foreign libmanifoldc;
manifold_decompose :: (mem: *void, m: *ManifoldManifold) -> *ManifoldManifoldVec #foreign libmanifoldc;

manifold_as_original :: (mem: *void, m: *ManifoldManifold) -> *ManifoldManifold #foreign libmanifoldc;

// Manifold Info
manifold_is_empty :: (m: *ManifoldManifold) -> s32 #foreign libmanifoldc;
manifold_status :: (m: *ManifoldManifold) -> ManifoldError #foreign libmanifoldc;
manifold_num_vert :: (m: *ManifoldManifold) -> u64 #foreign libmanifoldc;
manifold_num_edge :: (m: *ManifoldManifold) -> u64 #foreign libmanifoldc;
manifold_num_tri :: (m: *ManifoldManifold) -> u64 #foreign libmanifoldc;
manifold_num_prop :: (m: *ManifoldManifold) -> u64 #foreign libmanifoldc;
manifold_bounding_box :: (mem: *void, m: *ManifoldManifold) -> *ManifoldBox #foreign libmanifoldc;
manifold_epsilon :: (m: *ManifoldManifold) -> float64 #foreign libmanifoldc;
manifold_genus :: (m: *ManifoldManifold) -> s32 #foreign libmanifoldc;
manifold_surface_area :: (m: *ManifoldManifold) -> float64 #foreign libmanifoldc;
manifold_volume :: (m: *ManifoldManifold) -> float64 #foreign libmanifoldc;
manifold_get_circular_segments :: (radius: float64) -> s32 #foreign libmanifoldc;
manifold_original_id :: (m: *ManifoldManifold) -> s32 #foreign libmanifoldc;
manifold_reserve_ids :: (n: u32) -> u32 #foreign libmanifoldc;
manifold_set_properties :: (mem: *void, m: *ManifoldManifold, num_prop: s32, fun: #type (new_prop: *float64, position: ManifoldVec3, old_prop: *float64, ctx: *void) -> void #c_call, ctx: *void) -> *ManifoldManifold #foreign libmanifoldc;

manifold_calculate_curvature :: (mem: *void, m: *ManifoldManifold, gaussian_idx: s32, mean_idx: s32) -> *ManifoldManifold #foreign libmanifoldc;

manifold_min_gap :: (m: *ManifoldManifold, other: *ManifoldManifold, searchLength: float64) -> float64 #foreign libmanifoldc;

manifold_calculate_normals :: (mem: *void, m: *ManifoldManifold, normal_idx: s32, min_sharp_angle: float64) -> *ManifoldManifold #foreign libmanifoldc;

// CrossSection Shapes/Constructors
manifold_cross_section_empty :: (mem: *void) -> *ManifoldCrossSection #foreign libmanifoldc;
manifold_cross_section_copy :: (mem: *void, cs: *ManifoldCrossSection) -> *ManifoldCrossSection #foreign libmanifoldc;

manifold_cross_section_of_simple_polygon :: (mem: *void, p: *ManifoldSimplePolygon, fr: ManifoldFillRule) -> *ManifoldCrossSection #foreign libmanifoldc;

manifold_cross_section_of_polygons :: (mem: *void, p: *ManifoldPolygons, fr: ManifoldFillRule) -> *ManifoldCrossSection #foreign libmanifoldc;

manifold_cross_section_square :: (mem: *void, x: float64, y: float64, center: s32) -> *ManifoldCrossSection #foreign libmanifoldc;

manifold_cross_section_circle :: (mem: *void, radius: float64, circular_segments: s32) -> *ManifoldCrossSection #foreign libmanifoldc;

manifold_cross_section_compose :: (mem: *void, csv: *ManifoldCrossSectionVec) -> *ManifoldCrossSection #foreign libmanifoldc;

manifold_cross_section_decompose :: (mem: *void, cs: *ManifoldCrossSection) -> *ManifoldCrossSectionVec #foreign libmanifoldc;

// CrossSection Vectors
manifold_cross_section_empty_vec :: (mem: *void) -> *ManifoldCrossSectionVec #foreign libmanifoldc;
manifold_cross_section_vec :: (mem: *void, sz: u64) -> *ManifoldCrossSectionVec #foreign libmanifoldc;
manifold_cross_section_vec_reserve :: (csv: *ManifoldCrossSectionVec, sz: u64) -> void #foreign libmanifoldc;

manifold_cross_section_vec_length :: (csv: *ManifoldCrossSectionVec) -> u64 #foreign libmanifoldc;
manifold_cross_section_vec_get :: (mem: *void, csv: *ManifoldCrossSectionVec, idx: u64) -> *ManifoldCrossSection #foreign libmanifoldc;

manifold_cross_section_vec_set :: (csv: *ManifoldCrossSectionVec, idx: u64, cs: *ManifoldCrossSection) -> void #foreign libmanifoldc;

manifold_cross_section_vec_push_back :: (csv: *ManifoldCrossSectionVec, cs: *ManifoldCrossSection) -> void #foreign libmanifoldc;

// CrossSection Booleans
manifold_cross_section_boolean :: (mem: *void, a: *ManifoldCrossSection, b: *ManifoldCrossSection, op: ManifoldOpType) -> *ManifoldCrossSection #foreign libmanifoldc;

manifold_cross_section_batch_boolean :: (mem: *void, csv: *ManifoldCrossSectionVec, op: ManifoldOpType) -> *ManifoldCrossSection #foreign libmanifoldc;

manifold_cross_section_union :: (mem: *void, a: *ManifoldCrossSection, b: *ManifoldCrossSection) -> *ManifoldCrossSection #foreign libmanifoldc;

manifold_cross_section_difference :: (mem: *void, a: *ManifoldCrossSection, b: *ManifoldCrossSection) -> *ManifoldCrossSection #foreign libmanifoldc;

manifold_cross_section_intersection :: (mem: *void, a: *ManifoldCrossSection, b: *ManifoldCrossSection) -> *ManifoldCrossSection #foreign libmanifoldc;

// CrossSection Convex Hulls
manifold_cross_section_hull :: (mem: *void, cs: *ManifoldCrossSection) -> *ManifoldCrossSection #foreign libmanifoldc;

manifold_cross_section_batch_hull :: (mem: *void, css: *ManifoldCrossSectionVec) -> *ManifoldCrossSection #foreign libmanifoldc;

manifold_cross_section_hull_simple_polygon :: (mem: *void, ps: *ManifoldSimplePolygon) -> *ManifoldCrossSection #foreign libmanifoldc;

manifold_cross_section_hull_polygons :: (mem: *void, ps: *ManifoldPolygons) -> *ManifoldCrossSection #foreign libmanifoldc;

// CrossSection Transformation
manifold_cross_section_translate :: (mem: *void, cs: *ManifoldCrossSection, x: float64, y: float64) -> *ManifoldCrossSection #foreign libmanifoldc;

manifold_cross_section_rotate :: (mem: *void, cs: *ManifoldCrossSection, deg: float64) -> *ManifoldCrossSection #foreign libmanifoldc;

manifold_cross_section_scale :: (mem: *void, cs: *ManifoldCrossSection, x: float64, y: float64) -> *ManifoldCrossSection #foreign libmanifoldc;

manifold_cross_section_mirror :: (mem: *void, cs: *ManifoldCrossSection, ax_x: float64, ax_y: float64) -> *ManifoldCrossSection #foreign libmanifoldc;

manifold_cross_section_transform :: (mem: *void, cs: *ManifoldCrossSection, x1: float64, y1: float64, x2: float64, y2: float64, x3: float64, y3: float64) -> *ManifoldCrossSection #foreign libmanifoldc;

manifold_cross_section_warp :: (mem: *void, cs: *ManifoldCrossSection, fun: #type (unknown0: float64, unknown1: float64) -> ManifoldVec2 #c_call) -> *ManifoldCrossSection #foreign libmanifoldc;

manifold_cross_section_simplify :: (mem: *void, cs: *ManifoldCrossSection, epsilon: float64) -> *ManifoldCrossSection #foreign libmanifoldc;

manifold_cross_section_offset :: (mem: *void, cs: *ManifoldCrossSection, delta: float64, jt: ManifoldJoinType, miter_limit: float64, circular_segments: s32) -> *ManifoldCrossSection #foreign libmanifoldc;

// CrossSection Info
manifold_cross_section_area :: (cs: *ManifoldCrossSection) -> float64 #foreign libmanifoldc;
manifold_cross_section_num_vert :: (cs: *ManifoldCrossSection) -> u64 #foreign libmanifoldc;
manifold_cross_section_num_contour :: (cs: *ManifoldCrossSection) -> u64 #foreign libmanifoldc;
manifold_cross_section_is_empty :: (cs: *ManifoldCrossSection) -> s32 #foreign libmanifoldc;
manifold_cross_section_bounds :: (mem: *void, cs: *ManifoldCrossSection) -> *ManifoldRect #foreign libmanifoldc;

manifold_cross_section_to_polygons :: (mem: *void, cs: *ManifoldCrossSection) -> *ManifoldPolygons #foreign libmanifoldc;

// Rectangle
manifold_rect :: (mem: *void, x1: float64, y1: float64, x2: float64, y2: float64) -> *ManifoldRect #foreign libmanifoldc;

manifold_rect_min :: (r: *ManifoldRect) -> ManifoldVec2 #foreign libmanifoldc;
manifold_rect_max :: (r: *ManifoldRect) -> ManifoldVec2 #foreign libmanifoldc;
manifold_rect_dimensions :: (r: *ManifoldRect) -> ManifoldVec2 #foreign libmanifoldc;
manifold_rect_center :: (r: *ManifoldRect) -> ManifoldVec2 #foreign libmanifoldc;
manifold_rect_scale :: (r: *ManifoldRect) -> float64 #foreign libmanifoldc;
manifold_rect_contains_pt :: (r: *ManifoldRect, x: float64, y: float64) -> s32 #foreign libmanifoldc;
manifold_rect_contains_rect :: (a: *ManifoldRect, b: *ManifoldRect) -> s32 #foreign libmanifoldc;
manifold_rect_include_pt :: (r: *ManifoldRect, x: float64, y: float64) -> void #foreign libmanifoldc;
manifold_rect_union :: (mem: *void, a: *ManifoldRect, b: *ManifoldRect) -> *ManifoldRect #foreign libmanifoldc;
manifold_rect_transform :: (mem: *void, r: *ManifoldRect, x1: float64, y1: float64, x2: float64, y2: float64, x3: float64, y3: float64) -> *ManifoldRect #foreign libmanifoldc;

manifold_rect_translate :: (mem: *void, r: *ManifoldRect, x: float64, y: float64) -> *ManifoldRect #foreign libmanifoldc;

manifold_rect_mul :: (mem: *void, r: *ManifoldRect, x: float64, y: float64) -> *ManifoldRect #foreign libmanifoldc;
manifold_rect_does_overlap_rect :: (a: *ManifoldRect, r: *ManifoldRect) -> s32 #foreign libmanifoldc;
manifold_rect_is_empty :: (r: *ManifoldRect) -> s32 #foreign libmanifoldc;
manifold_rect_is_finite :: (r: *ManifoldRect) -> s32 #foreign libmanifoldc;

// Bounding Box
manifold_box :: (mem: *void, x1: float64, y1: float64, z1: float64, x2: float64, y2: float64, z2: float64) -> *ManifoldBox #foreign libmanifoldc;

manifold_box_min :: (b: *ManifoldBox) -> ManifoldVec3 #foreign libmanifoldc;
manifold_box_max :: (b: *ManifoldBox) -> ManifoldVec3 #foreign libmanifoldc;
manifold_box_dimensions :: (b: *ManifoldBox) -> ManifoldVec3 #foreign libmanifoldc;
manifold_box_center :: (b: *ManifoldBox) -> ManifoldVec3 #foreign libmanifoldc;
manifold_box_scale :: (b: *ManifoldBox) -> float64 #foreign libmanifoldc;
manifold_box_contains_pt :: (b: *ManifoldBox, x: float64, y: float64, z: float64) -> s32 #foreign libmanifoldc;
manifold_box_contains_box :: (a: *ManifoldBox, b: *ManifoldBox) -> s32 #foreign libmanifoldc;
manifold_box_include_pt :: (b: *ManifoldBox, x: float64, y: float64, z: float64) -> void #foreign libmanifoldc;
manifold_box_union :: (mem: *void, a: *ManifoldBox, b: *ManifoldBox) -> *ManifoldBox #foreign libmanifoldc;
manifold_box_transform :: (mem: *void, b: *ManifoldBox, x1: float64, y1: float64, z1: float64, x2: float64, y2: float64, z2: float64, x3: float64, y3: float64, z3: float64, x4: float64, y4: float64, z4: float64) -> *ManifoldBox #foreign libmanifoldc;

manifold_box_translate :: (mem: *void, b: *ManifoldBox, x: float64, y: float64, z: float64) -> *ManifoldBox #foreign libmanifoldc;

manifold_box_mul :: (mem: *void, b: *ManifoldBox, x: float64, y: float64, z: float64) -> *ManifoldBox #foreign libmanifoldc;

manifold_box_does_overlap_pt :: (b: *ManifoldBox, x: float64, y: float64, z: float64) -> s32 #foreign libmanifoldc;
manifold_box_does_overlap_box :: (a: *ManifoldBox, b: *ManifoldBox) -> s32 #foreign libmanifoldc;
manifold_box_is_finite :: (b: *ManifoldBox) -> s32 #foreign libmanifoldc;

// Static Quality Globals
manifold_set_min_circular_angle :: (degrees: float64) -> void #foreign libmanifoldc;
manifold_set_min_circular_edge_length :: (length: float64) -> void #foreign libmanifoldc;
manifold_set_circular_segments :: (number: s32) -> void #foreign libmanifoldc;
manifold_reset_to_circular_defaults :: () -> void #foreign libmanifoldc;

// Manifold Mesh Extraction
manifold_meshgl_num_prop :: (m: *ManifoldMeshGL) -> s32 #foreign libmanifoldc;
manifold_meshgl_num_vert :: (m: *ManifoldMeshGL) -> s32 #foreign libmanifoldc;
manifold_meshgl_num_tri :: (m: *ManifoldMeshGL) -> s32 #foreign libmanifoldc;
manifold_meshgl_vert_properties_length :: (m: *ManifoldMeshGL) -> u64 #foreign libmanifoldc;
manifold_meshgl_tri_length :: (m: *ManifoldMeshGL) -> u64 #foreign libmanifoldc;
manifold_meshgl_merge_length :: (m: *ManifoldMeshGL) -> u64 #foreign libmanifoldc;
manifold_meshgl_run_index_length :: (m: *ManifoldMeshGL) -> u64 #foreign libmanifoldc;
manifold_meshgl_run_original_id_length :: (m: *ManifoldMeshGL) -> u64 #foreign libmanifoldc;
manifold_meshgl_run_transform_length :: (m: *ManifoldMeshGL) -> u64 #foreign libmanifoldc;
manifold_meshgl_face_id_length :: (m: *ManifoldMeshGL) -> u64 #foreign libmanifoldc;
manifold_meshgl_tangent_length :: (m: *ManifoldMeshGL) -> u64 #foreign libmanifoldc;
manifold_meshgl_vert_properties :: (mem: *void, m: *ManifoldMeshGL) -> *float #foreign libmanifoldc;
manifold_meshgl_tri_verts :: (mem: *void, m: *ManifoldMeshGL) -> *u32 #foreign libmanifoldc;
manifold_meshgl_merge_from_vert :: (mem: *void, m: *ManifoldMeshGL) -> *u32 #foreign libmanifoldc;
manifold_meshgl_merge_to_vert :: (mem: *void, m: *ManifoldMeshGL) -> *u32 #foreign libmanifoldc;
manifold_meshgl_run_index :: (mem: *void, m: *ManifoldMeshGL) -> *u32 #foreign libmanifoldc;
manifold_meshgl_run_original_id :: (mem: *void, m: *ManifoldMeshGL) -> *u32 #foreign libmanifoldc;
manifold_meshgl_run_transform :: (mem: *void, m: *ManifoldMeshGL) -> *float #foreign libmanifoldc;
manifold_meshgl_face_id :: (mem: *void, m: *ManifoldMeshGL) -> *u32 #foreign libmanifoldc;
manifold_meshgl_halfedge_tangent :: (mem: *void, m: *ManifoldMeshGL) -> *float #foreign libmanifoldc;

manifold_meshgl64_num_prop :: (m: *ManifoldMeshGL64) -> u64 #foreign libmanifoldc;
manifold_meshgl64_num_vert :: (m: *ManifoldMeshGL64) -> u64 #foreign libmanifoldc;
manifold_meshgl64_num_tri :: (m: *ManifoldMeshGL64) -> u64 #foreign libmanifoldc;
manifold_meshgl64_vert_properties_length :: (m: *ManifoldMeshGL64) -> u64 #foreign libmanifoldc;
manifold_meshgl64_tri_length :: (m: *ManifoldMeshGL64) -> u64 #foreign libmanifoldc;
manifold_meshgl64_merge_length :: (m: *ManifoldMeshGL64) -> u64 #foreign libmanifoldc;
manifold_meshgl64_run_index_length :: (m: *ManifoldMeshGL64) -> u64 #foreign libmanifoldc;
manifold_meshgl64_run_original_id_length :: (m: *ManifoldMeshGL64) -> u64 #foreign libmanifoldc;
manifold_meshgl64_run_transform_length :: (m: *ManifoldMeshGL64) -> u64 #foreign libmanifoldc;
manifold_meshgl64_face_id_length :: (m: *ManifoldMeshGL64) -> u64 #foreign libmanifoldc;
manifold_meshgl64_tangent_length :: (m: *ManifoldMeshGL64) -> u64 #foreign libmanifoldc;
manifold_meshgl64_vert_properties :: (mem: *void, m: *ManifoldMeshGL64) -> *float64 #foreign libmanifoldc;
manifold_meshgl64_tri_verts :: (mem: *void, m: *ManifoldMeshGL64) -> *u64 #foreign libmanifoldc;
manifold_meshgl64_merge_from_vert :: (mem: *void, m: *ManifoldMeshGL64) -> *u64 #foreign libmanifoldc;
manifold_meshgl64_merge_to_vert :: (mem: *void, m: *ManifoldMeshGL64) -> *u64 #foreign libmanifoldc;
manifold_meshgl64_run_index :: (mem: *void, m: *ManifoldMeshGL64) -> *u64 #foreign libmanifoldc;
manifold_meshgl64_run_original_id :: (mem: *void, m: *ManifoldMeshGL64) -> *u32 #foreign libmanifoldc;
manifold_meshgl64_run_transform :: (mem: *void, m: *ManifoldMeshGL64) -> *float64 #foreign libmanifoldc;
manifold_meshgl64_face_id :: (mem: *void, m: *ManifoldMeshGL64) -> *u64 #foreign libmanifoldc;
manifold_meshgl64_halfedge_tangent :: (mem: *void, m: *ManifoldMeshGL64) -> *float64 #foreign libmanifoldc;

// Triangulation
manifold_triangulate :: (mem: *void, ps: *ManifoldPolygons, epsilon: float64) -> *ManifoldTriangulation #foreign libmanifoldc;

manifold_triangulation_num_tri :: (m: *ManifoldTriangulation) -> u64 #foreign libmanifoldc;
manifold_triangulation_tri_verts :: (mem: *void, m: *ManifoldTriangulation) -> *s32 #foreign libmanifoldc;

// memory size
manifold_manifold_size :: () -> u64 #foreign libmanifoldc;
manifold_manifold_vec_size :: () -> u64 #foreign libmanifoldc;
manifold_cross_section_size :: () -> u64 #foreign libmanifoldc;
manifold_cross_section_vec_size :: () -> u64 #foreign libmanifoldc;
manifold_simple_polygon_size :: () -> u64 #foreign libmanifoldc;
manifold_polygons_size :: () -> u64 #foreign libmanifoldc;
manifold_manifold_pair_size :: () -> u64 #foreign libmanifoldc;
manifold_meshgl_size :: () -> u64 #foreign libmanifoldc;
manifold_meshgl64_size :: () -> u64 #foreign libmanifoldc;
manifold_box_size :: () -> u64 #foreign libmanifoldc;
manifold_rect_size :: () -> u64 #foreign libmanifoldc;

manifold_triangulation_size :: () -> u64 #foreign libmanifoldc;

// allocation
manifold_alloc_manifold :: () -> *ManifoldManifold #foreign libmanifoldc;
manifold_alloc_manifold_vec :: () -> *ManifoldManifoldVec #foreign libmanifoldc;
manifold_alloc_cross_section :: () -> *ManifoldCrossSection #foreign libmanifoldc;
manifold_alloc_cross_section_vec :: () -> *ManifoldCrossSectionVec #foreign libmanifoldc;
manifold_alloc_simple_polygon :: () -> *ManifoldSimplePolygon #foreign libmanifoldc;
manifold_alloc_polygons :: () -> *ManifoldPolygons #foreign libmanifoldc;
manifold_alloc_meshgl :: () -> *ManifoldMeshGL #foreign libmanifoldc;
manifold_alloc_meshgl64 :: () -> *ManifoldMeshGL64 #foreign libmanifoldc;
manifold_alloc_box :: () -> *ManifoldBox #foreign libmanifoldc;
manifold_alloc_rect :: () -> *ManifoldRect #foreign libmanifoldc;
manifold_alloc_triangulation :: () -> *ManifoldTriangulation #foreign libmanifoldc;

// destruction
manifold_destruct_manifold :: (m: *ManifoldManifold) -> void #foreign libmanifoldc;
manifold_destruct_manifold_vec :: (ms: *ManifoldManifoldVec) -> void #foreign libmanifoldc;
manifold_destruct_cross_section :: (m: *ManifoldCrossSection) -> void #foreign libmanifoldc;
manifold_destruct_cross_section_vec :: (csv: *ManifoldCrossSectionVec) -> void #foreign libmanifoldc;
manifold_destruct_simple_polygon :: (p: *ManifoldSimplePolygon) -> void #foreign libmanifoldc;
manifold_destruct_polygons :: (p: *ManifoldPolygons) -> void #foreign libmanifoldc;
manifold_destruct_meshgl :: (m: *ManifoldMeshGL) -> void #foreign libmanifoldc;
manifold_destruct_meshgl64 :: (m: *ManifoldMeshGL64) -> void #foreign libmanifoldc;
manifold_destruct_box :: (b: *ManifoldBox) -> void #foreign libmanifoldc;
manifold_destruct_rect :: (b: *ManifoldRect) -> void #foreign libmanifoldc;
manifold_destruct_triangulation :: (M: *ManifoldTriangulation) -> void #foreign libmanifoldc;

// pointer free + destruction
manifold_delete_manifold :: (m: *ManifoldManifold) -> void #foreign libmanifoldc;
manifold_delete_manifold_vec :: (ms: *ManifoldManifoldVec) -> void #foreign libmanifoldc;
manifold_delete_cross_section :: (cs: *ManifoldCrossSection) -> void #foreign libmanifoldc;
manifold_delete_cross_section_vec :: (csv: *ManifoldCrossSectionVec) -> void #foreign libmanifoldc;
manifold_delete_simple_polygon :: (p: *ManifoldSimplePolygon) -> void #foreign libmanifoldc;
manifold_delete_polygons :: (p: *ManifoldPolygons) -> void #foreign libmanifoldc;
manifold_delete_meshgl :: (m: *ManifoldMeshGL) -> void #foreign libmanifoldc;
manifold_delete_meshgl64 :: (m: *ManifoldMeshGL64) -> void #foreign libmanifoldc;
manifold_delete_box :: (b: *ManifoldBox) -> void #foreign libmanifoldc;
manifold_delete_rect :: (b: *ManifoldRect) -> void #foreign libmanifoldc;
manifold_delete_triangulation :: (m: *ManifoldTriangulation) -> void #foreign libmanifoldc;

#scope_file

#import "Basic"; // For assert

libmanifoldc :: #library "linux/libmanifoldc";

#run {
    {
        instance: ManifoldManifoldPair;
        assert(((cast(*void)(*instance.first)) - cast(*void)(*instance)) == 0, "ManifoldManifoldPair.first has unexpected offset % instead of 0", ((cast(*void)(*instance.first)) - cast(*void)(*instance)));
        assert(size_of(type_of(ManifoldManifoldPair.first)) == 8, "ManifoldManifoldPair.first has unexpected size % instead of 8", size_of(type_of(ManifoldManifoldPair.first)));
        assert(((cast(*void)(*instance.second)) - cast(*void)(*instance)) == 8, "ManifoldManifoldPair.second has unexpected offset % instead of 8", ((cast(*void)(*instance.second)) - cast(*void)(*instance)));
        assert(size_of(type_of(ManifoldManifoldPair.second)) == 8, "ManifoldManifoldPair.second has unexpected size % instead of 8", size_of(type_of(ManifoldManifoldPair.second)));
        assert(size_of(ManifoldManifoldPair) == 16, "ManifoldManifoldPair has size % instead of 16", size_of(ManifoldManifoldPair));
    }

    {
        instance: ManifoldVec2;
        assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "ManifoldVec2.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
        assert(size_of(type_of(ManifoldVec2.x)) == 8, "ManifoldVec2.x has unexpected size % instead of 8", size_of(type_of(ManifoldVec2.x)));
        assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 8, "ManifoldVec2.y has unexpected offset % instead of 8", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
        assert(size_of(type_of(ManifoldVec2.y)) == 8, "ManifoldVec2.y has unexpected size % instead of 8", size_of(type_of(ManifoldVec2.y)));
        assert(size_of(ManifoldVec2) == 16, "ManifoldVec2 has size % instead of 16", size_of(ManifoldVec2));
    }

    {
        instance: ManifoldVec3;
        assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "ManifoldVec3.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
        assert(size_of(type_of(ManifoldVec3.x)) == 8, "ManifoldVec3.x has unexpected size % instead of 8", size_of(type_of(ManifoldVec3.x)));
        assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 8, "ManifoldVec3.y has unexpected offset % instead of 8", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
        assert(size_of(type_of(ManifoldVec3.y)) == 8, "ManifoldVec3.y has unexpected size % instead of 8", size_of(type_of(ManifoldVec3.y)));
        assert(((cast(*void)(*instance.z)) - cast(*void)(*instance)) == 16, "ManifoldVec3.z has unexpected offset % instead of 16", ((cast(*void)(*instance.z)) - cast(*void)(*instance)));
        assert(size_of(type_of(ManifoldVec3.z)) == 8, "ManifoldVec3.z has unexpected size % instead of 8", size_of(type_of(ManifoldVec3.z)));
        assert(size_of(ManifoldVec3) == 24, "ManifoldVec3 has size % instead of 24", size_of(ManifoldVec3));
    }

    {
        instance: ManifoldIVec3;
        assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "ManifoldIVec3.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
        assert(size_of(type_of(ManifoldIVec3.x)) == 4, "ManifoldIVec3.x has unexpected size % instead of 4", size_of(type_of(ManifoldIVec3.x)));
        assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 4, "ManifoldIVec3.y has unexpected offset % instead of 4", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
        assert(size_of(type_of(ManifoldIVec3.y)) == 4, "ManifoldIVec3.y has unexpected size % instead of 4", size_of(type_of(ManifoldIVec3.y)));
        assert(((cast(*void)(*instance.z)) - cast(*void)(*instance)) == 8, "ManifoldIVec3.z has unexpected offset % instead of 8", ((cast(*void)(*instance.z)) - cast(*void)(*instance)));
        assert(size_of(type_of(ManifoldIVec3.z)) == 4, "ManifoldIVec3.z has unexpected size % instead of 4", size_of(type_of(ManifoldIVec3.z)));
        assert(size_of(ManifoldIVec3) == 12, "ManifoldIVec3 has size % instead of 12", size_of(ManifoldIVec3));
    }

    {
        instance: ManifoldVec4;
        assert(((cast(*void)(*instance.x)) - cast(*void)(*instance)) == 0, "ManifoldVec4.x has unexpected offset % instead of 0", ((cast(*void)(*instance.x)) - cast(*void)(*instance)));
        assert(size_of(type_of(ManifoldVec4.x)) == 8, "ManifoldVec4.x has unexpected size % instead of 8", size_of(type_of(ManifoldVec4.x)));
        assert(((cast(*void)(*instance.y)) - cast(*void)(*instance)) == 8, "ManifoldVec4.y has unexpected offset % instead of 8", ((cast(*void)(*instance.y)) - cast(*void)(*instance)));
        assert(size_of(type_of(ManifoldVec4.y)) == 8, "ManifoldVec4.y has unexpected size % instead of 8", size_of(type_of(ManifoldVec4.y)));
        assert(((cast(*void)(*instance.z)) - cast(*void)(*instance)) == 16, "ManifoldVec4.z has unexpected offset % instead of 16", ((cast(*void)(*instance.z)) - cast(*void)(*instance)));
        assert(size_of(type_of(ManifoldVec4.z)) == 8, "ManifoldVec4.z has unexpected size % instead of 8", size_of(type_of(ManifoldVec4.z)));
        assert(((cast(*void)(*instance.w)) - cast(*void)(*instance)) == 24, "ManifoldVec4.w has unexpected offset % instead of 24", ((cast(*void)(*instance.w)) - cast(*void)(*instance)));
        assert(size_of(type_of(ManifoldVec4.w)) == 8, "ManifoldVec4.w has unexpected size % instead of 8", size_of(type_of(ManifoldVec4.w)));
        assert(size_of(ManifoldVec4) == 32, "ManifoldVec4 has size % instead of 32", size_of(ManifoldVec4));
    }

    {
        instance: ManifoldProperties;
        assert(((cast(*void)(*instance.surface_area)) - cast(*void)(*instance)) == 0, "ManifoldProperties.surface_area has unexpected offset % instead of 0", ((cast(*void)(*instance.surface_area)) - cast(*void)(*instance)));
        assert(size_of(type_of(ManifoldProperties.surface_area)) == 8, "ManifoldProperties.surface_area has unexpected size % instead of 8", size_of(type_of(ManifoldProperties.surface_area)));
        assert(((cast(*void)(*instance.volume)) - cast(*void)(*instance)) == 8, "ManifoldProperties.volume has unexpected offset % instead of 8", ((cast(*void)(*instance.volume)) - cast(*void)(*instance)));
        assert(size_of(type_of(ManifoldProperties.volume)) == 8, "ManifoldProperties.volume has unexpected size % instead of 8", size_of(type_of(ManifoldProperties.volume)));
        assert(size_of(ManifoldProperties) == 16, "ManifoldProperties has size % instead of 16", size_of(ManifoldProperties));
    }
}

