extends Area2D

func _ready() -> void:
	pass

func _process(delta: float) -> void:
	pass


func _on_body_entered(body: Node2D) -> void:
	if body.name == "PlayerTest":
		body.caniusearrow = true
#		Signals.playerpickeduparrow.emit()

#		Signals.emit_signal("playerpickeduparrow")
