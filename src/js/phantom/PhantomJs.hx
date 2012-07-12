package js.phantom;

@:native("phantom")
extern class PhantomJs {
public static var args:Array<String>; // (array) This read-only property is an array of the arguments passed to the script. Deprecated: Please use system.args from the System module.
public static var libraryPath:String; // (string) This property stores the path which is used by injectJs function to resolve the script name. Initially it is set to the location of the script invoked by PhantomJS.
public static var scriptName:String; //(string) This read-only property stores the name of the invoked script file. Deprecated: Please use system.args[0] from the System module.
public static var version:{major:Int, minor:Int, patch:Int}; // (object) This read-only property holds PhantomJS version. Example value: { major:1, minor:0, patch:0 }.

public static function exit(returnValue:Dynamic); // Exits the program with the specified return value. If no return value is specified, it is set to 0.
public static function injectJs(filename:String):Bool; // Injects external script code from the specified file. If the file can not be found in the current directory, libraryPath is used for additional look up.  This function returns true if injection is successful, otherwise it returns false.

}


