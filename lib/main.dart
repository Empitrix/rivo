import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rivo/config/manager.dart';
import 'package:rivo/views/home_page.dart';


void main(){
	runApp(const RivoApp());
}

class RivoApp extends StatelessWidget {
	const RivoApp({super.key});

	@override
	Widget build(BuildContext context) {
		return MultiProvider(
			providers: [
				ChangeNotifierProvider(
					create: (_) => Manager(context),
					builder: (BuildContext context, Widget? child){
						return MaterialApp(
							title: "Rivo",
							debugShowCheckedModeBanner: false,
							themeMode: Provider.of<Manager>(context).themeMode,
							darkTheme: Provider.of<Manager>(context).darkTheme(),
							theme: Provider.of<Manager>(context).lightTheme(),
							home: const HomePage(),
						);
					},
				)
			]
		);
	}
}

