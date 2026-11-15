class_name Player extends CharacterBody2D

signal gameover
@export var PUSH_FORCE = 300
@export var SPEED = 300.0
var isAttacking = false
var currentApparence : String = "papy"
enum Abilities {Select, Lance, Grab, Piou}
var dic : Dictionary = {Abilities.Select : "select", Abilities.Lance : "lance", Abilities.Grab : "grab", Abilities.Piou : "piou"}
var unlockedAbilities : Array[int] = []
var pv : int
@export var maxPv : int = 20

@export var lance_damage = 1

var heading = 0
const headingSpeed = 8

func _ready() -> void:
	pv = maxPv
	$Apparences/LanceEffectZone/CollisionShape2D.disabled = true


func _process(delta: float) -> void:
	var dtheta = heading - $Heading.rotation
	if dtheta > PI:
		dtheta -= TAU
	if dtheta < -PI:
		dtheta += TAU

	if(dtheta > 0):
		$Heading.rotation = fmod($Heading.rotation + headingSpeed * delta * abs(dtheta), TAU)
	if(dtheta < 0):
		$Heading.rotation = fmod($Heading.rotation - headingSpeed * delta * abs(dtheta), TAU)

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
	if velocity.length() > 0:
		heading = velocity.angle()

	move_and_slide()

func set_apparence(name: String):
	if(currentApparence):
		get_node("Apparences/" + currentApparence).hide()
	get_node("Apparences/" + name).show()
	currentApparence = name
	
func unlock_lance():
	$Heading.show()
	unlockedAbilities.append(Abilities.Lance)

func ability(ability: int):
	if ability == Abilities.Select:
		select()
	if ability == Abilities.Lance:
		lance()
	if ability == Abilities.Grab:
		print("grab")
	if ability == Abilities.Piou:
		print("piou")

func select() -> void:
	$Apparences.rotation = heading

func lance() -> void:
	$Apparences.rotation = heading + deg_to_rad(115)
	$Apparences/LanceEffectZone/CollisionShape2D.disabled = false
	$LanceAnimation.play("ATTAQUE", -1, 1./0.1, false)
	$Heading.hide()
	var fat = func fat() -> void:
		$LanceAnimation.play("ATTAQUE", -1, -1./0.3, true)
	var end = func end() -> void:
		$Apparences/LanceEffectZone/CollisionShape2D.disabled = true
		$Apparences.rotation = 0
	var reload = func reload() -> void:
		isAttacking = false
		$Heading.show()
	schedule(fat, 0.1)
	schedule(end, 0.4)
	schedule(reload, 0.5)


func damaged(damage : int):
	pv -= damage
	$"Barre de vie".set_fill(float(pv)/maxPv)
	if pv <= 0:
		print("GameOver")
		gameover.emit()

func _on_area_2d_body_entered(body: Node2D) -> void:
	damaged(body.damage)
	
func reset():
	pv = maxPv
	$"Barre de vie".reset()
	isAttacking = false
	set_apparence("papy")


func _on_lance_effect_zone_body_entered(body: Node2D) -> void:
	body.apply_damage(lance_damage)

func schedule(function_name, delay):
	var timer = Timer.new()
	timer.connect("timeout", function_name)
	timer.connect("timeout", timer.queue_free)
	timer.wait_time = delay
	get_tree().root.add_child(timer)
	timer.start()
