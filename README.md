# API Party!

The program entitled `request.rb` is a basic program that utilizes option parser to gather data from a third party API (Pokéapi) AND very simple Rails API for Pokemon types (https://pokemon-types.herokuapp.com/types) to generate a Poke Report.  Your Poke Report will include data about a Pokemon you request and what other types of Pokemon it is and is not suited to battle.

## Getting Started

The instructions below will help you retrieve a copy of the project to run on your local machine through the Terminal application. Please see deployment for notes on how to deploy the project on a live system.  The instructions provided are for macbook users only.

### Prerequisities

You may need to install or update the following software.

Find Terminal - to run program
  1. Open Finder. Finder is available in the Dock.
  2. Select Applications from the side bar menu.  Then unfold the Utilities folder.
  3. Double click on Terminal to initialize.

Install Homebrew - to store program files properly
  1. Open up Terminal.
  2. Run```ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"```
  3. Run```brew doctor```

Install rbenv & ruby-build - to install and compile different versions of Ruby code language
  1. Open up Terminal
  2. Run```brew install ruby-build rbenv```
  3. Run```echo 'if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi' >> ~/.bash_profile```

Install ruby 2.3.1 - the latest version of Ruby
  1. Close and reopen Terminal.```rbenv install 2.3.1```
  2. After quite some time, run:```rbenv global 2.3.1```

Once you have completed the above installation processes your system is ready to launch the program!

## Deployment

Please complete the following procedure to run the program on a live system:
  1. Open Terminal.
  2. Change your directory to the one that which you would like to save this project. `$ cd folder_name`
  3. Then run the commands `$ git clone https://github.com/kteich88/api_party.git` and `$ cd api_party`
  3. To run the program, type `ruby request.rb -p id` (replacing 'id' with a desired Pokemon ID number).

## Built With

* Atom
* Redis

## Authors

* **Kristine Teichmann**

## Acknowledgments

* The Iron Yard - Durham

* Bryce Darling
