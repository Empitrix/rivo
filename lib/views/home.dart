import 'package:rivo/components/animation/linear.dart';
import 'package:rivo/components/swipable/swipable.dart';
import 'package:flutter/material.dart';
import 'package:rivo/utils/utils.dart';
import 'package:rivo/views/drawer.dart';


class HomePage extends StatefulWidget {
	const HomePage({super.key});

	@override
	State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {

	GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


	// late LinearAnim anim;
	List<LinearAnim> anims = [];


	Future<void> load() async {

		for(int i = 0; i < 100; i++){
			anims.add(genLinAnim(this, begin: 0, end: 10)..idx = i);
		}
		setState(() {});

		await loading();
	}

	int counter = 0;


	@override
	void initState() {
		load();
		super.initState();
	}

	@override
	Widget build(BuildContext context) {
		return PopScope(
			onPopInvoked: (didPop){
				if(didPop){ return; }
			},
			child: Scaffold(
				key: scaffoldKey,
				drawer: const DrawerPage(),
				appBar: AppBar(
					leading: IconButton(
						icon: const Icon(Icons.menu),
						onPressed: (){
							if(scaffoldKey.currentState != null){
								scaffoldKey.currentState!.openDrawer();
							}
						},
					),
					title: const Text("Something"),
					actions: [
						IconButton(onPressed: load, icon: const Icon(Icons.repeat))
					],
				),

				/*
				body: Stack(
					// alignment: Alignment.bottomCenter,
					// alignment: Alignment.topCenter,
					children: [

						AnimatedContainer(
							color: Colors.brown,
							alignment: Alignment.bottomCenter,
							duration: const Duration(milliseconds: 300),
							// top: (counter * 10),
							padding: EdgeInsets.only(top: (counter * 5)),
							// margin: EdgeInsets.only(bottom: (counter * 10)),
							child: Stack(
								alignment: Alignment.topCenter,
								children: [

									for(LinearAnim anim in anims) AnimatedBuilder(
										animation: anim.animation,
										builder: (BuildContext context, Widget? child){
											return Swipable(
												// down: ((anim.idx - 1) * 10) - anim.animation.value,
												// down: (((anim.idx - anims.length) + 10) * 10),
												down: (-anim.idx) * 5,
												onOut: () async {
													// await anim.controller.forward();
													anims.remove(anim);
													// anims.remove(anims.last);
													setState(() { counter ++; });
												},
												child: Container(
													color: Colors.transparent,
													width: 350,
													height: 450,
													child: Card(
														color: anim.idx.isOdd ? Colors.blue : Colors.red,
														child: Center(child: Text("Swipe Me around ${anim.idx}")),
													),
												),
											);

										},
									),

								],
							),
						),
						// const SizedBox(height: 100),

					],
				),
				*/
				
				body: AnimatedContainer(
					color: Colors.brown,
					alignment: Alignment.bottomCenter,
					duration: const Duration(milliseconds: 300),
					// top: (counter * 10),
					padding: EdgeInsets.only(top: (counter * 5)),
					// margin: EdgeInsets.only(bottom: (counter * 10)),
					child: Stack(
						alignment: Alignment.topCenter,
						children: [

							for(LinearAnim anim in anims) AnimatedBuilder(
								animation: anim.animation,
								builder: (BuildContext context, Widget? child){
									return Swipable(
										// down: ((anim.idx - 1) * 10) - anim.animation.value,
										// down: (((anim.idx - anims.length) + 10) * 10),
										down: (-anim.idx) * 5,
										onOut: () async {
											// await anim.controller.forward();
											anims.remove(anim);
											// anims.remove(anims.last);
											setState(() { counter ++; });
										},
										child: Container(
											color: Colors.transparent,
											width: 350,
											height: 450,
											child: Card(
												color: anim.idx.isOdd ? Colors.blue : Colors.red,
												child: Center(child: Text("Swipe Me around ${anim.idx}")),
											),
										),
									);

								},
							),

						],
					),
				),

			)
		);
	}
}
