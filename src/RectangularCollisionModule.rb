module RectangularCollision
  def rectangular_collision?(object1, object2)
    object1_half_width = object1.width / 2
    object1_half_height = object1.height / 2
    object1_left = object1.x - object1_half_width
    object1_right = object1.x + object1_half_width
    object1_top = object1.y - object1_half_height
    object1_bottom = object1.y + object1_half_height
 
    object2_half_width = object2.width / 2
    object2_half_height = object2.height / 2
    object2_left = object2.x - object2_half_width
    object2_right = object2.x + object2_half_width
    object2_top = object2.y - object2_half_height
    object2_bottom = object2.y + object2_half_height
 
    ((object1_left >= object2_left && object1_left <= object2_right) || (object2_left >= object1_left && object2_left <= object1_right)) &&
    ((object1_top >= object2_top && object1_top <= object2_bottom) || (object2_top >= object1_top && object2_top <= object1_bottom))
  end
end