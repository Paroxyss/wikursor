class_name Enemy extends RigidBody2D

const SPEED = 40.0

@export
var target: CharacterBody2D

signal appear

func _physics_process(delta: float) -> void:
	var direction_cible = (target.global_position - global_position).normalized()
	apply_force(direction_cible * SPEED)
