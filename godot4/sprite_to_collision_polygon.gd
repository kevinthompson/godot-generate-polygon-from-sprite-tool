# Tool to regenerate CollisionPolygon2D nodes from a sprite node
# when the scenes is loaded or when the "Recalculate Geometry" checkbox
# is clicked in the inspector.

@tool
extends Node2D

# Regenerate Collision Nodes On Click in Inspector
@export var recalculate_geometry : bool :
	set(_value):
		_create_polygon2d_nodes_from_sprite2d()

# Regenerate Collision Nodes When Texture Changes
func _ready():
	if Engine.is_editor_hint():
		$Sprite2D.connect("texture_changed", _create_polygon2d_nodes_from_sprite2d)

func _create_polygon2d_nodes_from_sprite2d():
	# Assume Sprite2D with texture and StaticBody2D exist
	var sprite = $Sprite2D
	var static_body = $StaticBody2D

	# Destroy Existing Collision Polygons
	for node in static_body.find_children("*", "CollisionPolygon2D"):
		node.queue_free()

	# Generate Bitmap from Sprite2D
	var image = sprite.texture.get_image()
	var bitmap = BitMap.new()
	bitmap.create_from_image_alpha(image)

	# Convert Bitmap to Polygons
	var polys = bitmap.opaque_to_polygons(Rect2(Vector2.ZERO, image.get_size()), 0.0)

	# Create CollisionPolygon2D Nodes from Polygons
	for poly in polys:
		var collision_polygon = CollisionPolygon2D.new()
		collision_polygon.polygon = poly
		static_body.add_child(collision_polygon)
		collision_polygon.set_owner(get_tree().get_edited_scene_root())
		collision_polygon.position -= sprite.texture.get_size() / 2
