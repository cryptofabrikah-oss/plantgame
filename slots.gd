extends Panel

var plantas_path = "res://assets/plants/"
var planta_no_slot = null  # Apenas 1 slot

# Caminho da cena que mostra as plantas disponíveis
@onready var cena_selecao_planta = preload("res://ui/SelecaoPlanta.tscn")

func _on_btn_plantar_pressed():
	var seletor = cena_selecao_planta.instantiate()
	seletor.planta_selecionada.connect(_on_planta_selecionada)
	get_tree().current_scene.add_child(seletor)

func _on_planta_selecionada(nome):
	planta_no_slot = nome.to_lower()
	atualizar_ui()

func _ready():
	$SlotsContainer/slot0/BtnPlantar.pressed.connect(_on_btn_plantar_pressed)
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
		planta_sprite.visible = true
		btn_plantar.visible = false
