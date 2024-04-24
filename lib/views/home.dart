import 'package:rivo/components/swipable/swipable.dart';
import 'package:flutter/material.dart';
import 'package:rivo/utils/utils.dart';
import 'package:rivo/views/drawer.dart';


class HomePage extends StatefulWidget {
	const HomePage({super.key});

	@override
	State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

	GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();


	Future<void> load() async {
		await loading();
	}

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
				),
				body: Swipable(
					child: Container(
						color: Colors.transparent,
						width: 250,
						height: 250,
						child: const Card(
							child: Center(child: Text("Swipe Me around")),
						),
					),
				),
			)
		);
	}
}
