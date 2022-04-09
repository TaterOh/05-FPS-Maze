extends Node

func play_music(music_clip: AudioStream):
	$Music/Music_Player.stream = music_clip
	$Music/Music_Player.play()

func play_sfx(pos: Vector3, audio_clip: AudioStream):
	for child in $SFX.get_children():
		if child.playing == false:
			child.stream = audio_clip
			child.transform.origin = pos
			child.play()
			break
