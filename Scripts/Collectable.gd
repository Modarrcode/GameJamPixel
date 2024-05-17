extends Area2D

signal collected

func _on_body_entered(body):
	if body.name == "player":
		collected.emit();
		queue_free()
