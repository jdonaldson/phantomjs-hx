package js.phantomjs;
extern class WebPageSettings {

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

}
