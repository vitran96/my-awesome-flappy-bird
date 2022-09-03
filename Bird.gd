extends KinematicBody2D

#export(int) var FLYING_SPEED := 100
#export(int) var JUMP_HEIGHT := -150

#enum STATE { IDLE, FALL, JUMP }

#var vertical_vector := Vector2(FLYING_SPEED, 0)

signal pass_pipe

const UP := Vector2(0,-1)
const FLAP := 200
const MAX_FALL_SPEED = 200
const GRAVITY := 10

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
    elif area.name == "Pipes":
        get_tree().reload_current_scene()
