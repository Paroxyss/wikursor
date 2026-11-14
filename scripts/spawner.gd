class_name Spawner extends Node2D

@export var enemy: PackedScene
@export var interval : float = 1
@export var first_delay : float = 0.5
@export var amount : int = -1
@export var spread : Vector2 = Vector2(100, 100)
var amount_spawned : int = 0

var player : CharacterBody2D
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	reset()

func reset():
	$Interval.stop()
	$Interval.wait_time = interval
	$FirstDelay.wait_time = first_delay
	$FirstDelay.start()


func stop():
	$FirstDelay.stop()
	$Interval.stop()
	

func _on_interval_timeout() -> void:
	if(amount == amount_spawned):
		$Interval.stop()
		return
	amount_spawned += 1
	var instance : Enemy = enemy.instantiate()
	instance.target = player
	instance.position += Vector2(
		randf() * spread.x,
		randf() * spread.y
	) - spread / 2
	add_child(instance)


func _on_first_delay_timeout() -> void:
	$Interval.start()
	$Interval.paused = false
