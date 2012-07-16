package js.phantomjs;

/**
  The interface with various PhantomJS functionalities is carried out using a
  new host object named phantom, added as a child of the `window` object.
 **/
@:native("phantom")
extern class Phantom {
    /**
      This read-only property is an array of the arguments passed to
      the script. Deprecated: Please use system.args from the System module.
     **/
    public static var args:Array<String>;

    /**
      This property stores the path which is used by injectJs
      function to resolve the script name. Initially it is set to the location
      of the script invoked by PhantomJS.
     **/
    public static var libraryPath:String;

    /**
      This read-only property stores the name of the invoked script file.
      Deprecated: Please use system.args[0] from the System module.
     **/
    public static var scriptName:String;

    /**
      This read-only property holds PhantomJS version. Example value: {
      major:1, minor:0, patch:0 }.
     **/
    public static var version:{major:Int, minor:Int, patch:Int};

    /**
      Exits the program with the specified return value. If no return value is
      specified, it is set to 0.
     **/
    public static function exit(?returnValue:Int):Void;

    /**
      Injects external script code from the specified file. If the file can
      not be found in the current directory, libraryPath is used for
      additional look up.  This function returns true if injection is
      successful, otherwise it returns false.
     **/
    public static function injectJs(filename:String):Bool;

}


