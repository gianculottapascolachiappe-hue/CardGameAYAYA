extends Node2D

const CARD_SCENE = preload("res://scenes/cards/card.tscn")

func _ready():

	print("===== TEST SCENE STARTED =====")

	var soldier_data = load("res://data/cards/Soldier_TEST.tres")

	var soldier_instance = CardInstance.new()

	soldier_instance.setup(
		soldier_data,
        "PLAYER"
	)

	soldier_instance.current_zone = "player_hand"

	print("Card moved to zone: ",
		soldier_instance.current_zone
	)

	var card_visual = CARD_SCENE.instantiate()

	add_child(card_visual)

	card_visual.setup(soldier_instance)

	card_visual.position = Vector2(500, 300)

	print("===== TEST FINISHED =====")
