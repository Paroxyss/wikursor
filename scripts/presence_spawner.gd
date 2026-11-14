class_name PresenceSpawner extends Spawner

@export var collision: Area2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	collision.body_entered.connect(_on_body_entered)
	stop()
	pass # Replace with function body.


var triggered = false
func _on_body_entered(body: Node2D) -> void:
	if not triggered and body is CharacterBody2D:
		triggered = true
		reset()
