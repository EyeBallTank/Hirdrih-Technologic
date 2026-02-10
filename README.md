# Hirdrih-Technologic
 A game about the world of Hirdrih

I wrote most of the game's plans here:
https://docs.google.com/document/d/1MhkxslTsY92BH1echrjFv-l5uSzD3a8X_YbwzBAt_5Y/edit?usp=sharing


# CURRENT ISSUES

* I can't use resources on the AnimatedSprite2D node of the magic arrow, so the sprites don't change when changing the name on the resource in the editor https://forum.godotengine.org/t/having-an-issue-with-using-sprite-resources-on-animatedsprite2d-godot-4-3-stable/130693/5
* I want to have the Magic Arrow become disabled when the player dies
* Both the player projectile and enemy projectile so far are tied to the sources, so they don't move freely when the source entities move (Meaning the projectiles are still "dragged")
* When the player jumps on top of the PushableCharacter, the Pushable is pushed to the floor, almost noclipping it, when ideally: I want the player to stand on top of the Pushable as if it was a solid object when it's not being pushed.
* (I could say I thought of a solution for the above but it's very weird and not recommended as of now).
* I couldn't find a way to make the enemy Hirdrio actually move and bounce off surfaces as they did in Project Nortubel.
* Sometimes, enemies resist the player's projectile attack so it seems their "hurtbox" collisions don't always work.

# CREDITS

* luke_rs (Used a Godot 4 platformer tutorial as reference for some code and other stuff)
* PaperMouseGames (Used another Godot 4 platformer tutorial as reference for stuff like the new player code, moving platforms and tiles)
* RookDev (Used tutorial video for the arrow's "top down" movement)
* theyellowdude69 (Used tutorial video for scene transition)
* actuallyKron (Used tutorial for the fullscreen check button)
* Chequered Ink (Fontspace) (The font I'm using for now)
* KinematicBody2D demo (Used some of its sprites as placeholder/test stuff).
* Kenney (Also used sprites for testing stuff)