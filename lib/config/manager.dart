import 'package:flutter/material.dart';
import 'package:rivo/theme/dark.dart';
import 'package:rivo/theme/light.dart';


class Manager extends ChangeNotifier {
	final BuildContext context;
	Manager(this.context);

	/* Theme */
	ThemeMode themeMode = ThemeMode.dark; 
	ThemeData darkTheme() => darkThemeData();
	ThemeData lightTheme() => lightThemeData();

	void changeThemeMode(ThemeMode newMode){
		themeMode = newMode;
		notifyListeners();
	}

}
