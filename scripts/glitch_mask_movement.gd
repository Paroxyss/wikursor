extends Sprite2D

var time_factor = 0.003
var amp = 0.05
var baseScale = scale

func _process(delta: float) -> void:
	scale.x = baseScale.x * (1+amp*cos(Time.get_ticks_msec() * time_factor))
	scale.y = baseScale.y * (1+amp*sin(Time.get_ticks_msec() * time_factor))
