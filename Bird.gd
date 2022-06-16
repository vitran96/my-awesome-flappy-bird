extends KinematicBody2D

enum STATE { IDLE, FALL, JUMP }

var speed = 50
var heavyness = 3.5
var gravity = 98
var jumpHeight = 60

var vertical_vector = Vector2(0, 0)

var vert_speed = 0
var jump_speed = 75


func _process(delta):
    var state = STATE.FALL
    if Input.is_action_just_pressed("ui_jump"):
        state = STATE.JUMP

    match state:
        STATE.FALL:
            vertical_vector.y += gravity * delta
        STATE.JUMP:
            vertical_vector.y = -jump_speed

    move_and_slide(vertical_vector)
