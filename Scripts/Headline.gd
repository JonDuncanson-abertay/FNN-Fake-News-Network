extends Label

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

var m_text = ""
var m_score = 0
var m_selected = false

func _ready():
	self.add_font_override("font", load("res://Fonts/runescape_uf/runescape_uf.tres"))
	self.set_size(Vector2(300, 300))
	self.autowrap = true
	self.add_color_override("font_color", Color(0, 0, 0))
	# Called every time the node is added to the scene.
	# Initialization here
	m_text = ""
	m_score = 0
	m_selected = false
	pass
	
func get_selected():
	return m_selected

func get_score():
	return m_score
	
func get_text():
	return m_text
	
func set_score(score):
	m_score = score

func set_text(text):
	m_text = text
	self.text = str(m_text)
	
func set_selected(selected):
	m_selected = selected
	if m_selected:
		self.add_color_override("font_color", Color(1, 1, 0))
	else:
		self.add_color_override("font_color", Color(0, 0, 0))
	
func _process(delta):
#	# Called every frame. Delta is time since last frame.
#	# Update game logic here.
	pass
