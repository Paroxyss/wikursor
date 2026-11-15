class_name BarreDeVie extends Sprite2D

func _ready() -> void:
	hide()

func reset() -> void:
	hide.call_deferred()
	texture.gradient.set_offset(1, 1)
	

func set_fill(proportion: float):
	$Hide.start()
	var grad: Gradient = texture.gradient
	proportion = max(0.05, proportion)
	print(proportion)
	grad.set_offset(1, proportion)
	show()


func _on_hide_timeout() -> void:
	hide()
	pass # Replace with function body.
