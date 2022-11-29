extends Node2D

@export_node_path(RigidBody2D) var Bird
@export var ResetedScene: PackedScene

func _process(_delta):
	# get the value and make it available
	# NOTE! MAKE SURE "SPAWNER" IS CHILD OF THE MAIN SCENE FOR THIS TO WORK!
	get_node("Label").set("text", "Score: " + str(get_node("Spawner").get("Value")))
	if get_node_or_null(Bird) == null:
		get_node("Game Over").set("visible", true)
		get_node("Game Over/Label").set("text", "GAME OVER!\nScore: " + str(get_node("Spawner").get("Value")))

func _on_retry_pressed():
	get_tree().change_scene_to_file("res://Scenes/flappy_bird_main.tscn")
