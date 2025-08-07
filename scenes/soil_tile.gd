extends Area2D

var is_planted = false
var growth_time = 1 # segundos
var timer = 0.0

func _process(delta):
	if is_planted:
		timer += delta
		if timer >= growth_time:
			$Sprite2D.texture = preload("res://assets/Oak_Tree.png")
			is_planted = false

func _on_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.pressed and not is_planted:
		$Sprite2D.texture = preload("res://assets/Oak_Tree_Small.png")
		is_planted = true
		timer = 0.0
