# Generate CollisionPolygon2D Nodes from Sprite2D

A simple tool script for Godot 3 and 4 that generates a collision polygon from a sprite shape.

Compatibile with Godot 3 and 4:

- [Godot 4 Version](https://github.com/kevinthompson/godot-generate-polygon-from-sprite-tool/blob/main/godot4/sprite_to_collision_polygon.gd)
- [Godot 3.5 Version](https://github.com/kevinthompson/godot-generate-polygon-from-sprite-tool/blob/main/godot3/sprite_to_collision_polygon.gd)

## About

These scripts are provided as an example. Your actual implementation will likely require subtle changes to work within your project.

These versions are also optimistic and will likely fail if the referenced nodes or textures do not yet exist. Add the script after setting up your scene, or get your hands dirty and add conditional checks for the relevant data.

## Examples

![Aseprite Texture Import GIF](https://github.com/kevinthompson/godot-generate-polygon-from-sprite-tool/blob/main/assets/aseprite_example.gif?raw=true)
<br />
<br />
![Godot Texture Change GIF](https://github.com/kevinthompson/godot-generate-polygon-from-sprite-tool/blob/main/assets/texture_example.gif?raw=true)

## Credits

A good chunk of the logic in these scripts was adapted from the code by The Shaggy Dev at https://shaggydev.com/2022/04/13/sprite-collision-polygons/.
