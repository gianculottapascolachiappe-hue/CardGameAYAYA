extends Control

@onready var card_frame = $CardFrame

var card_instance: CardInstance

func setup(instance: CardInstance):

	card_instance = instance

	card_frame.texture = instance.data.card_texture

	print("------------------------------------")
	print("CARD VISUAL SETUP")
	print("Visual for: ", instance.data.card_name)
	print("Current Zone: ", instance.current_zone)
	print("------------------------------------")
