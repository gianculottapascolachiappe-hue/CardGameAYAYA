extends Resource
class_name CardData

@export var card_name: String
@export var mana_cost := {
	"generic": 2,
	"W": 2,
	"U": 0,
	"B": 0,
	"R": 0,
	"G": 0
}
@export var supertypes: Array[String]
@export var types: Array[String]
@export var subtypes: Array[String]

@export var power: int
@export var toughness: int

@export var card_texture: Texture2D

@export var keywords: Array[String]
@export var effects: Array[Dictionary]
@export_multiline var rules_text: String

@export var rarity: String
@export var set_code: String
@export var collector_number: int
