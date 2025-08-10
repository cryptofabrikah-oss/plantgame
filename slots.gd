extends Panel

var slots = [null, null, null, null]  # Estado: null = vazio, ou string com o nome da planta
var plantas_path = "res://assets/plants/"  # caminho das texturas das plantas

func _ready():
	for i in range(4):
		var slot = $SlotsContainer.get_node("slot%d" % i)
		slot.connect("gui_input", self, "_on_slot_gui_input", [i])
		limpar_slot_visual(slot)
	atualizar_ui()

func _on_slot_gui_input(event, index):
	if event is InputEventMouseButton and event.pressed and event.button_index == BUTTON_LEFT:
		if slots[index] == null:
			plantar_no_slot(index, "tomate")  # exemplo: planta "tomate"
		else:
			print("Slot %d já está ocupado" % index)

func plantar_no_slot(index, planta_nome):
	slots[index] = planta_nome
	atualizar_ui()
	
func atualizar_ui():
	for i in range(4):
		var slot = $SlotsContainer.get_node("slot%d" % i)
		var planta_sprite = slot.get_node("PlantaSprite")
		if slots[i] == null:
			planta_sprite.texture = null
			planta_sprite.visible = false
		else:
			var textura = load("%s%s.png" % [plantas_path, slots[i]])
			planta_sprite.texture = textura
			planta_sprite.visible = true
			
func limpar_slot_visual(slot):
	var planta_sprite = slot.get_node("PlantaSprite")
	planta_sprite.texture = null
	planta_sprite.visible = false
