extends Area2D


@onready var animationplayer = $AnimationPlayer
@onready var sprites = $AnimatedSprite2D

func _ready() -> void:
	animationplayer.play("RESET")




func bring_up_the_signal():
	Signals.pushable_button_pressed.emit()


func _on_body_entered(body: Node2D) -> void:
	if body.name == "PushableCharacter":
		animationplayer.play("pressed")
