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


func _on_click_area_body_entered(body: Node2D) -> void:
	if body.name == "MagicArrow":
		animationplayer.play("DIE")
