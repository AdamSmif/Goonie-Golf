extends CanvasModulate


func _process(delta):
	var time = OS.get_time()
	var TimeInSeconds = time.hour * 3600 + time.minute * 60 + time.second
	var CurrentFrame = range_lerp(TimeInSeconds,0,86400,0,24)
	$AnimationPlayer.play("DayNightCycleAnimation")
	$AnimationPlayer.seek(CurrentFrame)
