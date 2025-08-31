@tool
extends HBoxContainer

@onready var texture_button: TextureButton = $MarginContainer/TextureButton
@onready var check_box: CheckBox = $CheckBox
@onready var fire_1: GPUParticles2D = $CheckBox/fire1/GPUParticles2D
@onready var fire_2: GPUParticles2D = $CheckBox/fire2/GPUParticles2D
@onready var fireworks_timer: Timer = $fireworksTimer
@onready var sfx_fireworks: AudioStreamPlayer = $sfxFireworks


func _ready() -> void:
	texture_button.connect("pressed", texture_button_on_pressed)
	check_box.connect("toggled", check_box_on_ticked)
	fireworks_timer.timeout.connect(stop_fireworks)


func texture_button_on_pressed() -> void:
	# Remove the checklist item
	self.get_parent().remove_child(self)
	self.queue_free()


func check_box_on_ticked(toggled_on) -> void:
	# Celebrate the Ticking
	if toggled_on:
		start_fireworks()

func start_fireworks():
	sfx_fireworks.play()
	fireworks_timer.start()
	
	fire_1.emitting = true
	fire_2.emitting = true


func stop_fireworks():
	fire_1.emitting = false
	fire_2.emitting = false
