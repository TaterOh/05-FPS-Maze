extends Area

var grunts = []

func _ready():
	grunts.append(load("res://Sounds/grunt1.ogg"))
	grunts.append(load("res://Sounds/grunt2.ogg"))

func _on_Orc_body_entered(body):
	if body.name == "Player":
		AudioManager.play_sfx(global_transform.origin, grunts[int(rand_range(0, grunts.size()))])
		Global.lose()


func _on_Area_body_entered(body):
	if body.name == "Player":
		AudioManager.play_sfx(global_transform.origin, grunts[int(rand_range(0, grunts.size()))])
