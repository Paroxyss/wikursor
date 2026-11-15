class_name LevelProperties extends Node2D

var player : Player

signal next_level

@onready
var size = ($Fond.get_rect().end - $Fond.get_rect().position) * $Fond.scale
@export var sizeOverride: Vector2
@export var playerSpawn : Node2D
@export var spawnList : Array[Spawner]

func _ready() -> void:
	if sizeOverride.x > 1:
		size = sizeOverride

func _on_area_2d_body_entered(body: Node2D) -> void:
	if not body is CharacterBody2D:
		return
	next_level.emit()
	# passage niveau suinant
