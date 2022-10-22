extends KinematicBody2D

signal pass_pipe

export(int) var MAX_FALL_SPEED = 200
export(int) var FLAP := 200
export(int) var GRAVITY := 10

const UP := Vector2(0,-1)

var motion := Vector2()

func _physics_process(delta: float) -> void:
	motion.y += GRAVITY
	if motion.y > MAX_FALL_SPEED:
		motion.y = MAX_FALL_SPEED

	if Input.is_action_just_pressed("ui_jump"):
		motion.y = -FLAP

	motion = move_and_slide(motion, UP)
	motion.x = 0

func _on_Detect_area_entered(area: Area2D) -> void:
	if area.name == "Score":
		emit_signal("pass_pipe")
	elif area.name == "Pipes" || area.name == "Ground":
		get_tree().reload_current_scene()
