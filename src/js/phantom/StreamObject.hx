package js.phantom;

class StreamObject{
    //A stream object returned from the open() function has the following functions:

    public function read():String; // returns the content of the stream.
    public function write(data):Void; // writes the string to the stream.
    public function readLine():String; // reads only a line from the stream and return it.
    public function writeLine(data):Void; // writes the data as a line to the stream.
    public function flush():Void; // flushes all pending input output.
    public function close():Void; // completes the stream operation.

r}
