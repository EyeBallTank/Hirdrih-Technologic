extends Area2D



func _on_body_entered(body: Node2D) -> void:
	if body.name == "PlayerTest":
		if body.antivirusison == false:
			body.health - 10
		elif body.antivirusison == true:
			pass
		
