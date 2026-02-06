extends Node2D
@onready var death: AudioStreamPlayer = $death
@onready var fullscreen: CheckButton = $"PanelContainer/Options/Audio Control/Label2/Fullscreen"
@onready var wines: AudioStreamPlayer = $wines
func _ready() -> void:
	death.play()
	wines.play()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
