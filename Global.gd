extends Node
var tiles = {"valley": {"atlas_pos": Vector2i(0, 0), "min_T": -0.25, "max_T": 0.25, "min_H": -0.25, "max_H": 0.25},
"desert": {"atlas_pos": Vector2i(1, 0), "min_T": 0.25, "max_T": 0.75, "min_H": -1, "max_H": -0.25},
"swamp": {"atlas_pos": Vector2i(1, 1), "min_T": -0.25, "max_T": 0.25, "min_H": 0.25, "max_H": 1},
}
var player
var tile_Map
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func get_biome(T, H):
	for type in tiles:
		if tiles[type].min_T <= T and tiles[type].max_T >= T and tiles[type].min_H <= H and tiles[type].max_H >= H:
			return type

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
