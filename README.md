# Laravel Command Line Gem

This gem is installed as a command line application and is used to manage web applications built with the Laravel PHP Framework. It can be difficult to remember all the processes you need to have running and can be time consuming to navigate to every different directory and start those processes. This app allows you to start everything you need with one command. Currently this app only runs on Linux.

## Installation

Clone the repository into an easy to access directory.

Navigate into the new cloned repository

And then execute:

    $ sudo rake install

(Make sure you have both Ruby and Rake installed on your system.)

Edit config.yml and put in the paths that correspond to where your Laravel code, ngrok, and docker-compose.yml file resides.

(ngrok is used to make your Laravel server publicly accessible.)

## Usage

After installation make sure you are still in the root of the app folder and execute:

    $ mw start

This will start your Laravel server, ngrok to publicly expose your app, a Queue listener, and open a new terminal where your code resides

Execute:

    $ mw -h

To see all available commands and options

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/erichie/mw-ruby-command-line-gem. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
