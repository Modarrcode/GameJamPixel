extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	text = "0"
	pass # Replace with function body.


func _on_area_2d_collected():
	text = str(int(text) + 1)
	pass # Replace with function body.
