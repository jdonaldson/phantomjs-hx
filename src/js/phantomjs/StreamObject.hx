package js.phantomjs;

/**
  A stream object returned from the open() function
 **/
class StreamObject{

    /**
      returns the content of the stream.
     **/
    public function read():String;

    /**
      writes the string to the stream.
     **/
    public function write(data:String):Void;

    /**
      reads only a line from the stream and return it.
     **/
    public function readLine():String;

    /**
      writes the data as a line to the stream.
     **/
    public function writeLine(data:String):Void;

    /**
      flushes all pending input output.
     **/
    public function flush():Void;

    /**
      completes the stream operation.
     **/
    public function close():Void;

}
