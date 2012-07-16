package js.phantomjs;

/**
  A set of API functions is available to access files and directories. They are
  modelled after CommonJS Filesystem proposal.
 **/
@:native("require('fs')")
extern class FileSystem {
    //Read-only properties

    /**
      is the path separator (forward slash or backslash, depending on the operating system).
     **/
    public static var separator(default,null):String;

    /**
      is the current working directory.
     **/
    public static var workingDirectory(default,null):String;

    //Query functions

    /**
      returns the list of all the names of all the files in a specified path.
     **/
    public static function list(path:String):Array<String>;

    /**
      returns the absolute path starting from the root file system, resolved
      from the current working directory.
     **/
    public static function absolute(path:String):String;

    /**
      returns true if a file or a directory exists.
     **/
    public static function exists(path:String):Bool;

    /**
      returns true if the specified path is a directory.
     **/
    public static function isDirectory(path:String):Bool;

    /**
      returns true if the specified path is a file.
     **/
    public static function isFile(path:String):Bool;

    /**
      returns true if the specified path is an absolute path.
     **/
    public static function isAbsolute(path:String):Bool;

    /**
      returns true if the specified file can be executed.
     **/
    public static function isExecutable(path:String):Bool;

    /**
      returns true if a file or a directory is readable.
     **/
    public static function isReadable(path:String):Bool;

    /**
      returns true if a file or a directory is writeable.
     **/
    public static function isWritable(path:String):Bool;

    /**
      returns true if the specified path is a symbolic link.
     **/
    public static function isLink(path:String):Bool;

    /**
      returns the target of a symbolic link.
     **/
    public static function readLink(path:String):String;

    //Directory-related functions:
    /**
      changes the current working directory to the specified path.
     **/
    public static function changeWorkingDirectory(path:String):Void;

    /**
      creates a new directory.
     **/
    public static function makeDirectory(path:String):Void;

    /**
       creates a directory including any missing parent directories.
     **/
    public static function makeTree(path:String):Void;

    /**
       removes a directory if it is empty
     **/
    public static function removeDirectory(path:String):Void;

    /**
       removes the specified path, regardless of whether it is a file or a
       directory.

     **/
    public static function removeTree(path:String):Void;

    /**
       copies the entire files from a source path to the destination path.
     **/
    public static function copyTree(source:String, destination:String):Void;

    //File-related functions:
    /**
       returns a stream object representing the stream interface to the
       specified file (mode can be r for read, w for write, or a for append).
     **/
    public static function open(path:String, mode:String):StreamObject;

    /**
      returns the entire content of a file.
     **/
    public static function read(path:String):String;

    /**
       writes content to a file (mode can be w for write or a for append).
     **/
    public static function write(path:String, content:String, mode:String):Void;

    /**
      returns the size (in bytes) of the file specified by the path.
     **/
    public static function size(path:String):Int;

    /**
       removes the file specified by the path.
     **/
    public static function remove(path:String):Void;

    /**
      copies a file to another.
     **/
    public static function copy(source:String, destination:String):Void;

    /**
      movies a file to another, effectively renaming it.
     **/
    public static function move(source:String, destination:String):Void;

    /**
      touches a file (i.e. changes its access timestamp).
     **/
    public static function touch(path:String):Void;

}
