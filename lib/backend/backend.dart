import 'dart:io';


bool isDesktop(){
	if(Platform.isLinux || Platform.isMacOS || Platform.isWindows){
		return true;
	}
	return false;
}
