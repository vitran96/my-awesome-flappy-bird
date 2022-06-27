tool
extends RigidBody2D

export var JUMP_HEIGHT = -150
export var FLYING_SPEED = 100

func _ready():
    set_linear_velocity(Vector2(FLYING_SPEED, 0))
#    if not Engine.editor_hint:
    self.position.x = get_viewport().get_visible_rect().size.x * 2 / 5
    self.position.y = get_viewport().get_visible_rect().size.y / 2

func _process(delta):
    if Input.is_action_just_pressed("ui_jump"):
        set_linear_velocity(Vector2(FLYING_SPEED, JUMP_HEIGHT))
