extends Area

func _on_MagicOrb_body_entered(body):
	if body == GameManager.player:
		GameManager.player.inventory.add_item("Magic Orb", 1)
		queue_free()
