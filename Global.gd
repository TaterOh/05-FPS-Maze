extends Node

var menu = null

func _ready():
	pause_mode = Node.PAUSE_MODE_PROCESS
	randomize()

func _unhandled_input(_event):
	if Input.is_action_pressed("menu"):
		if menu == null:
			menu = get_node_or_null("/root/Game/UI/Menu")
		if menu != null:
			if not menu.visible:
				Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
				get_tree().paused = true
				menu.show()
			else:
				play()

func play():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	get_tree().paused = false
	menu.hide()

func lose():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	var _scene = get_tree().change_scene("res://UI/Lose.tscn")

func win():
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	var _scene = get_tree().change_scene("res://UI/Win.tscn")
