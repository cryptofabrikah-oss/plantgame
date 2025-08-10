extends Panel

var plantas_path = "res://assets/plants/"
var planta_no_slot = null  # Apenas 1 slot

func _ready():
	$SlotsContainer/slot0/BtnPlantar.pressed.connect(_on_btn_plantar_pressed)
	atualizar_ui()

func _on_btn_plantar_pressed():
	if planta_no_slot == null:
		planta_no_slot = "tomate"
		atualizar_ui()

func atualizar_ui():
	var planta_sprite = $SlotsContainer/slot0/PlantaSprite
	var btn_plantar = $SlotsContainer/slot0/BtnPlantar

	if planta_no_slot == null:
		planta_sprite.visible = false
		planta_sprite.texture = null
		btn_plantar.visible = true
	else:
		planta_sprite.texture = load("%s%s.png" % [plantas_path, planta_no_slot])
		planta_sprite.scale = Vector2(0.31, 0.31) # 50% do tamanho original
		planta_sprite.visible = true
		btn_plantar.visible = false
