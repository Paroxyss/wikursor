class_name Enemy extends CharacterBody2D

const SPEED = 200.0

@onready
var joueur: CharacterBody2D = get_node("../Player")

signal appear

func _physics_process(delta: float) -> void:
	var delta_pos = (joueur.position - position).normalized()
	velocity = delta_pos * SPEED
	move_and_slide()
