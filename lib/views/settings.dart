import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rivo/components/switch_tile.dart';
import 'package:rivo/config/manager.dart';
import 'package:rivo/config/public.dart';


class SettingsPage extends StatefulWidget {
	const SettingsPage({super.key});

	@override
	State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
	@override
	Widget build(BuildContext context) {
		return PopScope(
			onPopInvoked: (didPop){
				if(didPop){ return; }
			},
			child: Scaffold(
				appBar: AppBar(
					leading: IconButton(
						icon: const Icon(Icons.close),
						onPressed: () => Navigator.pop(context),
					),
					title: const Text("Settings"),
				),
				body: ListView(
					children: [
						SwtichTile(
							leading: const Icon(Icons.dark_mode),
							title: const Text("Dark Mode"),
							value: settings['dMode'],
							onChanged: (nT){
								setState(() {settings['dMode'] = nT; });
								Provider.of<Manager>(context, listen: false).changeThemeMode(settings['dMode'] ? ThemeMode.dark : ThemeMode.light);
							}
						),
					],
				)
			)
		);
	}
}
