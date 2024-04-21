import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart';
import 'package:rivo/config/public.dart';
import 'package:path/path.dart' as path;
import 'dart:io';


Future<void> __loadPaths() async {
	/* Load database path */
	Directory appSupport = await getApplicationSupportDirectory();
	dbPath = path.join(appSupport.absolute.path, "db.json");
	debugPrint("Databaes Initialized at: \"$dbPath\"");
}


Future<void> loading() async {
	await __loadPaths();
}
