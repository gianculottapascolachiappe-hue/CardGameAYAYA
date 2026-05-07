extends Node
class_name ZoneManager

var DEBUG_ZONE = false

# =========================
# PLAYER ZONES
# =========================

var player_deck: Array[CardInstance] = []
var player_hand: Array[CardInstance] = []
var player_graveyard: Array[CardInstance] = []

# =========================
# ENEMY ZONES
# =========================

var enemy_deck: Array[CardInstance] = []
var enemy_hand: Array[CardInstance] = []
var enemy_graveyard: Array[CardInstance] = []

# =========================
# MOVE CARD TO ZONE
# =========================

func add_card_to_zone(card: CardInstance, zone_name: String):

	if DEBUG_ZONE:
		print("")
		print("MOVING CARD:", card.data.card_name)
		print("FROM:", card.current_zone, " TO:", zone_name)

	remove_card_from_current_zone(card)

	card.current_zone = zone_name

	match zone_name:

		"player_deck":
			player_deck.append(card)
		"player_hand":
			player_hand.append(card)
		"player_graveyard":
			player_graveyard.append(card)
		"enemy_deck":
			enemy_deck.append(card)
		"enemy_hand":
			enemy_hand.append(card)
		"enemy_graveyard":
			enemy_graveyard.append(card)
		_:
			push_error("UNKNOWN ZONE: " + zone_name)

# =========================
# REMOVE CARD FROM OLD ZONE
# =========================

func remove_card_from_current_zone(card: CardInstance):

	match card.current_zone:

		"player_deck":
			player_deck.erase(card)
		"player_hand":
			player_hand.erase(card)
		"player_graveyard":
			player_graveyard.erase(card)
		"enemy_deck":
			enemy_deck.erase(card)
		"enemy_hand":
			enemy_hand.erase(card)
		"enemy_graveyard":
			enemy_graveyard.erase(card)

# =========================
# DRAW CARD
# =========================

func draw_card(player_id: String):

	var deck
	var hand

	if player_id == "PLAYER":
		deck = player_deck
		hand = player_hand
	else:
		deck = enemy_deck
		hand = enemy_hand

	if deck.is_empty():

		if DEBUG_ZONE:
			print(player_id, " tried to draw from empty deck")

		return null

	var drawn_card = deck.pop_front()

	if DEBUG_ZONE:
		print(player_id, " DREW:", drawn_card.data.card_name)

	add_card_to_zone(drawn_card, player_id.to_lower() + "_hand")

	EventBus.card_drawn.emit(drawn_card)

	return drawn_card
