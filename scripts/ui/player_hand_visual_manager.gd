extends Node2D
class_name PlayerHandVisualManager

const CARD_SCENE = preload("res://scenes/cards/card.tscn")

var hand_visuals := []

var DEBUG_HAND = false

func _ready():

	if DEBUG_HAND:
		print("PLAYER HAND VISUAL MANAGER READY")

	EventBus.card_drawn.connect(_on_card_drawn)

func _on_card_drawn(card_instance):

	# Ignore enemy hand for now
	if card_instance.current_zone != "player_hand":
		return

	if DEBUG_HAND:
		print("")
		print("VISUALIZING PLAYER HAND CARD")
		print(card_instance.data.card_name)

	var card_visual = CARD_SCENE.instantiate()

	add_child(card_visual)

	card_visual.setup(card_instance)

	hand_visuals.append(card_visual)

	update_hand_layout()

func update_hand_layout():

	if DEBUG_HAND:
		print("")
		print("UPDATING HAND LAYOUT")

	var card_count = hand_visuals.size()

	if card_count == 0:
		return

	var screen_size = get_viewport().get_visible_rect().size
	var center_x = screen_size.x / 2.0
	var y_position = screen_size.y - 200

	var card_width = 150

	var base_spacing = 160
	var spacing = base_spacing

	if card_count > 5:
		spacing = 120
	if card_count > 7:
		spacing = 90
	if card_count > 9:
		spacing = 70

	var total_width = (card_count - 1) * spacing + card_width
	var start_x = center_x - total_width / 2.0

	for i in card_count:

		var card = hand_visuals[i]

		var target_position = Vector2(
			start_x + (i * spacing),
			y_position
		)

		card.position = target_position
