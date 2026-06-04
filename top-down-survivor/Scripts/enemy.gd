extends CharacterBody2D


const SPEED = 100.0
var player : Node2D

func _physics_process(delta: float) -> void:
# Find the player
	var direction = (player.global_position - global_position).normalized()
	velocity = direction * SPEED
	move_and_slide()
