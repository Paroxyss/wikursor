extends Area2D

@onready
var player: Player = $"..".player

func _ready() -> void:
	if player.Abilities.Lance in player.unlockedAbilities:
		hide() 



func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		player.unlock_lance()
		hide()
	pass # Replace with function body.
