extends Control

signal planta_selecionada(nome_planta)

var plantas_disponiveis = [
	{"nome": "Tomate", "icone": "res://assets/plants/tomate.png"},
	{"nome": "Cenoura", "icone": "res://assets/plants/cenoura.png"},
	{"nome": "Batata", "icone": "res://assets/plants/batata.png"}
]

func _ready():
	$ColorRect/painel_principal/VBoxContainer/texto_titulo.text = "Selecione a Planta"
	var grid = $ColorRect/painel_principal/VBoxContainer/grid_plantas
	grid.columns = 3

	for planta in plantas_disponiveis:
		var btn = Button.new()
		btn.text = planta.nome
		btn.icon = load(planta.icone)
		btn.icon_alignment = HORIZONTAL_ALIGNMENT_CENTER
		btn.vertical_icon_alignment = VERTICAL_ALIGNMENT_TOP
		btn.custom_minimum_size = Vector2(100, 100)
		btn.add_theme_font_size_override("font_size", 14)
		btn.pressed.connect(func():
			planta_selecionada.emit(planta.nome)
			queue_free()
		)

		grid.add_child(btn)

func _unhandled_input(event):
	# Fecha a seleção se clicar fora do painel
	if event is InputEventMouseButton and event.pressed:
		var painel = $ColorRect/painel_principal
		if not painel.get_global_rect().has_point(get_viewport().get_mouse_position()):
			queue_free()
