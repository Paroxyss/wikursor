class_name GameManager extends Node2D
@export var cameraFile : PackedScene
var camera : Player_Camera
@export var playerFile : PackedScene

var player : CharacterBody2D
var niveau : LevelProperties
@export var index_niveau: int = 0

@export var levelList : Array[PackedScene]
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	niveau = levelList[index_niveau].instantiate()
	player = playerFile.instantiate()
	setup_level()
	player.gameover.connect(_on_game_over)
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (Input.is_action_just_pressed("Quit")):
		get_tree().quit()
	pass

func setup_level():
	niveau.player = player
	add_child(niveau)
	player.position = niveau.playerSpawn.position
	add_child(player)

	for spawner in niveau.spawnList:
		spawner.player = player

	camera = cameraFile.instantiate()
	camera.niveau = niveau
	camera.player = player
	camera.zoom = Vector2(2, 2)
	add_child(camera)

	niveau.next_level.connect(_on_next_level)

func _on_next_level() -> void:
	index_niveau += 1
	if levelList.size() <= index_niveau:
		print("fini !")
		return
	niveau.queue_free.call_deferred()
	niveau = levelList[index_niveau].instantiate()
	setup_level.call_deferred()

func _on_game_over():
	player.reset()
	niveau.queue_free.call_deferred()
	niveau = levelList[index_niveau].instantiate()
	setup_level.call_deferred()
	
