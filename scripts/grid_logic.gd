# res://scripts/grid_logic.gd
extends Node

@onready var grid: HexGrid = %HexGrid # access as unique name


func _ready():
	# let's defer to ensure it's ready!
	call_deferred("_connect_signal")


func _connect_signal():
	grid.hex_clicked.connect(_on_hex_clicked)
	print("_connect_signal: connected to - grid.hex_clicked")


func _on_hex_clicked():
	print("_on_hex_clicked: Works!")
