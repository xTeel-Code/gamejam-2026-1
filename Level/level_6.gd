extends Node2D


@onready var death: AudioStreamPlayer = $death
@onready var wines: AudioStreamPlayer = $wines
func _ready() -> void:
	death.play()
	wines.play()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
