extends KinematicBody

var grunts = []
var Player = null
export var speed = 3
var is_targeting = false
var gravity = -30
var velocity = Vector3()

func _physics_process(delta):
	velocity.y += gravity * delta
	if Player == null:
		Player = get_node_or_null("/root/Game/Player")
	if Player != null:
		look_at(Player.global_transform.origin, Vector3.UP)
		if is_targeting:
			velocity.x = global_transform.origin.direction_to(Player.global_transform.origin).x * speed
			velocity.z = global_transform.origin.direction_to(Player.global_transform.origin).z * speed
			move_and_slide(velocity, Vector3.UP)

func _ready():
	grunts.append(load("res://Sounds/grunt1.ogg"))
	grunts.append(load("res://Sounds/grunt2.ogg"))
	is_targeting = false

func _on_Kill_body_entered(body):
	if body.name == "Player":
		AudioManager.play_sfx(global_transform.origin, grunts[int(rand_range(0, grunts.size()))])
		Global.lose()

func _on_Growl_body_entered(body):
	if body.name == "Player":
		AudioManager.play_sfx(global_transform.origin, grunts[int(rand_range(0, grunts.size()))])

func _on_Follow_body_entered(body):
	if body.name == "Player":
		is_targeting = true
