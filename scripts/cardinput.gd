extends LineEdit

@onready var heidi = get_node("/root/Level2/heidi")
@onready var orpheus = get_node("/root/Level2/orpheus")

const playercards = [
	"5896295042795981",
	"6398840026017826"
]

func _ready():
	grab_focus()

func _on_text_submitted(new_text: String) -> void:
	Global.input_card = new_text
	print(Global.input_card)
	check_card()

	clear()

func check_card():
	var ip_card = Global.input_card
	
	if ip_card.contains(playercards[0]):
		print("orpheus is attacking")
		orpheus.attack()
		Global.is_new_card = false
	elif ip_card.contains(playercards[1]):
		print("heidi is attacking")
		heidi.attack()
		Global.is_new_card = false
	else:
		print("new card")
		Global.is_new_card = true
		var p = [heidi, orpheus]
		var rand = randi_range(0,p.size()-1)
		p[rand].shake()
		p[rand].attack()
