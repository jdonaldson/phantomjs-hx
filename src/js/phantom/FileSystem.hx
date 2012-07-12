package js.phantom;

@:native("require('fs')");
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
    public static function list(path):Array<String>;

    /**
      returns the absolute path starting from the root file system, resolved
      from the current working directory.
     **/
    public static function absolute(path):String;

    /**
      returns true if a file or a directory exists.
     **/
    public static function exists(path):Bool;

    /**
      returns true if the specified path is a directory.
     **/
    public static function isDirectory(path):Bool;

    /**
      returns true if the specified path is a file.
     **/
    public static function isFile(path):Bool;

    /**
      returns true if the specified path is an absolute path.
     **/
    public static function isAbsolute(path):Bool;

    /**
      returns true if the specified file can be executed.
     **/
    public static function isExecutable(path):Bool;

    /**
      returns true if a file or a directory is readable.
     **/
    public static function isReadable(path):Bool;

    /**
      returns true if a file or a directory is writeable.
     **/
    public static function isWritable(path):Bool;

    /**
      returns true if the specified path is a symbolic link.
     **/
    public static function isLink(path):Bool;

    /**
      returns the target of a symbolic link.
     **/
    public static function readLink(path):String;

    //Directory-related functions:
    /**
      changes the current working directory to the specified path.
     **/
    public static function changeWorkingDirectory(path):Void;

    /**
      creates a new directory.
     **/
    public static function makeDirectory(path):Void;

    /**
       creates a directory including any missing parent directories.
     **/
    public static function makeTree(path):Void;

    /**
       removes a directory if it is empty
     **/
    public static function removeDirectory(path):Void;

    /**
       removes the specified path, regardless of whether it is a file or a
       directory.

     **/
    public static function removeTree(path):Void;

    /**
       copies the entire files from a source path to the destination path.
     **/
    public static function copyTree(source, destination):Void;

    //File-related functions:
    /**
       returns a stream object representing the stream interface to the
       specified file (mode can be r for read, w for write, or a for append).
     **/
    public static function open(path, mode):StreamObject;

    /**
      returns the entire content of a file.
     **/
    public static function read(path):String;

    /**
       writes content to a file (mode can be w for write or a for append).
     **/
    public static function write(path, content, mode):Void;

    /**
      returns the size (in bytes) of the file specified by the path.
     **/
    public static function size(path):Int;

    /**
       removes the file specified by the path.
     **/
    public static function remove(path):Void;

    /**
      copies a file to another.
     **/
    public static function copy(source, destination):Void;

    /**
      movies a file to another, effectively renaming it.
     **/
    public static function move(source, destination):Void;

    /**
      touches a file (i.e. changes its access timestamp).
     **/
    public static function touch(path):Void;

}
