extends Control

@onready var buttons: VBoxContainer = $PanelContainer/Pauza
@onready var options: Panel = $PanelContainer/Options

func _ready():
	hide()
	buttons.visible = true
	options.visible = false
	buttons.get_child(0).grab_focus()

func pause():
	get_tree().paused = true
	show()
	buttons.visible = true
	options.visible = false
	buttons.get_child(0).grab_focus()

func resume():
	get_tree().paused = false
	hide()

func _process(delta):
	if Input.is_action_just_pressed("escape"):
		if options.visible:
			_on_back_pressed()
		elif get_tree().paused:
			resume()
		else:
			pause()

func _on_resume_pressed() -> void:
	resume()

func _on_options_pressed() -> void:
	buttons.visible = false
	options.visible = true
	options.get_child(0).grab_focus()

func _on_back_pressed() -> void:
	options.visible = false
	buttons.visible = true
	buttons.get_child(0).grab_focus()

func _on_quit_pressed() -> void:
	get_tree().quit()

func _on_restart_pressed() -> void:
	resume()
	get_tree().reload_current_scene()
