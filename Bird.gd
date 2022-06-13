extends KinematicBody2D

func _process(delta):
    var state = "fall";
    if Input.is_action_just_pressed("ui_jump"):
        state = "jump";

    print(state)
