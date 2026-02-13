extends StaticBody2D


@onready var animationplayer = $AnimationPlayer
@onready var sprite = $AnimatedSprite2D
@export var animationname = "ACTIVE"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	animationplayer.play(animationname)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
