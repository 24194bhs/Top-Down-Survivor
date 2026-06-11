extends Node2D

var bullet_prefab = preload("res://Scenes/bullet.tscn")

var num_bullets = 1

func _on_timer_timeout() -> void:
	#Shoot a bullet
	shoot()

func spawn_bullet(direction : Vector2):
	#Spawn bullets
	var bullet = bullet_prefab.instantiate()
	bullet.position = global_position
	bullet.direction = direction
	get_tree().root.add_child(bullet)

func shoot():
	var direction = Vector2.RIGHT
	var step = 2*PI / num_bullets
	for i in range(num_bullets):
		#Spawn a bullet
		spawn_bullet(direction)
		#Rotate the direction
		direction = direction.rotated(step)
