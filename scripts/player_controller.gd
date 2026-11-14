extends CharacterBody2D


@export var PUSH_FORCE = 300
@export var SPEED = 300.0
var isAttacking = false
var currentApparence : String = "papy"
enum Abilities {Select, Lance, Grab, Piou}
var dic : Dictionary = {Abilities.Select : "select", Abilities.Lance : "lance", Abilities.Grab : "grab", Abilities.Piou : "piou"}
var unlockedAbilities : Array[int] = [Abilities.Lance]
var pv : int
@export var maxPv : int = 20

func _process(delta: float) -> void:
		
	for action in unlockedAbilities:
		if Input.is_action_just_pressed(dic[action]) and !isAttacking:
			isAttacking = true
			set_apparence(dic[action])
			ability(action)

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
	
func ability(ability: int):
	if ability == Abilities.Select:
		print ("select")
	if ability == Abilities.Lance:
		print("lance")
	if ability == Abilities.Grab:
		print("grab")
	if ability == Abilities.Piou:
		print("piou")
		

func damaged(damage : int):
	pv -= damage
	if pv <= 0:
		print("GameOver")

func _on_area_2d_body_entered(body: Node2D) -> void:
	print("aie")
	print(body)
	damaged(body.damage)
		
