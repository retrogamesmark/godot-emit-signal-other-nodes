# res://scripts/hex_grid.gd
class_name HexGrid
extends Node3D

signal hex_clicked

@export var hex_scene: PackedScene


func _ready() -> void:
	# instantiate a test scene
	var h := hex_scene.instantiate()
	h._instantiate(self) # method in hex.gd
	add_child(h)

	# The signal "hex_clicked" is declared but never explicitly used in the class.
	# due to the way this is setup, but is valid.
	# use the signal so Godot stops moaning!
	hex_clicked.connect(func(): pass)
