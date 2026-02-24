extends Node

signal scene_has_changed

#signal playerpickeduparrow

signal coin_was_captured
signal score_was_updated

signal new_life
signal life_lost
var score = 0
var lives = 2
var max_lives = 10

signal you_are_invincible

signal player_died

signal pushable_button_pressed

signal blue_button_was_pressed
signal yellow_button_was_pressed
signal green_one_button_was_pressed
signal green_two_button_was_pressed

signal the_player_won_the_level
signal the_player_lost_the_level

#signal can_the_arrow_disappear_when_climb
#signal can_the_arrow_appear_when_mainstate

var can_i_turn_off_the_arrow = false
