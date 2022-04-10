extends KinematicBody

var grunts = []
var Player = null

func _physics_process(_delta):
	if Player == null:
		Player = get_node_or_null("/root/Game/Player")
	if Player != null:
		look_at(Player.global_transform.origin, Vector3.UP)

func _ready():
	grunts.append(load("res://Sounds/grunt1.ogg"))
	grunts.append(load("res://Sounds/grunt2.ogg"))

func _on_Kill_body_entered(body):
	if body.name == "Player":
		AudioManager.play_sfx(global_transform.origin, grunts[int(rand_range(0, grunts.size()))])
		Global.lose()


func _on_Growl_body_entered(body):
	if body.name == "Player":
		AudioManager.play_sfx(global_transform.origin, grunts[int(rand_range(0, grunts.size()))])
