extends Node2D

@onready
var player = get_node("..").player

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if (position - player.position).length() < 400:
		$PlanchePhysique.freeze = false
		$PlanchePhysique2.freeze = false
		
	pass
