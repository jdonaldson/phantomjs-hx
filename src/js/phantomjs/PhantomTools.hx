package js.phantomjs;
import js.phantomjs.WebPage;
import js.Dom.Window;

/**
  A class providing some useful methods for working with Haxe compiled Phantom
  code, especially code evaluated inside of pages.
 **/
class PhantomTools {

    /**
      Injects the currently executing phantomjs script into a webkit page.
      Returns the return value from page.injectJs.
     **/
    public static function injectThis(page:WebPage):Bool{
        return page.injectJs(System.args[0]);
    }

    /**
      Sets a window.onerror handler that will always return false (if
      appropriate).  This will ensure that page errors are captured by Phantom
      error handlers.
     **/
    public static function exposeWindowErrors(page:WebPage):Bool{
        return page.evaluate(function(){
	    if( untyped __js__("typeof window") != "undefined" ) {
                untyped window.onerror = function() return false;
	    }
	    return true;
        });
    }

    /**
      Simple routine which detects if it is running inside of the main Phantom
      scope.
     **/
    inline public static function inPhantom():Bool{
        if( untyped __js__("typeof window") != "undefined" ) {
            return untyped window.hasOwnProperty('phantom');
        } else return false;
    }

}
