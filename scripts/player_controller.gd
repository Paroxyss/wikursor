extends CharacterBody2D


@export var PUSH_FORCE = 300
@export var SPEED = 300.0

func _physics_process(delta: float) -> void:

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction_horiz := Input.get_axis("ui_left", "ui_right")
	var direction_vert := Input.get_axis("ui_up", "ui_down")

	velocity = Vector2(
	 direction_horiz * SPEED,
	 direction_vert * SPEED
	)

	if move_and_slide(): # true if collided
		for i in get_slide_collision_count():
			var col = get_slide_collision(i)
			if col.get_collider() is RigidBody2D:
				col.get_collider().free.call_deferred()
