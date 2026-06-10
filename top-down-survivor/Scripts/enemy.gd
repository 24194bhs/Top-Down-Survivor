extends CharacterBody2D


const SPEED = 100.0
var player : Node2D

func _physics_process(delta: float) -> void:
# Find the player
	var direction = (player.global_position - global_position).normalized()
	velocity = direction * SPEED
	move_and_slide()


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area is Bullet:
		print("Hit by bullet")
		queue_free()
		area.queue_free()
