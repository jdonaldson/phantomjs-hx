import js.phantom.Request;
import js.phantom.Response;

@:native("require('webserver')")
class WebServer {
    public static function create():WebServer;
    public function listen(port:Int, cb:Request->Response->Void):Void;
}
