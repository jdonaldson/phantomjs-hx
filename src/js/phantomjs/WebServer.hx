import js.phantom.Request;
import js.phantom.Response;

/**
  Starting from version 1.4, PhantomJS script can start a web server. The
  implementation is using the embedded web server module Mongoose.

  Note 1: This WebServer module is intended for ease of communication between
  PhantomJS scripts and the outside world. It is not recommended to use it as a
  general production server.

  Note 2: The API for the module is still very experimental. Depending on the
  needs, the functionalities and the corresponding API will be expanded in the
  next versions.
 **/
@:native("require('webserver')")
class WebServer {
    public static function create():WebServer;
    public function listen(port:Int, cb:Request->Response->Void):Void;
}
