class_name Enemy extends RigidBody2D

@export var SPEED = 40.0
@export var damage : int = 1
@export var pvMax : int = 1

@onready
var pv = pvMax

@export
var target: CharacterBody2D

func _ready() -> void:
	$Icon.material = CanvasItemMaterial.new()

func _physics_process(delta: float) -> void:
	if not target:
		return
	var direction_cible = (target.global_position - global_position).normalized()
	apply_force(direction_cible * SPEED)


func apply_damage(amount: int) -> void:
	pv -= amount
	print(pv)
	if pv <= 0:
		queue_free()
	else:
		$Icon.material.blend_mode = CanvasItemMaterial.BLEND_MODE_SUB
		var res = func res():
			$Icon.material.blend_mode = CanvasItemMaterial.BLEND_MODE_MIX
		schedule(res, 0.2)

func schedule(function_name, delay):
	var timer = Timer.new()
	timer.connect("timeout", function_name)
	timer.connect("timeout", timer.queue_free)
	timer.wait_time = delay
	get_tree().root.add_child(timer)
	timer.start()
