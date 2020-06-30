extends Node

signal player_initialised

var player

func _process(delta):
	if not player:
		initialise_player()
		return
		
func initialise_player():
	player = get_tree().get_root().get_node("/root/World/Player")
	if not player:
		return

	emit_signal("player_initialised", player)
	
	player.inventory.connect("inventory_changed", self, "_on_player_inventory_changed")
	
	var existing_inventory = load("user://inventory.tres")
	if existing_inventory:
		player.inventory.set_items(existing_inventory.get_items())
	else:
		# lets give the player 3 pieces of wood
		player.inventory.add_item("Oak Log", 3)
	
func _on_player_inventory_changed(inventory):
	ResourceSaver.save("user://inventory.tres", inventory)
