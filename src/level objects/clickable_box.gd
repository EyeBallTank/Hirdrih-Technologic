extends StaticBody2D


@onready var hurtbox = $ClickArea
@onready var animationplayer = $AnimationPlayer

func _ready() -> void:
	animationplayer.play("RESET")

func die():
	queue_free()

func pain_is_off():
	hurtbox.set_deferred("monitoring", false)

func pain_is_on():
	hurtbox.set_deferred("monitoring", true)


#func _on_click_area_body_entered(body: Node2D) -> void:
	#if body.name == "MagicArrow":
		#pass
		#if body.amiclicking == true:
			#animationplayer.play("DIE")
		#elif body.amiclicking == false:
			#pass


func _on_click_area_area_exited(area: Area2D) -> void:
	if area.is_in_group("trueclickablearea"):
		animationplayer.play("DIE")
