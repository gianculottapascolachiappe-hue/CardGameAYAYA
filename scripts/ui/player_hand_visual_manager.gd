extends Node2D
class_name PlayerHandVisualManager

const CARD_SCENE = preload(
    "res://scenes/cards/card.tscn"
)

var hand_visuals := []

func _ready():

	print("PLAYER HAND VISUAL MANAGER READY")

	EventBus.card_drawn.connect(
		_on_card_drawn
	)

func _on_card_drawn(card_instance):

	# Ignore enemy hand for now

	if card_instance.current_zone != "player_hand":
		return

	print("")
	print("VISUALIZING PLAYER HAND CARD")
	print(card_instance.data.card_name)

	var card_visual = CARD_SCENE.instantiate()

	add_child(card_visual)

	card_visual.setup(card_instance)

	hand_visuals.append(card_visual)

	update_hand_layout()

func update_hand_layout():

	print("")
	print("UPDATING HAND LAYOUT")

	var start_x = 400
	var spacing = 160
	var y_position = 800

	for i in hand_visuals.size():

		var card = hand_visuals[i]

		var target_position = Vector2(
			start_x + (i * spacing),
			y_position
		)

		card.position = target_position

		print(
			"POSITIONED: ",
			card.card_instance.data.card_name,
			" AT: ",
			target_position
		)
