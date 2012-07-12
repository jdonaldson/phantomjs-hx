package js.phantom; 

/**
  WebPage object encapsulates a web page. It is usually instantiated using the
  new keyword. The properties, functions, and callbacks of the WebPage object
  are described in the following sections.
 **/
@:native("WebPage")
extern class WebPage {
    /**
      This property defines the rectangular area of the web page to be
      rasterized when render() is invoked. If no clipping rectangle is set,
      render() will process the entire web page.  Example: page.clipRect = {
      top: 14, left: 3, width: 400, height: 300 } 
     **/ 
    public var clipRect:{top:Float, left:Float, width:Float, right:Float}; 

    /**
      This property stores the content of the web page, enclosed in HTML/XML
      element. Setting the property will effectively reload the web page with
      the new content.  
     **/ 
    public var content:String; 

    /**
      This property stores the path which is used by injectJs function to
      resolve the script name. Initially it is set to the location of the
      script invoked by PhantomJS.  
     **/
    public var libraryPath:String; 

    /**
      defines whether to execute the script in the page or not (default to
      true)
     **/
    public var javascriptEnabled:Bool; 

    /**
      defines whether to load the inlined images or not
     **/
    public var loadImages:Bool;


    /**
      defines whether local resource (e.g. from file) can access remote URLs or
      not (default to false) 
     **/
    public var localToRemoteUrlAccessEnabled:Bool; 

    /**
       defines the user agent sent to server when the web page requests
       resources.
     **/
    public var userAgent:String; 

    /**
      sets the user name used for HTTP authentication
     **/
    public var userName:String;  

    /**
       sets the password used for HTTP authentication
     **/
    
    public var password:String; 

    /**
       defines whether load requests should be monitored for cross-site
       scripting attempts (default to false)
     **/
    public var XSSAuditingEnabled:Bool; 

    /**
       defines whether web security should be enabled or not (default to true)
     **/
    public var webSecurityEnabled:Bool;

    /**
      This property sets the size of the viewport for the layout process. It is
      useful to set the preferred initial size before loading the page, e.g. to
      choose between landscape vs portrait.  Because PhantomJS is headless
      (nothing is shown), !viewportSize effectively simulates the size of the
      window like in a traditional browser.  
      Example: page.viewportSize = { width: 480, height: 800 }
     **/
    public var viewPortSize:{width:Float, height:Float}; 
    
    
    /**
      Evaluates the given function in the context of the web page. The
      execution is sandboxed, the web page has no access to the phantom object
      and it can't probe its own setting. Any return value must be of a simple
      object, i.e. no function or closure.
      Example:
      console.log('Page title is ' + page.evaluate(function () {
          return document.title;
          }));
          ))
     **/
    public function evaluate(function:Dynamic):Void;
    
    /**
      Includes external script from the specified URL (usually remote
      location) and executes the callback upon completion.

      Example:
      page.includeJs("http://ajax.googleapis.com/ajax/libs/jquery/1.6.1/jquery.min.js", function() {
        // jQuery is loaded, now manipulate the DOM
      });
     **/
    public function includeJs(URL:String, callb:Void->Void):Void;

    /**
      Injects external script code from the specified file. If the file can not be
      found in the current directory, libraryPath is used for additional look up.
      This function returns true if injection is successful, otherwise it returns
      false. 
     **/
    public function injectJs(filename:String):Void;

    /**
      Opens the URL and loads it to the page. Once page is loaded, the optional
      callback is called using onLoadFinished, and also provides the page
      status to the function ('success' or 'fail').

      Example:
      page.open('http://www.google.com/', function(status) {
          console.log(status);
          // do something here
      });)
     **/
    public function open(URL:String, ?optional_callback:String->Void):Void;

    /**
      Releases memory heap associated with this page. Do not use the page
      instance after calling this.

      Due to some technical limitation, the web page object might not be
      completely garbage collected. This is often encountered when the same
      object is used over and over again. Calling this function may stop the
      increasing heap allocation.
     **/
    public function release():Void;


    /**
     Renders the web page to an image buffer and save it as the specified file.

     Currently the output format is automatically set based on the file
     extension. Supported formats are PNG, JPEG, and PDF.
     **/
    public function render(fileName:String):Void;

    /**
      Sends an event to the web page.

      The first argument is the event type. Supported type are mouseup,
      mousedown, mousemove, and click. The next two arguments represents the
      mouse position.

      As of now, left button is the only pressed button for the event. For
      mousemove however, there is no button pressed (i.e. it is not dragging).

      The events are not like synthetic DOM events. Each event is sent to the
      web page as if it comes as part of user interaction.
     **/
    public function sendEvent(type:String, ?mouseposx:Float, ?mouseposy:Float):Void;
    
    /**
      Uploads the specified file to the form element associated with the
      selector.  This function is used to automate the upload of a file which
      is usually handled with a file dialog in a traditional browser. Since
      there is dialog in this headless mode, such an upload mechanism is
      handled via this special function.

      Example:
      page.uploadFile('input[name=image]', '/path/to/some/photo.jpg');
     **/
    public function uploadFile(selector:String, fileName:String):Void;


    /**
      This callback is invoked when there is a JavaScript alert. The only
      argument passed to the callback is the string for the message.
     **/
    public var onAlert:String->Void;

    /**
      This callback is invoked when there is a JavaScript console. The callback
      may accept up to three arguments: the string for the message, the line
      number, and the source identifier.  By default any console message from
      the web page is not displayed. Using this callback is a typical way to
      redirect it, such as:

      page.onConsoleMessage = function (msg) { console.log(msg); };
     **/
    public var onConsoleMessage:String->Int->String->Void;

    /**
      This callback is invoked when there is a JavaScript execution error. It
      is a good way to catch problems when evaluating a script in the web page
      context. The arguments passed to the callback are the error message and
      the stack trace (as an array).

      Example:
      page.onError = function (msg, trace) {
        console.log(msg);
        trace.forEach(function(item) {
            console.log('  ', item.file, ':', item.line);
        })
      }
     **/
    public var onError:String->Array<{file:String, line:String}>->Void;

    /**
      This callback is invoked after the web page is created and before
      a URL is loaded. The callback may be used to change global
      objects.
     **/
    public var onInitialized:Void->Void;

    /**
      This callback is invoked when the page finishes the loading. It may
      accept an argument status which equals to "success" if there is no
      error and "failed" is error has occurred.
     **/
    public var onLoadFinished:String->Void;

    /**
      This callback is invoked when the page starts the loading. There
      is no argument passed to the callback.
     **/
    public var onLoadStarted:Void->Void;

    /**
      This callback is invoked when the page requests a resource. The only
      argument to the callback is the request object.
     **/
    public var onResourceRequested:Request->Void;

    /**
      This callback is invoked when the a resource requested by the page is
      received. The only argument to the callback is the request object.
      
      If the resource is large and sent by the server in multiple chunks,
      onResourceReceived will be invoked for every chunk received by PhantomJS.
     **/ 
    public var onResourceReceived:Request->Void;

    @:native("require('webpage')")
    public static function create():WebPage;
}
