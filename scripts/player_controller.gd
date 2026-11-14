extends CharacterBody2D


@export var PUSH_FORCE = 300
@export var SPEED = 300.0

var currentApparence : String = "papy"

func _process(delta: float) -> void:
	if position.x > 1000 and currentApparence != "lance":
		set_apparence("lance")
	if position.x < 100 and currentApparence != "papy":
		set_apparence("papy")
		

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_horiz := Input.get_axis("move_left", "move_right")
	var direction_vert := Input.get_axis("move_up", "move_down")

	velocity = Vector2(
	 direction_horiz * SPEED,
	 direction_vert * SPEED
	)

	move_and_slide()

func set_apparence(name: String):
	if(currentApparence):
		get_node("Apparences/" + currentApparence).hide()
	get_node("Apparences/" + name).show()
	currentApparence = name
