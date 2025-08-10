extends Panel

signal planta_selecionada(nome)

func _ready():
	# Exemplo de botões fixos
	$GridContainer/TomateButton.pressed.connect(func(): _selecionar("tomate"))
	$GridContainer/MilhoButton.pressed.connect(func(): _selecionar("milho"))

func _selecionar(nome):
	emit_signal("planta_selecionada", nome)
	queue_free() # fecha a janela
