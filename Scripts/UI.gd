extends Node

# Called when the node enters the scene tree for the first time.
func _ready():
	$CanvasLayer/Label.text = "0"
	pass # Replace with function body.


func _on_area_2d_collected():
	$CanvasLayer/Label.text = str(int($CanvasLayer/Label.text) + 1)
	pass # Replace with function body.
