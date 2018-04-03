tool
extends Control
# Honestly I don't even know if you can change exported vars of a singleton...
export var max_lines = 20 setget set_max_lines
export var print_to_output = false setget set_print_to_output
export var top_padding = 5 setget set_top_padding
export var left_padding = 5 setget set_left_padding
export var default_color = Color(1, 0, 1) setget set_default_color
export var default_time = 2.0 setget set_default_time
export var spacing = 10.0 setget set_spacing

var print_string = load("res://addons/screen_print/PrintString.tscn")

var past_first_set = false  # Only exists to squash a nasty bug.


func _ready():
	# Draws the prints (hopefully) on top of everything else
	VisualServer.canvas_item_set_z_index(get_canvas_item(), 1000)


func set_top_padding(p):
	top_padding = p
	if has_node("HBoxContainer/StringList/TopSpacer"):
		$HBoxContainer/StringList/TopSpacer.rect_min_size = Vector2(0, p)


func set_left_padding(p):
	left_padding = p
	if has_node("HBoxContainer/LeftSpacer"):
		$HBoxContainer/LeftSpacer.rect_min_size = Vector2(p, 0)


func set_default_color(c):
	# The first call after loading sets it to white for some reason.
	# So it skips the first call.
	if past_first_set:
		default_color = c
	else:
		past_first_set = true


func set_default_time(t):
	default_time = t


func set_spacing(s):
	spacing = s


func set_max_lines(m):
	max_lines = m


func set_print_to_output(p):
	print_to_output = p


func print(string, color=default_color, time=default_time):
	if print_to_output:
		print(string)  # I'm glad this calls the built-in and isn't recursive
	# Removes oldest print if line too long
	if $HBoxContainer/StringList.get_child_count() - 1 >= max_lines:  # - 1 because TopSpacer
		$HBoxContainer/StringList.get_child(1).queue_free()

	var p = print_string.instance()
	p.string = string
	p.color = color
	p.time = time
	# I figure that `spacing` should be set globally instead of per-print
	# Which is why it's not a parameter
	p.spacing = spacing
	
	$HBoxContainer/StringList.add_child(p)
	p.start()  # timer to delete it
