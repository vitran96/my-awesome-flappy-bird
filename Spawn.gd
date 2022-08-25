extends Area2D

const Pipe := preload("res://Pipe.tscn")

const NEW_PIPE_POSITION_X := 450
const NEW_PIPE_POSITION_Y_RANGE_TOP := -60
const NEW_PIPE_POSITION_Y_RANGE_BOTTOM := 60


func pipe_reset() -> void:
    var pipe_instance := Pipe.instance()
    pipe_instance.position = Vector2(NEW_PIPE_POSITION_X, rand_range(NEW_PIPE_POSITION_Y_RANGE_TOP, NEW_PIPE_POSITION_Y_RANGE_BOTTOM))
    get_tree().get_root().call_deferred("add_child", pipe_instance)

func _on_Spawn_area_entered(area: Area2D) -> void:
    if area.name == "Pipes":
        area.queue_free()
        pipe_reset()
