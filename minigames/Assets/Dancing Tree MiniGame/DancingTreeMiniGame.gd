extends StaticBody2D

onready var stats = $Stats

func _ready():
	pass


func _on_Hurtbox_area_entered(area):
	pass
	stats.health -= 1
	$AnimationPlayer.play("Hit")
	$GotHitSound.play()



func _on_Stats_no_health():
	$AnimatedSprite.play("boom")
	queue_free()
