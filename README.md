Jasmine & Coffeescript
=================================

Jasmine is a behavior-driven development framework for testing JavaScript code. [jasmine 'http://jasmine.github.io/2.0/introduction.html']. While, CoffeeScript is a tiny language that compiles JavaScript.    

Run package.json to install node modules dependancies.
''''
npm install
''''

You can now try to run 
''''
cake build:all
''''

and you should get your CoffeeScript files translated into JavaScript and even minified using the node module uglify. You can of course swap this module for the closure compiler or the yui compressor.    
You can now run the 'SpecRunner.html' into a web browser - every specs should passed the test :)