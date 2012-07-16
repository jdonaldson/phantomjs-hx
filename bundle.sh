rm -r haxelib
rm phantomjs.zip
mkdir -p haxelib
cp haxelib.xml haxelib
cp -r src/js haxelib
cd src
haxe -js x --no-output -xml ../haxelib/haxedoc.xml `ls js/phantomjs/*.hx`
cd -
zip -r phantomjs.zip haxelib -x "*.DS_Store"
