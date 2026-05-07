extends Node2D

func _ready():

	print("")
	print("===== TEST SCENE STARTED =====")

	var game_manager = GameManager.new()

	game_manager.setup_game()

	print("")
	print("===== TEST FINISHED =====")
