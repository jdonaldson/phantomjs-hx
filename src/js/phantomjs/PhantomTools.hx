package js.phantomjs;
import js.phantomjs.WebPage;
/**
  A class with some utility functions to bootstrap haxe std lib into a given
  page.
 **/

class PhantomTools {
    private static var __PHANTOMJS__:Bool; 

    /**
      injects the currently executing phantomjs script into a webkit page.
     **/
    public static function injectThis(page:WebPage){
        page.evaluate(function(){
            untyped window.__PHANTOMJS__ = true; 
        });
        page.injectJs(System.args[0]);
    }

    /**
      Simple routine which detects if it is being evaluated in webkit.
      Note: The page must first be injected with injectThis.
     **/
    public static function inWebkit(){
        return untyped window.__PHANTOMJS__ != null;
    }
}
