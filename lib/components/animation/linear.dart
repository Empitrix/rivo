import 'package:flutter/material.dart';

class LinearAnim{
	late Animation<double> animation;
	late AnimationController controller;
	late int idx;

	LinearAnim({
		required this.animation,
		required this.controller,
		this.idx = 0
	});
}


LinearAnim genLinAnim(TickerProvider ticker, {Duration duration = const Duration(milliseconds: 200), double begin = 0, double end = 1}){

	late AnimationController controller;
	late Animation<double> animation;

	controller = AnimationController(
		duration: duration,
		vsync: ticker
	);

	animation = Tween<double>(begin: begin, end: end).animate(controller);

	return LinearAnim(animation: animation, controller: controller);
}

