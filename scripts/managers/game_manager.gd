extends Node
class_name GameManager

var zone_manager: ZoneManager

# =========================
# GAME SETUP
# =========================

func setup_game():
	print("")
	print("===== GAME SETUP STARTED =====")

	zone_manager = ZoneManager.new()

	create_test_decks()

	draw_opening_hands()

	print("===== GAME SETUP COMPLETE =====")
	print("")

# =========================
# TEST DECK CREATION
# =========================

func create_test_decks():
	print("")
	print("CREATING TEST DECKS")

	var soldier_data = load(
        "res://data/cards/Soldier_TEST.tres"
	)

	# PLAYER DECK
	for i in 5:
		var card = CardInstance.new()

		card.setup(
			soldier_data,
            "PLAYER"
		)

		zone_manager.add_card_to_zone(
			card,
            "player_deck"
		)

	# ENEMY DECK
	for i in 5:
		var card = CardInstance.new()

		card.setup(
			soldier_data,
            "ENEMY"
		)

		zone_manager.add_card_to_zone(
			card,
            "enemy_deck"
		)

	print("")
	print("PLAYER DECK SIZE: ",
		zone_manager.player_deck.size()
	)

	print("ENEMY DECK SIZE: ",
		zone_manager.enemy_deck.size()
	)

# =========================
# OPENING HANDS
# =========================

func draw_opening_hands():
	print("")
	print("DRAWING OPENING HANDS")

	for i in 3:
		zone_manager.draw_card(
            "PLAYER"
		)

	for i in 3:
		zone_manager.draw_card(
            "ENEMY"
		)

	print("")
	print("PLAYER HAND SIZE: ",
		zone_manager.player_hand.size()
	)

	print("ENEMY HAND SIZE: ",
		zone_manager.enemy_hand.size()
	)
