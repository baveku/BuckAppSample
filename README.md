# BuckSample
This repo shows how Airbnb builds its iOS applications using Buck. It is where we prototype new functionality with Buck before making changes to our internal repo. We hope you find it as useful as we do :smiley:

[![CircleCI](https://circleci.com/gh/airbnb/BuckSample/tree/master.svg?style=svg)](https://circleci.com/gh/airbnb/BuckSample/tree/master)

### To Install

```sh
# Install Buck
make install_buck
```

### To Change AppName
Open Makefile and change variable AppName
```sh
# Use local version of Buck
...
AppName=MyStartApp
...
```


Note: you may need to [install Java 8](https://www.oracle.com/technetwork/java/javase/downloads/jdk8-downloads-2133151.html) before `buck` will run for you locally.


### To Make SubModule
```bash
# Make Module
make module MODULE_NAME=STARTER
```
Change STARTER to your App Name

### Viewing Dependencies
You may run `buck query "deps(//App:ExampleAppBinary)" --dot > result.dot` to save Graphviz output of the dependency tree starting at the rule `//App:ExampleAppBinary`. You may then run `dot -Tpng result.dot -o result.png` to create a PNG image showing this dependency structure.

<img src="https://github.com/airbnb/BuckSample/raw/master/Docs/DependencyGraph.png" />

### Generating an Xcode Project
To generate the project from the terminal, just run `make project`. You can then run in the simulator or press `Cmd + U` to run the tests.

You may also use breakpoints, just like normal when using the generated Xcode project.

<img src="https://github.com/airbnb/BuckSample/raw/master/Docs/Breakpoint.png" width=500 />

### CLI

```bash
# generating and opening a Xcode project
make project

# building with Buck CLI
make debug
```

### References
1. https://github.com/airbnb/BuckSample/blob/master/Pods/BUCK gives a few examples on how we build CocoaPods with Buck
1. https://github.com/airbnb/BuckSample/blob/master/App/BUCK is the main build file which shows how we setup resources/assets and build the final binary/ipa file.
1. https://www.youtube.com/watch?v=8OF7L3SdY5U "Fast reliable Swift builds with Buck" - Robbert van Ginkel
1. https://www.youtube.com/watch?v=uvNI_E0ZgZU "Ludicrously Fast Builds with Buck" - Simon Stewart

Buck Build channel https://buckbuild.slack.com.
