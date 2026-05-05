extends Area2D


@onready var animationplayer = $AnimationPlayer
@onready var sprites = $AnimatedSprite2D

@export var spritenameforactive = "activehirdrih"
@export var spritenameforinactive = "inactivehirdrih"

func _ready() -> void:
	animationplayer.play("RESET")
	sprites.play(spritenameforactive)

func bring_up_the_signal():
	Signals.pushable_button_pressed.emit()


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("thisbatteryispushable"):
		animationplayer.play("pressed")
		sprites.play(spritenameforinactive)
