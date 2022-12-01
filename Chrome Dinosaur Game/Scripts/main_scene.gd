extends Node2D

# How fast the animation moves
@export var BaseAnimationSpeed = 0.23
# How fast the objects move
@export var BaseObjectSpeedSpeed = 200

var ShitCode = false

func _process(_delta):
	# Play a animation that looks like the ground is moving.
	var AnimationThing = get_node("Platform/AnimationPlayer")
	if !AnimationThing.is_playing():
		AnimationThing.play("Move")
	
	# Set the point value
	var Spawner = get_node("Spawner")
	
	# Easy variable to get points
	var GottenPoints = str(int(Spawner.get("Points")))
	
	get_node("Points").set("text", "Score: " + GottenPoints)
	# Inefficiant way of speeding up the game. I don't care it is only a prototype.
	if Spawner.get("Points") >= 500:
		BaseObjectSpeedSpeed = 1200
		AnimationThing.set("playback_speed", BaseAnimationSpeed * 6)
	elif Spawner.get("Points") >= 400:
		BaseObjectSpeedSpeed = 1000
		AnimationThing.set("playback_speed", BaseAnimationSpeed * 5)
	elif Spawner.get("Points") >= 300:
		BaseObjectSpeedSpeed = 800
		AnimationThing.set("playback_speed", BaseAnimationSpeed * 4)
	elif Spawner.get("Points") >= 200:
		BaseObjectSpeedSpeed = 600
		AnimationThing.set("playback_speed", BaseAnimationSpeed * 3)
	elif Spawner.get("Points") >= 100:
		BaseObjectSpeedSpeed = 400
		AnimationThing.set("playback_speed", BaseAnimationSpeed * 2)
	
	if get_node_or_null("Dinosaur") == null && ShitCode == false:
		get_node("Game Over!").set("visible", true)
		get_node("Game Over!/Label").set("text", "GAME OVER!\nScore: " + GottenPoints)
		ShitCode = true

func _on_button_pressed():
	get_tree().change_scene_to_file("res://Scenes/main_scene.tscn")
