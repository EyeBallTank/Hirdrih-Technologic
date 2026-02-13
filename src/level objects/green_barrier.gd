extends StaticBody2D


@onready var animationplayer = $AnimationPlayer
@onready var sprite = $AnimatedSprite2D
@export var animationname = "ACTIVE"
@export var otheranimationname = "DEACTIVE"


func _ready() -> void:
	animationplayer.play(animationname)
	Signals.green_one_button_was_pressed.connect(_Green_Barrier_React_To_One)
	Signals.green_two_button_was_pressed.connect(_Green_Barrier_React_To_Two)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _Green_Barrier_React_To_One():
	animationplayer.play(otheranimationname)

func _Green_Barrier_React_To_Two():
	animationplayer.play(animationname)
