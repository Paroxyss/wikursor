extends Sprite2D


func play_AHHHHHHHHHH():
	print("AHHHHHHHHHHHHH")
	$AudioStreamPlayer.play(0.2)
	$AudioStreamPlayer2.play(0.2)
	$AudioStreamPlayer3.play(0.2)
	$AudioStreamPlayer4.play()

func _on_video_stream_player_finished() -> void:
	$zzz.start()
	pass # Replace with function body.

func schedule(function_name, delay):
	var timer = Timer.new()
	timer.connect("timeout", function_name)
	timer.connect("timeout", timer.queue_free)
	timer.wait_time = delay
	get_tree().root.add_child(timer)
	timer.start()
