extends RefCounted
class_name CardInstance

var data: CardData

var owner = null
var controller = null

var current_zone := ""

var tapped := false

var summoning_sick := false

var damage_taken := 0

var runtime_modifiers := []

func setup(card_data: CardData, card_owner):

	data = card_data

	owner = card_owner
	controller = card_owner

	current_zone = "unassigned"

	print("====================================")
	print("CARD INSTANCE CREATED")
	print("Name: ", data.card_name)
	print("Owner: ", owner)
	print("Types: ", data.types)
	print("Subtypes: ", data.subtypes)
	print("====================================")
