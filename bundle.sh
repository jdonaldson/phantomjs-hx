rm -r haxelib/js
rm phantomjs.zip
cp -r src/js haxelib

haxe -cp src -js x --no-output -xml haxelib/haxedoc.xml `cd src && ls js/phantomjs/*.hx`
zip -r phantomjs.zip haxelib -x "*.DS_Store" "*.un~"
