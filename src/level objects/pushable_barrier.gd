extends StaticBody2D

@onready var animation = $AnimationPlayer

func _ready() -> void:
	animation.play("RESET")
	Signals.pushable_button_pressed.connect(_Pushable_Barrier_Down)


func _Pushable_Barrier_Down():
	animation.play("opening")
