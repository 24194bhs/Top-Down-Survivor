extends CharacterBody2D

const SPEED = 300.0
var score = 0
@onready var gun = $Gun
signal scored

func _physics_process(delta: float) -> void:
	var direction = Input.get_vector("Left","Right","Up","Down")
	velocity = direction * SPEED
	move_and_slide()


func _on_hitbox_area_entered(area: Area2D) -> void:
	if area is Reward:
		print("Reward collected")
		score += 1
		scored.emit(score)
		gun.num_bullets = int(0.2 * score + 1)
		gun.num_bullets = clamp(gun.num_bullets, 1, 12)
		area.queue_free()


func _on_hitbox_body_entered(body: Node2D) -> void:
	if body is Enemy:
		#Load a new scene
		get_tree().change_scene_to_file("res://Scenes/endgame_scene.tscn")
