class_name Spawner extends Node2D

@export var enemy: PackedScene
@export var timer : float
var player : CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_node("Timer").wait_time = timer
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_timer_timeout() -> void:
	var instance : Enemy= enemy.instantiate()
	add_child(instance)
	instance.target = player
