extends Panel

func _gui_input(event):
	if event is InputEventMouseButton and event.pressed and event.button_index == MouseButton.LEFT:
		print("Clique detectado no slot ", name)
		# Aqui você pode chamar um método do nó pai via get_parent()
