extends RigidBody2D

enum STATE { IDLE, FALL, JUMP }

func _process(delta):
    var state = STATE.FALL
    if Input.is_action_just_pressed("ui_jump"):
        state = STATE.JUMP
    print(state)
    match state:
        STATE.JUMP:
            apply_central_impulse(Vector2(0, -200))
