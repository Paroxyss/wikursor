class_name GameManager extends Node2D

@export var player : CharacterBody2D
var enemy = preload("res://entities/mechant1.tscn")
@onready var niveau : LevelProperties = get_node("Niveau")
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for spawner in niveau.spawnList:
		spawner.player = player
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
