phantomjs-hx
============

phantomjs-hx is a [haxe](http://www.haxe.org) extern for
[phantomjs](http://phantomjs.org/).

It contains typedefs and externs for all of the common modules and entities.

A few caveats:

1. Webpage.evaluate() accepts a callback that executes locally in the virtual
   browser instance.  This virtual instance will not have the Haxe standard lib
   mappings, so haxe.Log.trace, js.Lib.document, etc. will not be available.
   See more information on the [phantomjs
   api](http://code.google.com/p/phantomjs/wiki/Interface#evaluate(function\)).
   Note that the function cannot return closures or functions, only simple
   objects.  However, the return is fully typed.
2. I'm including some deprecated features, including the [arg array for
   phantom](http://code.google.com/p/phantomjs/wiki/Interface#args_(array\)).
   In future phantomjs versions this may not be present.  Use System.args
   instead.
