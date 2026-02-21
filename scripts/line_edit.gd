extends LineEdit

func _ready():
	grab_focus()

func _on_text_submitted(new_text: String) -> void:
	Global.swipe = true
	Global.input_card = new_text
	print(Global.input_card)
	clear()
