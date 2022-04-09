extends Control


func _ready():
	pass


func _on_Quit_pressed():
	get_tree().quit()


func _on_Continue_pressed():
	Global.play()
