tool
extends KinematicBody2D

export var FLYING_SPEED = 100
export var JUMP_HEIGHT = -150

enum STATE { IDLE, FALL, JUMP }

var vertical_vector = Vector2(FLYING_SPEED, 0)

var gravity = 98

func _process(delta):
    var state = STATE.FALL
    if Input.is_action_just_pressed("ui_jump"):
        state = STATE.JUMP

    match state:
        STATE.FALL:
            vertical_vector.y += gravity * delta
        STATE.JUMP:
            vertical_vector.y = JUMP_HEIGHT

    var collision = move_and_collide(vertical_vector * delta)

    if collision:
        print("I collided with ", collision.collider.name)
