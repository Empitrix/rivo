enum Direction {
	up,
	down,
	right,
	left,
	upRight,
	upLeft,
	downRight,
	downLeft,
	solid
}


Direction getDirection(dx, dy){
	if(dx == 0 && dy == 0){ return Direction.solid; }
	if(dx > 0 && dy > 0){ return Direction.downRight; }
	if(dx < 0 && dy < 0){ return Direction.upLeft; }

	if(dx > 0 && dy < 0){ return Direction.upRight; }
	if(dx < 0 && dy > 0){ return Direction.downLeft; }

	if(dx == 0){
		if(dy > 0){
			return Direction.down;
		} else {
			return Direction.up;
		}
	} else if(dy == 0){
		if(dx > 0){
			return Direction.right;
		} else {
			return Direction.left;
		}
	}
	if(dy > 0 && dx > 0){
		return Direction.upRight;
	}
	return Direction.solid;
}

