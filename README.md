How to setup Frank for MonoTouch
===============

## Prerequisite

It's assumed that you are familiar with [cucumber](http://cukes.info) and the concept of automated acceptance testing. Before we start, first make sure you have a proper ruby development environment and install the [Frank](http://www.testingwithfrank.com)-cucumber gem.

    $ sudo gem install frank-cucumber
    
## Frankify your application

Now open the project in Xamarin Studio and add a reference to MonoTouch.FrankAutomation. Open [main.cs](/samples/SimpleDrillDown/Main.cs), and add the following line right after all the namespace imports.

    [assembly:MonoTouch.FrankAutomation.Frankify]

Compile the app, and you will receive a warning stating "The referenced library 'MonoTouch.FrankAutomation.dll' is not used from any code, skipping extraction of content resources." That is because the FrankifyAttribute requires a conditional pre-processing symbol "ACCEPTANCE". Frank embeds a HTTP server in your application package in order to automate UI interactions. This is not always desired. To include this server in the compiled binary, you must define the missing symbol. Or a more flexible option is to add a new "Acceptance" configuration and leave "Debug" and "Release" untouched.

![define compiler symbol](/png/compiler-symbol.png)

Compile and run the app in the simulator. You should see some logs in the application output indicating that Frank iOS server has started. Open a browser window and navigate to http://localhost:37265. If everything worked as expected, you will see the Symbiote web app displaying a live view of your running iOS application. Your app is Frankified!

![symbiote](/png/symbiote.png)

## Acceptance testing

Add a new generic project to your solution. Open a new console window, navigate to the project's folder, and execute the following command

    $ frank setup

You will receive errors complaining that Frank can't find the xcode project in the destination folder. Ignore them because we are not a xcode project. We can safely delete all the generated files except the "features" folder. This is where the acceptance tests are kept. So add this folder to your project.

Then open [env.rb](/samples/SimpleDrillDown.AcceptanceTests/features/support/env.rb) and tell Frank where to find your compiled binary by modifying "APP_BUNDLE_PATH".

Next setup the project to execute the "cucumber" command when run.

![run cucumber](/png/cucumber-command.png)

Right-click on the project and select "Run Item". Voilà! Cucumber will run the generated sample tests. You will see your application loaded in the simulator and it will tilt a couple times. When it's all done, the console window will show you a summary of the test results. Go ahead now and you can begin writing new [tests](/samples/SimpleDrillDown.AcceptanceTests/features/navigation.feature) for your app using either the [build-in steps](http://www.testingwithfrank.com/supplied_steps.html) or [define your own](http://www.testingwithfrank.com/writing_steps.html).

