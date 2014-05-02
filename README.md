Jasmine & CoffeeScript
=================================

[Jasmine](http://jasmine.github.io/2.0/introduction.html) is a behavior-driven development framework for testing JavaScript code. While, [CoffeeScript](http://coffeescript.org/) is a tiny language that compiles JavaScript.    

Run package.json to install node modules dependancies:
```
npm install
```

Add node modules folder to your $PATH. If you are unsure where the folder is located simply run:
```
which cake
```

On Windows machines, node modules are located at C:\Users\[name]\AppData\Roaming\npm    

You can now run: 
```
cake build:all
```

You should get your CoffeeScript files translated into JavaScript and even minified using the node module uglify. You can of course swap this module for the closure compiler or the yui compressor.     
Run the 'SpecRunner.html' into a web browser - every test should pass :)
