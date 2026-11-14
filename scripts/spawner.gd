class_name Spawner extends Node2D

@export var enemy: PackedScene
@export var interval : float = 1
@export var first_delay : float = 0.5
@export var amount : int = -1

var player : CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Interval.stop()
	$Interval.wait_time = interval
	$FirstDelay.wait_time = first_delay
	$FirstDelay.start()

func _on_interval_timeout() -> void:
	if(amount == 0):
		$Interval.stop()
		return
	amount -= 1
	var instance : Enemy = enemy.instantiate()
	instance.target = player
	add_child(instance)


func _on_first_delay_timeout() -> void:
	$Interval.start()
	$Interval.paused = false
