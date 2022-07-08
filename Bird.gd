# tool
# extends RigidBody2D

# export var JUMP_HEIGHT = -150
# export var FLYING_SPEED = 100

# func _ready():
#     set_linear_velocity(Vector2(FLYING_SPEED, 0))
# #    if not Engine.editor_hint:
#     # TODO: remove this part. Maybe should be removed
#     # self.position.x = get_viewport().get_visible_rect().size.x * 2 / 5
#     # self.position.y = get_viewport().get_visible_rect().size.y / 2

# func _process(delta):
#     if Input.is_action_just_pressed("ui_jump"):
#         set_linear_velocity(Vector2(FLYING_SPEED, JUMP_HEIGHT))
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

    move_and_slide(vertical_vector)
