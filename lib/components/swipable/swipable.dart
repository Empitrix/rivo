import 'package:rivo/components/swipable/get_direction.dart';
import 'package:flutter/material.dart';


class SwiperDetails{
	final Offset offset;
	final int duration;
	final String msg;
	final Direction? direction;

	SwiperDetails({
		required this.offset,
		required this.duration,
		this.msg = "",
		this.direction
	});
}



Size getChildSize(Widget child) {
	return const Size(350, 450);
	/*
	for(DiagnosticsNode node in child.toDiagnosticsNode().getProperties()){
		if(node is DiagnosticsProperty<BoxConstraints>){
			if(node.value == null){
				return const Size(10, 10);
			}
			return Size(node.value!.minWidth, node.value!.minHeight);
		}
	}
	return const Size(-1, -1);
	*/
}


class Swipable extends StatelessWidget {
	// final Widget child;
	final Container child;
	final double down;
	final void Function()? onOut;
	final void Function()? onIn;
	const Swipable({super.key, required this.child, this.down = 0, this.onOut, this.onIn});

	@override
	// Widget build(BuildContext context) {
	Widget build(BuildContext context) {

		// debugPrint(snap.data.toString());
		

		// double widgetHeight = 250;
		// double widgetWidht = 230;

		// if(!snap.hasData){ return const SizedBox(); }

		Size ws = getChildSize(child);

		double widgetHeight = ws.height;
		double widgetWidht = ws.width;

		double padding = 2 * MediaQuery.sizeOf(context).width / 100;

		Offset centerOffset = Offset(
			(MediaQuery.sizeOf(context).width / 2) - (widgetWidht / 2),
			((MediaQuery.sizeOf(context).height - 56) / 2) - (widgetHeight / 2),
		);
		ValueNotifier<SwiperDetails> offset = ValueNotifier(SwiperDetails(offset: centerOffset, duration: 0));

		return GestureDetector(
			onPanUpdate: (DragUpdateDetails details){
				double mL = MediaQuery.sizeOf(context).width;
				double mU = MediaQuery.sizeOf(context).height;
				Offset of = Offset(
					offset.value.offset.dx + details.delta.dx,
					offset.value.offset.dy + details.delta.dy,
				);
				Direction? d;
				// if((of.dx < padding || (of.dx + widgetHeight) > (mL - padding)) || (of.dy < padding || of.dy > (mU - padding))){
				if((of.dx < padding || (of.dx + (widgetWidht / 2)) > (mL - padding)) || ((of.dy + widgetHeight / 2) < padding || of.dy > (mU - padding))){
				// if((of.dx < padding || of.dx > (mL - padding)) || (of.dy < padding || of.dy > (mU - padding))){
					d = getDirection(details.delta.dx, details.delta.dy);
				}
				offset.value = SwiperDetails(offset: of, duration: 0, direction: d);
			},



			onPanEnd: (DragEndDetails details){
				double up = 0;
				double left = 0;

				double mL = MediaQuery.sizeOf(context).width;
				double mU = MediaQuery.sizeOf(context).height;

				if(offset.value.direction == null){
					offset.value = SwiperDetails(
						offset: centerOffset,
						duration: 200
					);
					return;
				} else {
					switch (offset.value.direction!) {
						case Direction.up :{
							up = -widgetHeight;
							left = centerOffset.dx;
							break;
						}
						case Direction.down :{
							up = mU + widgetHeight;
							left = centerOffset.dx;
							break;
						}
						case Direction.right :{
							up = centerOffset.dy;
							left = mL + widgetWidht;
							break;
						}
						case Direction.left :{
							up = centerOffset.dy;
							left = -widgetWidht;
							break;
						}
						case Direction.upLeft :{
							up = -widgetHeight;
							left = -widgetWidht;
							break;
						}
						case Direction.upRight :{
							up = -widgetHeight;
							left = mL + widgetWidht;
							break;
						}
						case Direction.downLeft :{
							up = mU + widgetHeight;
							left = -widgetWidht;
							break;
						}
						case Direction.downRight :{
							up = mU + widgetHeight;
							left = mL + widgetWidht;
							break;
						}
						case Direction.solid :{
							up = centerOffset.dy;
							left = centerOffset.dx;
							break;
						}
					}
				}

				offset.value = SwiperDetails(
					offset: Offset(left, up),
					duration: 100
				);

				if(onOut != null){
					onOut!();
				}
			},


			child: SizedBox(
				width: MediaQuery.of(context).size.width,
				height: MediaQuery.of(context).size.height,
				child: Stack(
					children: [
						ValueListenableBuilder(
							valueListenable: offset,
							builder: (BuildContext context, SwiperDetails value, Widget? _){
								return AnimatedPositioned(
									duration: Duration(milliseconds: value.duration),
									top: value.offset.dy + down,
									left: value.offset.dx,
									child: MouseRegion(
										cursor: SystemMouseCursors.move,
										child: child,
									),
								);
							}
						)
					],
				),
			)
		);
	}
}

