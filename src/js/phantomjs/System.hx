package js.phantomjs;
@:native("require('system')")
extern class System {
    /**
      the name of the platform, the value is always phantomjs.
     **/
    public static var platform:String; 


    /**
       returns the list (as key value pair) of the environment variables.
     **/
    public static function env():{};

    /**
      returns the list of command-line arguments. The first one is always the
      script name, it is followed by the subsequent arguments.
     **/
    public static var args:Array<String>; 
}
