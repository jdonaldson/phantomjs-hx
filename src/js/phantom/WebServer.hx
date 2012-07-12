import js.phantom.Request;
import js.phantom.Response;
class WebServer {
    @:native("require('webserver')")
    public static function create():WebServer;
    public static function listen(port:Int, cb:Request->Response->Void):Void;
}
