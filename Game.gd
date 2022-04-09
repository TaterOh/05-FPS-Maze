extends Spatial

var music_clip = load("res://Music/No Place For Straw Cowboys.ogg")

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	AudioManager.play_music(music_clip)
