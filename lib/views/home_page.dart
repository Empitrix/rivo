import 'package:flutter/material.dart';
import 'package:rivo/utils/utils.dart';


class HomePage extends StatefulWidget {
	const HomePage({super.key});

	@override
	State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


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
				appBar: AppBar(
					title: const Text("Something"),
				),
				body: const Center(),
			)
		);
	}
}

