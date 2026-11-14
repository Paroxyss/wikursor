class_name GameManager extends Node2D
@export var cameraFile : PackedScene
var camera : Player_Camera
@export var playerFile : PackedScene
var player : CharacterBody2D
var niveau : LevelProperties
@export var levelList : Array[PackedScene]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player = playerFile.instantiate()
	add_child(player)
	niveau = levelList[0].instantiate()
	add_child(niveau)
	setup_level()
	camera = cameraFile.instantiate()
	camera.niveau = niveau
	camera.player = player
	add_child(camera)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass

func setup_level():
	for spawner in niveau.spawnList:
		spawner.player = player
