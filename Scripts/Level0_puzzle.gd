extends Node2D

var DEBUG = false
var LOGIC_REFRESH_RATE = 3 #Check only every x frames.
var frame_counter = 0

var acceptance_threshold = 15

var piece_1_in_place = false
var piece_2_in_place = false
var piece_3_in_place = false
var piece_4_in_place = false
var piece_5_in_place = false
var piece_6_in_place = false


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var piece_1_correct = $CorrectPlaces/P1C/Piece1.get_global_position()
	var piece_2_correct = $CorrectPlaces/P2C/Piece2.get_global_position()
	var piece_3_correct = $CorrectPlaces/P3C/Piece3.get_global_position()	
	var piece_4_correct = $CorrectPlaces/P4C/Piece4.get_global_position()
	var piece_5_correct = $CorrectPlaces/P5C/Piece5.get_global_position()
	var piece_6_correct = $CorrectPlaces/P6C/Piece6.get_global_position()
	
	var piece_1 = $Kine1/Piece1.get_global_position()
	var piece_2 = $Kine2/Piece2.get_global_position()
	var piece_3 = $Kine3/Piece3.get_global_position()
	var piece_4 = $Kine4/Piece4.get_global_position()
	var piece_5 = $Kine5/Piece5.get_global_position()
	var piece_6 = $Kine6/Piece6.get_global_position()
	
	frame_counter += 1
	
	if frame_counter >= LOGIC_REFRESH_RATE:
		#PIECE 1
		#print(piece_1_correct.distance_to(piece_1))		
		if (piece_1_correct.distance_to(piece_1) < acceptance_threshold):
			piece_1_in_place = true
			if DEBUG:
				print("Piece 1 in place!")
		else:
			piece_1_in_place = false
			
		#PIECE 2
		#print(piece_2_correct.distance_to(piece_2))		
		if (piece_2_correct.distance_to(piece_2) < acceptance_threshold):
			piece_2_in_place = true
			if DEBUG:
				print("Piece 2 in place!")
		else:
			piece_2_in_place = false
#		
		#PIECE 3
		#print(piece_3_correct.distance_to(piece_3))		
		if (piece_3_correct.distance_to(piece_3) < acceptance_threshold):
			piece_3_in_place = true
			if DEBUG:
				print("Piece 3 in place!")
		else:
			piece_3_in_place = false

		#PIECE 4
		#print(piece_4_correct.distance_to(piece_4))		
		if (piece_4_correct.distance_to(piece_4) < acceptance_threshold):
			piece_4_in_place = true
			if DEBUG:
				print("Piece 4 in place!")
		else:
			piece_4_in_place = false
			
		#PIECE 5
		#print(piece_5_correct.distance_to(piece_5))		
		if (piece_5_correct.distance_to(piece_5) < acceptance_threshold):
			piece_5_in_place = true
			if DEBUG:
				print("Piece 5 in place!")
		else:
			piece_5_in_place = false
			
		#PIECE 6
		#print(piece_6_correct.distance_to(piece_6))		
		if (piece_6_correct.distance_to(piece_6) < acceptance_threshold):
			piece_6_in_place = true
			if DEBUG:
				print("Piece 6 in place!")
		else:
			piece_6_in_place = false
			
		frame_counter = 0
		
		if (all_pieces_in_place()):
			if DEBUG:
				print("!!!!!!!!!!!!!!!!!YOU HAVE WON!!!!!!!!!!!!!!")
		
func all_pieces_in_place():
	return (piece_1_in_place && piece_2_in_place && piece_3_in_place && piece_4_in_place && piece_5_in_place && piece_6_in_place)
