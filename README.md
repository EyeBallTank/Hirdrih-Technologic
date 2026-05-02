# Hirdrih-Technologic
 A game about the world of Hirdrih

I wrote most of the game's plans here:
https://docs.google.com/document/d/1MhkxslTsY92BH1echrjFv-l5uSzD3a8X_YbwzBAt_5Y/edit?usp=sharing


# CURRENT ISSUES

* I can't use resources on the AnimatedSprite2D node of the magic arrow, so the sprites don't change when changing the name on the resource in the editor https://forum.godotengine.org/t/having-an-issue-with-using-sprite-resources-on-animatedsprite2d-godot-4-3-stable/130693/5
* I want to have the Magic Arrow become disabled when the player dies
* The "end level door" scene has this error:

E 0:00:18:0702   step: Infinite loop detected. Check set_loops() description for more info.

  <C++ Error>    Method/function failed. Returning: false

  <C++ Source>   scene/animation/tween.cpp:366 @ step()

* The game over implementation also has a similar error as the one mentioned above.
* Turns out the red text also shows up when quitting to the main menu, from the pause menu.
* The "retry level" button also shows some similar errors, so I need help on how to implement it better.
* Can't find a way to have the yellow tutorial text boxes actually show localized text, so they're in English now.
* And apparently, the text in an instanced scene like that is limited, even compared to the scene itself in the editor?
* I want to add tiles that block the Pushable but for some reason, rotating them doesn't rotate their collisions.
* And when I tried making specific passable tiles for each direction, the one way collision is still the same direction.

# FIXED (Maybe)

* "Sometimes, enemies resist the player's projectile attack so it seems their "hurtbox" collisions don't always work."

Right now, I made it so enemy hurtboxes finally react to the projectile. 

* "Both the player projectile and enemy projectile so far are tied to the sources, so they don't move freely when the source entities move (Meaning the projectiles are still "dragged")"

Thanks to dragonforge-dev, I added "get_parent" to where it said "add_child(projectile)" in some code.

* Hirdrio can finally move around and bounce of walls, thanks to a tutorial by NADLABS


# CREDITS

* luke_rs (Used a Godot 4 platformer tutorial as reference for some code and other stuff)
* PaperMouseGames (Used another Godot 4 platformer tutorial as reference for stuff like the new player code, moving platforms and tiles)
* RookDev (Used tutorial video for the arrow's "top down" movement)
* theyellowdude69 (Used tutorial video for scene transition)
* actuallyKron (Used tutorial for the fullscreen check button)
* DevDrache (Used tutorial video for climb controls)
* Chequered Ink (Fontspace) (The font I'm using for now)
* KinematicBody2D demo (Used some of its sprites as placeholder/test stuff).
* Kenney (Also used sprites for testing stuff)
* Webs206 on Freesound (Sound effect for clicking arrow)
* dragonforge-dev (Helped me fix the issue with projectiles not moving independently from source entities)
* NADLABS (Used a tutorial to make working code for the Hirdrio enemy)
* JuicyChickenDev (For feedback, such as indication for something clickable by the arrow)