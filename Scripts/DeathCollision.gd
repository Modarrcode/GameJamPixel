extends Area2D

signal inDeathArea

func _on_body_entered(body):
	if(body.name == "player"):
		inDeathArea.emit()
	pass # Replace with function body.
