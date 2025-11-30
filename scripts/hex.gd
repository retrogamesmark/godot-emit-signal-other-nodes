# res://scripts/hex.gd
class_name Hex
extends Node3D

var grid: HexGrid
var hovered: bool = true # always hovered while testing


func _instantiate(grid_ref: HexGrid) -> void:
	print("instantiate: called")
	grid = grid_ref


# quick input key pressed 'enter'
func _input(event) -> void:
	if event.is_action_pressed("ui_accept") and hovered:
		print("_input: ui_accept pressed")
		
		if grid:
			grid.hex_clicked.emit()
			print("Hex: emitted hex_clicked")
