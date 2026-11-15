extends Sprite2D

@export var time_factor = 0.005
@export var amp = 0.08
@export var baseScale = scale

func _process(delta: float) -> void:
	scale.x = baseScale.x * (1+amp*abs(cos(Time.get_ticks_msec() * time_factor)))
	scale.y = baseScale.y * (1+amp*abs(cos(Time.get_ticks_msec() * time_factor)))
