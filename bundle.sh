cd src; 
haxe -js x.js --no-output -cp src -xml ../haxedoc.xml `ls js/phantomjs/*`
zip -r ../phantom.zip . ../haxelib.xml ../haxedoc.xml
cd -

