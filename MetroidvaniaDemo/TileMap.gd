extends TileMap

func _ready():
	for cell in get_used_cells():
		var shape = ConvexPolygonShape2D.new()
		shape.set_points([Vector2(0, 0), Vector2(16, 0), Vector2(16, 16), Vector2(0, 16)])  # rectangle
		tile_set.tile_add_shape(0, shape, Transform2D(0, map_to_world(cell) - cell_size))
		tile_set.tile_set_shape(0, 0, shape)
