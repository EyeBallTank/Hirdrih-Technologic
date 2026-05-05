extends StaticBody2D

@onready var animation = $AnimationPlayer
@onready var sprites = $AnimatedSprite2D

@export var spriteforclosed = "defaulthirdrih"
@export var spriteforopen = "openhirdrih"

func _ready() -> void:
	animation.play("RESET")
	Signals.pushable_button_pressed.connect(_Pushable_Barrier_Down)
	sprites.play(spriteforclosed)

func _Pushable_Barrier_Down():
	animation.play("opening")
	sprites.play(spriteforopen)

func die():
	queue_free()
