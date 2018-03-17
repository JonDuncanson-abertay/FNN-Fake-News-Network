extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"
var headline = preload("res://Scripts/Headline.gd")
var headline_left = headline.new()
var headline_right = headline.new()
var string_arr = []
var score_arr = []
var left_child_index = -1
var right_child_index = -1
var headline_count = 5

func load_headlines(path):
	var file = File.new()
	
	if file.file_exists(path):
		file.open(path, file.READ)
		while !file.eof_reached():
			string_arr.push_back(file.get_csv_line(","))
			print(string_arr[string_arr.size() - 1])
			score_arr.push_back(file.get_csv_line(","))
			print(score_arr[score_arr.size() - 1])
		file.close()
		print(string_arr.size())
	pass
	
func generate_headlines():
	var random = randi()%headline_count+1
	get_child(left_child_index).set_text(string_arr[random])
	get_child(left_child_index).set_score(score_arr[random])
	random = randi()%headline_count+1
	get_child(right_child_index).set_text(string_arr[random])
	get_child(right_child_index).set_score(score_arr[random])
	
	while get_child(left_child_index).get_score() == get_child(right_child_index).get_score():
		random = randi()%headline_count+1
		get_child(right_child_index).set_text(string_arr[random])
		get_child(right_child_index).set_score(score_arr[random])
		
	pass

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	add_child(headline_left)
	add_child(headline_right)
	left_child_index = headline_left.get_index()
	right_child_index = headline_right.get_index()
	load_headlines("res://data.csv")
	generate_headlines()
	pass

func _process(delta):
	generate_headlines()
	pass
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
#	pass
