package js.phantom;

@:native("require('fs')");
extern class FileSystem {
//Read-only properties
public static var separator(default,null):String; // is the path separator (forward slash or backslash, depending on the operating system).
public static var workingDirectory(default,null):String; // is the current working directory.

//Query functions
public static function list(path):Array<String>; // returns the list of all the names of all the files in a specified path.
public static function absolute(path):String // returns the absolute path starting from the root file system, resolved from the current working directory.
public static function exists(path):Bool // returns true if a file or a directory exists.
public static function isDirectory(path):Bool // returns true if the specified path is a directory.
public static function isFile(path):Bool // returns true if the specified path is a file.
public static function isAbsolute(path):Bool // returns true if the specified path is an absolute path.
public static function isExecutable(path):Bool // returns true if the specified file can be executed.
public static function isReadable(path):Bool // returns true if a file or a directory is readable.
public static function isWritable(path):Bool // returns true if a file or a directory is writeable.
public static function isLink(path):Bool // returns true if the specified path is a symbolic link.
public static function readLink(path):String // returns the target of a symbolic link.

//Directory-related functions:
public static function changeWorkingDirectory(path):Void; // changes the current working directory to the specified path.
public static function makeDirectory(path):Void; // creates a new directory.
public static function makeTree(path):Void; // creates a directory including any missing parent directories.
public static function removeDirectory(path):Void; // removes a directory if it is empty
public static function removeTree(path):Void; // removes the specified path, regardless of whether it is a file or a directory.
public static function copyTree(source, destination):Void; // copies the entire files from a source path to the destination path.

//File-related functions:
public static function open(path, mode):StreamObject; // returns a stream object representing the stream interface to the specified file (mode can be r for read, w for write, or a for append).
public static function read(path):String; // returns the entire content of a file.
public static function write(path, content, mode):Void; // writes content to a file (mode can be w for write or a for append).
public static function size(path):Int; // returns the size (in bytes) of the file specified by the path.
public static function remove(path):Void; // removes the file specified by the path.
public static function copy(source, destination):Void; // copies a file to another.
public static function move(source, destination):Void; // movies a file to another, effectively renaming it.
public static function touch(path):Void; // touches a file (i.e. changes its access timestamp).

}
