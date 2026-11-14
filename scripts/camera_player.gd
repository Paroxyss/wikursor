extends Camera2D

@onready
var player: CharacterBody2D = get_node("../Player")
@onready
var niveau: Node2D = get_node("../GameManager/Niveau")
# @onready
# var niv_viewport: Vector2 = niveau.size
@onready
var cam_viewport_radius = self.get_viewport_rect().size / 2 / self.zoom

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# print(niv_viewport, cam_viewport_radius)
	print(niveau)
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = player.position
	# position = position.clamp(cam_viewport_radius, niv_viewport - cam_viewport_radius)
