module RectangularCollision
  def rectangular_collision?(object1, object2)
    object1_left = object1.x
    object1_right = object1.x + object1.width
    object1_top = object1.y
    object1_bottom = object1.y + object1.height
 
    object2_left = object2.x
    object2_right = object2.x + object2.width
    object2_top = object2.y
    object2_bottom = object2.y + object2.height
 
    ((object1_left >= object2_left && object1_left <= object2_right) || (object2_left >= object1_left && object2_left <= object1_right)) &&
    ((object1_top >= object2_top && object1_top <= object2_bottom) || (object2_top >= object1_top && object2_top <= object1_bottom))
  end

  def collision_mouse?(object, x, y)
    object_left = object.x
    object_right = object.x + object.width
    object_top = object.y
    object_bottom = object.y + object.height

    (object_left < x && object_right > x && object_top < y && object_bottom > y)
  end
end