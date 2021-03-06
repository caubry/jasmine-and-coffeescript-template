fs     = require 'fs'
{exec} = require 'child_process'
util   = require 'util'
uglify = require './node_modules/uglify-js'

prodSrcCoffeeDir     = 'app/src/coffee-script'
testSrcCoffeeDir     = 'spec/src/coffee-script'

publicTargetJsDir    = 'public/js'
prodTargetJsDir      = 'app/src/js'
testTargetJsDir      = 'spec/src/js'

publicTargetFileName   = 'app'
prodTargetFileName     = 'app'
prodTargetCoffeeFile   = "#{prodSrcCoffeeDir}/#{prodTargetFileName}.coffee"
prodTargetJsFile       = "#{prodTargetJsDir}/#{prodTargetFileName}.js"
publicTargetJsMinFile  = "#{publicTargetJsDir}/#{publicTargetFileName}.min.js"

prodCoffeeOpts = "--bare --output #{prodTargetJsDir} --compile #{prodTargetCoffeeFile}"
testCoffeeOpts = "--output #{testTargetJsDir}"
prodCoffeeFiles = []

task 'watch:all', 'Watch production and test CoffeeScript', ->
    invoke 'watch:test'
    invoke 'watch'
    
task 'build:all', 'Build production and test CoffeeScript', ->
    invoke 'build:test'
    invoke 'build'    

task 'watch', 'Watch prod source files and build changes', ->
    invoke 'build'
    util.log "Watching for changes in #{prodSrcCoffeeDir}"

    fs.readdir prodSrcCoffeeDir, (err, files) ->
        handleError(err) if err
        for file in files then do (file) -> 
            fs.watchFile "#{prodSrcCoffeeDir}/#{file}.coffee", (curr, prev) ->
                if +curr.mtime isnt +prev.mtime
                    util.log "Saw change in #{prodSrcCoffeeDir}/#{file}.coffee"
                    invoke 'build'

task 'build', 'Build a single JavaScript file from prod files', ->
    util.log "Building #{prodTargetJsFile}"
    checkProCoffeeFiles build

task 'watch:test', 'Watch test specs and build changes', ->
    invoke 'build:test'
    util.log "Watching for changes in #{testSrcCoffeeDir}"
    
    fs.readdir testSrcCoffeeDir, (err, files) ->
        handleError(err) if err
        for file in files then do (file) ->
            fs.watchFile "#{testSrcCoffeeDir}/#{file}", (curr, prev) ->
                if +curr.mtime isnt +prev.mtime
                    coffee testCoffeeOpts, "#{testSrcCoffeeDir}/#{file}"

task 'build:test', 'Build individual test specs', ->
    util.log 'Building test specs'
    fs.readdir testSrcCoffeeDir, (err, files) ->
        handleError(err) if err
        for file in files then do (file) -> 
            coffee testCoffeeOpts, "#{testSrcCoffeeDir}/#{file}"

task 'uglify', 'Minify and obfuscate', ->
    jsp = uglify.parser
    pro = uglify.uglify

    fs.writeFile "#{publicTargetJsMinFile}", ""

    fs.readdir prodTargetJsDir, (err, files) ->
        handleError(err) if err
        for file in files then do (file) -> 
            fs.readFile "#{prodTargetJsDir}/#{file}", 'utf8', (err, fileContents) ->
                ast = jsp.parse fileContents  # parse code and get the initial AST
                ast = pro.ast_mangle ast # get a new AST with mangled names
                ast = pro.ast_squeeze ast # get an AST with compression optimizations
                final_code = pro.gen_code ast # compressed code here

                fs.appendFile publicTargetJsMinFile, "#{final_code};"

                message = "Uglified #{publicTargetJsMinFile}"
                util.log message
                displayNotification message

coffee = (options = "", file) ->
    util.log "Compiling #{file}"
    exec "coffee #{options} --compile #{file}", (err, stdout, stderr) -> 
        handleError(err) if err
        displayNotification "Compiled #{file}"

handleError = (error) -> 
    util.log error
    displayNotification error
        
displayNotification = (message = '') -> 
    options = {
        title: 'CoffeeScript'
        image: 'lib/CoffeeScript.png'
    }
    try require('./node_modules/growl').notify message, options

checkProCoffeeFiles = (callback) ->
    fs.readdir prodSrcCoffeeDir, (err, files) ->
        handleError(err) if err
        @prodCoffeeFiles = files
        callback()

build = () ->
    appContents = new Array remaining = @prodCoffeeFiles.length
    util.log "Appending #{prodCoffeeFiles.length} files to #{prodTargetCoffeeFile}"
    
    for file, index in @prodCoffeeFiles then do (file, index) ->
        fs.readFile "#{prodSrcCoffeeDir}/#{file}"
                  , 'utf8'
                  , (err, fileContents) ->
            handleError(err) if err
            
            appContents[index] = fileContents
            util.log "[#{index + 1}] #{file}"
            process() if --remaining is 0

    process = ->
        fs.writeFile prodTargetCoffeeFile
                   , appContents.join('\n\n')
                   , 'utf8'
                   , (err) ->
            handleError(err) if err
            
            exec "coffee #{prodCoffeeOpts}", (err, stdout, stderr) ->
                handleError(err) if err
                message = "Compiled #{prodTargetJsFile}"
                util.log message
                displayNotification message
                fs.unlink prodTargetCoffeeFile, (err) -> handleError(err) if err
                invoke 'uglify'         