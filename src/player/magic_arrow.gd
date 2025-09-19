extends CharacterBody2D

#PLANS:
#The magic mouse is a scene under the Player, meaning its future script
#will have to refer to its parent scene at some point.
#It starts off as invisible and with no collision or anything at all, 
#mainly when the Player is not in their "MOUSEACTIVE" state.
#When Leon/Otto are in their "MOUSEACTIVE" state: The magic mouse suddenly appears in the 
#same position as the Player's center point, who is also standing still because the magic mouse is 
#the entity under control.
#With "MOUSEACTIVE", you get to move the arrow up/down/left/eight and click on things to 
#interact with them.
#And even grab pushable objects and drop them.
#But if Leon/Otto quit the "MOUSEACTIVE" state, the magic mouse simply returns to its invisible state.
#The system needs to be worked on.
