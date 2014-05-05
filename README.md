Jasmine & CoffeeScript
=================================

Refers to [http://carolineaubry.com/Jasmine-and-CoffeeScript/](http://carolineaubry.com/Jasmine-and-CoffeeScript/) for further information.    

[Jasmine](http://jasmine.github.io/2.0/introduction.html) is a behavior-driven development framework for testing JavaScript code. While, [CoffeeScript](http://coffeescript.org/) is a tiny language that compiles JavaScript.    

Run *./package.json* in the current project directory to install node modules dependencies:    

    npm install

Add the node modules folder to your $PATH, if you haven't done it yet. If you are unsure where the folder is located simply run:    

    which cake

*Note: On Windows, node modules are usually located at: C:\Users[name]\AppData\Roaming\npm. On OSX, you can often find them at: /usr/local/bin*

Once added, you can run:    

    cake build:all

You should get your CoffeeScript files compiled into JavaScript and minified using the node module uglify.    
Launch the *./SpecRunner.html* using your web browser - every test should pass :)

### Writing test commands ###
You can now start writing your CoffeeScript commands tests in /spec/src/coffee-script    
If you wish to listen out for changes in the file you are currently working on, you can run:     

    cake watch:test

When this is done, you can compile them to JavaScript, by running the command:

    cake build:test

When the build is done, you should be able to notice some changes in /spec/src/js    
To ensure, your commands are syntaxly correct, simply launch the *./SpecRunner.html* into a web browser once again. At this point, your new test commands should failed.    

This is great, you now need to write the code that will make your commands pass every test.     

### Writing production commands ###
The production code for CoffeeScript is located at /app/src/coffee-script    
If you wish to listen out for changes in the file you are currently working on, you can run:   

    cake watch

Once you are happy with your CoffeeScript, you can run the following command: 

<<<<<<< HEAD
    cake build

You should be able to notice changes in /app/src/js, as well as /public/js/app.min.js    
The command you just ran, compiled all of your CoffeeScript located in /app/src/coffee-script into a JavaScript file located at /app/src/js/app.js    
It also minifies every JavaScript files (in case you need to include some JavaScript files within this folder) located at /app/src/js into a single JavaScript file located at /public/js/app.min.js    

You can now launch */public/index.html* into a web page and see your current project working on this page. If you followed the previous step and wrote some test commands, you should now be able to pass your tests. Check this out by launching *./SpecRunner.html*.    
If not, just follow the TDD procedure and just try again :p
=======
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