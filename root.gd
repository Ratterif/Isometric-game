extends Node2D
@export var temperature = NoiseTexture2D
@export var humadity = NoiseTexture2D
@export var seed = 1
# Called when the node enters the scene tree for the first time.
func _ready():
	humadity.noise.seed = seed
	temperature.noise.seed = seed
	Global.tile_Map = $TileMap
	generate_biomes() # Replace with function body.
func generate_biomes():
	for x in range(64):
		for y in range(64):
			var biome = Global.get_biome(temperature.noise.get_noise_2d(x, y), humadity.noise.get_noise_2d(x, y))
			if biome:
				Global.tile_Map.set_cell(0, Vector2i(x, y), 1, Global.tiles[biome].atlas_pos)
			else:
				Global.tile_Map.set_cell(0, Vector2i(x, y), 1, Vector2i(0, 1))
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var player_tile = Global.tile_Map.local_to_map(Global.player.position)
	for x in range(player_tile.x - 20, player_tile.x + 20):
		for y in range(player_tile.y - 20, player_tile.y + 20):
			var biome = Global.get_biome(temperature.noise.get_noise_2d(x, y), humadity.noise.get_noise_2d(x, y))
			if Global.tile_Map.get_cell_atlas_coords(0, Vector2i(x, y)) == Vector2i(-1, -1):
				if biome:
					Global.tile_Map.set_cell(0, Vector2i(x, y), 1, Global.tiles[biome].atlas_pos)
				else:
					Global.tile_Map.set_cell(0, Vector2i(x, y), 1, Vector2i(0, 1))
