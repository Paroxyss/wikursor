class_name Enemy extends RigidBody2D

@export var SPEED = 40.0
@export var damage : int = 1
@export
var target: CharacterBody2D

func _physics_process(delta: float) -> void:
	if not target:
		return
	var direction_cible = (target.global_position - global_position).normalized()
	apply_force(direction_cible * SPEED)
