package js.phantomjs;
extern class Response {
    /**
       stores all HTTP headers as key-value pair (set these BEFORE calling write for the first time)
     **/
    public var headers:Dynamic<String>;

    /**
       sets the returned status code
     **/
    public var statusCode:Int;

    /**
      sends a chunk for the response body (it can be called multiple times)
     **/
    public function write(data:String):Void;
    
    /**
      close the HTTP connection 

      To avoid Client detecting a connection drop,
      remember to use write() at least once. Sending an empty string (i.e.
      write("")) would be enough if the only aim is, for example, to return a
      HTTP 200 Success
     **/
    public function close():Void;
}
