class_name Player_Camera extends Camera2D

var player: CharacterBody2D
var niveau: Node2D

@onready
var niv_viewport: Vector2 
@onready
var cam_viewport_radius

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	# print(niv_viewport, cam_viewport_radius)
	print(niveau)
	pass

func setup():
	niv_viewport = niveau.size
	cam_viewport_radius = self.get_viewport_rect().size / 2 / self.zoom
	print("setup !!")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = player.position
	position = position.clamp(cam_viewport_radius, niv_viewport - cam_viewport_radius)
