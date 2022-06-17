extends KinematicBody2D

enum STATE { IDLE, FALL, JUMP }

var vertical_vector = Vector2(0, 0)

var gravity = 98
var jump_speed = gravity * 1.5

func _process(delta):
    var state = STATE.FALL
    if Input.is_action_just_pressed("ui_jump"):
        state = STATE.JUMP

    match state:
        STATE.FALL:
            if vertical_vector.y < gravity * 1.5:
                vertical_vector.y += gravity * 2 * delta
        STATE.JUMP:
            vertical_vector.y = -jump_speed

    move_and_slide(vertical_vector)
