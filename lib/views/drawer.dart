import 'package:flutter/material.dart';
import 'package:rivo/config/navigator.dart';
import 'package:rivo/views/settings.dart';

class DrawerPage extends StatefulWidget {
	final BorderRadiusGeometry borderRadius;
	const DrawerPage({
		super.key,
		this.borderRadius = const BorderRadius.only(
			topLeft: Radius.zero,
			topRight: Radius.circular(5),
			bottomLeft: Radius.zero,
			bottomRight: Radius.circular(5),
		)
	});

	@override
	State<DrawerPage> createState() => _DrawerPageState();
}

class _DrawerPageState extends State<DrawerPage> {


	void moveTo(Widget screen, String name, [bool isPush = true]){
		Navigator.pop(context);
		changeView(context, screen, name, isPush: isPush);
	}

	@override
	Widget build(BuildContext context) {
		return Drawer(
			shape: RoundedRectangleBorder(
				borderRadius: widget.borderRadius
			),
			backgroundColor: Theme.of(context).scaffoldBackgroundColor,
			child: Scaffold(
				body: ListView(
					children: [
						ListTile(
							leading: const Icon(Icons.settings),
							title: const Text("Settings"),
							onTap: () => moveTo(const SettingsPage(), "SettingsPage"),
						),
					],
				),
			),
		);
	}
}
