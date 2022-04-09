extends Area

var sound = null

func _ready():
	sound = load("res://Sounds/coin.ogg")

func _on_Key_body_entered(body):
	if body.name == "Player":
		var exit = get_node_or_null("/root/Game/Maze/Exit")
		if exit != null:
			AudioManager.play_sfx(global_transform.origin, sound)
			exit.unlock()
			queue_free()
