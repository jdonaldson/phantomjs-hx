# phantomjs-hx

phantomjs-hx is a [haxe](http://www.haxe.org) extern for
[phantomjs](http://phantomjs.org/).

It contains typedefs and externs for all of the common modules and entities.
It also contains the PhantomTools class, which enable some Haxe-specific
functionality.

For now,  PhantomTools includes some utilities that let you more easily work
with Haxe code in Webpage.evaluate.  See more information on the [phantomjs
api](http://code.google.com/p/phantomjs/wiki/Interface#evaluate(function\)).

Webpage.evaluate() accepts a callback that executes locally in a new virtual
browser instance. This page instance is separate from the phantomjs instance,
so none of the scoped variables are avaialble.  Naturally, this virtual
instance will not have the Haxe standard lib by default, such as trace, Hash,
etc. The current method of dealing with this is to include a small js file in
the evaluated page containing the compiled haxe libs.

## injectThis()
PhantomTools provides "injectThis" which will inject the current script into
the page. This will provide all of the methods from your phantomjs script
in the page you are evaluating.

```javascript
var page = WebPage.create();
PhantomTools.injectThis(page);
page.evaluate(function(){
        var h = new Hash<Int>(); // haxe specific methods here.
    });
```

This is extremely useful, but still has some significant issues and some
potential for problems.

### Scoping

page.evaluate is executed *within* the constructed page The evaluate callback
is not a closure, and should be treated as a completely separate method that
(thanks to injectThis) happens to have access to all of the same library
methods.  You can pass simple objects to the evaluated method;  Anything that
can be serialized via JSON will work.

```javascript
var page = WebPage.create();
PhantomTools.injectThis(page);
var k = 'a variable in the phantom scope';
page.evaluate(function(){
         trace(k); // k is undefined: this function is in a separate page scope.
    });
```

### Preventing Static Main

Under normal circumstances, injectThis() will insert itself into the page, and
try to execute its static main. To prevent this from happening, you can
check the result from PhantomTools.noPhantom() to avoid running main() in an
evaluated page:

```javascript
static function main(){
  if (PhantomTools.noPhantom()) return; // evaluated in a page, exit immediately.
  //[...]
```

### Sandboxing

Keep in mind that PhantomTools.injectThis() loads phantomjs application code
into a sandboxed page instance, which may be running a page with unknown third
party code. Be cautious when using it, since it could potentially leak
passwords, credentials, etc. that are contained in the phantomjs script
source.

### Unhandling errors

Haxe's default js.Lib will automatically set a window.onerror handler that
catches all page errors.  This can block error messages from reaching Phantom's
error handlers.  One way of preventing this from happening is to use
js.Lib.setErrorHandler(f); where "f" will always return true. The other way is
to use PhantomTools.exposeWindowErrors(page) on the relevant Phantom WebPage
"page".  The exposeWindowErrors() method will work whether or not you have used
injectThis().

For instance, here's an example class that shows a typical workflow.

```javascript
// PhantomTest.hx
import js.Lib;
import js.phantomjs.WebPage;
import js.phantomjs.PhantomTools;

class PhantomTest{
    static function main(){
        if (PhantomTools.noPhantom()) return; // exit if not in phantom scope

        var page = WebPage.create();
        page.open("some_arbitrary_webpage.html", function(status){
                PhantomTools.injectThis(page); // include this script in the opened page
                PhantomTools.exposeWindowErrors(page); // "unhandle" the default window errors for the page.
                page.onError = function(x,i) trace("page error: " + x); // phantom handles errors on this page
                var argument = 'blah blah blah'; // set some text to send to the page
                var result = page.evaluate(function(argument){
                    var h = new Hash<String>(); // use any Haxe library method, courtesy of injectThis.
                    Lib.document.innerHTML = argument; // set the document content with the argument
                    untyped h.invalid_method(); // trigger an error, for illustration purposes
                    }, argument); // pass the text to the page
                }
                page.render("output.png"); // render the page.
                PhantomTools.exit(); // exit phantomjs
    }
}
```

```bash
# build.hxml
-lib phantomjs-hx
-main PhantomTest
-js test.js
-cmd phantomjs test.js
```



With this code, you can use any of the phantomjs haxe methods inside your page, and also ensure
that js.Lib is not preventing errors from reaching your page error handlers.



## Note
The require("webpage").create() syntax is not used to create phantomjs objects
(e.g. WebPages).  Instead, you can simply use  the "create" method for the
class. (e.g. WebPage.create()), which conforms to Haxe syntax, and aliases the
correct js code.
