@tool
extends HBoxContainer

signal toggled_on(position)

@onready var texture_button: TextureButton = $MarginContainer/TextureButton
@onready var check_box: CheckBox = $CheckBox


func _ready() -> void:
	texture_button.connect("pressed", texture_button_on_pressed)
	check_box.connect("toggled", check_box_on_ticked)


# Handle the delete button on the checklist item
func texture_button_on_pressed() -> void:
	# Remove the checklist item
	self.get_parent().remove_child(self)
	self.queue_free()


func check_box_on_ticked(toggled_status) -> void:
	# Celebrate the Ticking
	if toggled_status:
		var target: Vector2 = check_box.global_position
		target.x += check_box.size.x / 2
		target.y += check_box.size.y / 2
		toggled_on.emit(target)
