extends Control

const FONT_PARAGRAPH = preload("res://fonts/paragraph.tres")
const FONT_PARAGRAPH_BOLD = preload("res://fonts/paragraph_bold.tres")
const FONT_UI = preload("res://fonts/ui.tres")

const COLOR_SHADOW : Color = Color("222034")
const COLOR_SHADE_A : Color = Color("847e87")
const COLOR_SHADE_B : Color = Color("595652")

signal close_credits

func draw_text_with_shadow(font, text : String, position : Vector2, color : Color) -> void:
	draw_string(font, position + Vector2(1, 1), text, COLOR_SHADOW)
	draw_string(font, position, text, color)

func draw_role(position : Vector2, role : String) -> void:
	var role_width : float = FONT_PARAGRAPH.get_string_size(role).x
	draw_text_with_shadow(FONT_PARAGRAPH, role, position + Vector2(- role_width - 8, 0), COLOR_SHADE_A)

func draw_name(position : Vector2, name : String, other : String = "") -> void:
	var name_width : float = FONT_PARAGRAPH_BOLD.get_string_size(name).x
	var other_width : float = FONT_PARAGRAPH.get_string_size(other).x
	draw_text_with_shadow(FONT_PARAGRAPH_BOLD, name, position + Vector2(0, 0), Color.white)
	draw_text_with_shadow(FONT_UI, other, position + Vector2(0, 9), COLOR_SHADE_A)

func draw_credit(position : Vector2, role : String, name : String, other : String = "") -> void:
	draw_role(position, role)
	draw_name(position, name, other)

func _draw() -> void:
	draw_credit(Vector2(240, 105), "Developers", "Christopher", "22100306")
	draw_name(Vector2(240, 125), "Po", "22117490")
	draw_name(Vector2(240, 145), "Cass", "22207925")
	draw_name(Vector2(240, 165), "Sine", "22102010")
	draw_name(Vector2(240, 185), "Jerusha","22147374")
	draw_name(Vector2(240, 205), "Gee You", "22104109")
	draw_name(Vector2(240, 225), "Teddy", "22100349")
	draw_name(Vector2(240, 245), "Mvelow", "21912716")
	draw_name(Vector2(240, 265), "Sachin", "22116621")
	draw_credit(Vector2(240, 285), "Music", "Epidemic Sounds", "Subcription: R78RoT-b2qTH-yVML0k")
	draw_text_with_shadow(FONT_UI, "(ESC) Go back", Vector2(280, 350), COLOR_SHADE_A)

func _input(event : InputEvent) -> void:
	if event.is_action_pressed("ui_cancel"):
		SoundMaster.play_sound("ui_back")
		emit_signal("close_credits")
