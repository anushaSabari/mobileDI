# Groceries [![Build Status]
Groceries is a NativeScript-built iOS  app for managing grocery lists. You can learn how to build a version of this app from scratch

## Version
9.1 or later

## Build and Runtime Requirements
swift 4
+ Xcode 9.2 or later
+ iOS 8.0 or later
+ OS X v110.12.2 or later
## Frameworks

The GroceryList app was built partly as a "real world" demonstration of several
frameworks, including:

*UI KIT FRAMEWORK
FOUNDATATION FRAMEWORK

## Third party Libraries
alamofire for api integration taken through pods

mb progresshud from github
### List Format

The grocery list repository follows a fairly simple structure. Each grocery
store is represented by a text file of the same name, and those files contain
newline-separated lists of grocery items.
## Using the App

GroceryList is a personal project, not an App Store-quality
download. To actually _use_ it, and share your list with specific people, there
are a few hoops you'll need to jump through first.

Before anything else, make sure to run `script/bootstrap` in your local copy of
the repository. This will automatically clone all submodules used in the
project.

### Distribution

The most straightforward way to get up and running with your customized version
of the app is to build it directly to the device of anyone interested in sharing
your grocery list.
