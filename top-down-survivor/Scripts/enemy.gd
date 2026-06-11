extends CharacterBody2D
class_name Enemy

const SPEED = 30.0
var player : Node2D
var reward_prefab = preload("res://Scenes/reward.tscn")

func _physics_process(delta: float) -> void:
# Find the player
	var direction = (player.global_position - global_position).normalized()
	velocity = direction * SPEED
	move_and_slide()


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area is Bullet:
		#Spawn reward
		var reward = reward_prefab.instantiate()
		reward.position = global_position
		#get_tree().root.add_child(reward)
		get_tree().root.call_deferred("add_child", reward)
		print("Hit by bullet")
		queue_free()
		area.queue_free()
