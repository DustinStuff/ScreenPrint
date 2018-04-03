# TODO: Add ability to make print string transparent
extends Control

var string = "" setget set_string
var color = Color(1, 1, 1) setget set_color
var time = 2.0 setget set_time
var spacing = 10 setget set_spacing


func set_string(s):
	string = s
	add_text()


func set_color(c):
	color = c
	add_text()


func set_time(t):
	time = t
	$Timer.wait_time = t


func set_spacing(s):
	spacing = s
	rect_min_size = Vector2(0, s)


func add_text():
	var tag1 = "[color=#%s]" % color.to_html(false)
	var tag2 = "[/color]"
	$String.set_bbcode("%s%s%s" % [tag1, string, tag2])


func start():
	$Timer.start()


func _timer_ended():
	queue_free()