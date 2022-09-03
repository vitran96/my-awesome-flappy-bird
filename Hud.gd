extends CanvasLayer

var score := 0

func _ready() -> void:
    $ScoreBox/HBoxContainer/Score.text = str(score)

func update_score():
    score = score + 1
    $ScoreBox/HBoxContainer/Score.text = str(score)

func _on_Bird_pass_pipe() -> void:
    update_score()
