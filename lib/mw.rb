require "mw/version"
require 'yaml'

module Mw
  class Middleware
    def initialize
      @@config = YAML::load_file 'config.yml'
    end

    def start_all
      start_mw_server
      start_queue
      start_ngrok
      open_directory
    end

    def start_all_vagrant
      vagrant_start
      start_ngrok
      open_directory
      vagrant_queue
    end

    def start_mw_server
      Dir.chdir("#{@@config[:mw_path]}")
      system 'gnome-terminal -e "php artisan serve"'
    end

    def start_queue
      Dir.chdir("#{@@config[:mw_path]}")
      system 'gnome-terminal -e "php artisan queue:listen --tries=1"'
    end

    def start_ngrok
      Dir.chdir("#{@@config[:ngrok_path]}")
      system 'gnome-terminal -e "./ngrok http 8000"'
    end

    def open_directory
      Dir.chdir("#{@@config[:mw_path]}")
      system 'gnome-terminal'
    end

    def vagrant_start
      Dir.chdir("#{@@config[:vagrant_path]}")
      system 'vagrant up'
    end

    def vagrant_intialize
      Dir.chdir("#{@@config[:vagrant_path]}")
      system 'vagrant ssh -- -t "cd Code/mw; php artisan migrate; php artisan db:seed"'
    end

    def vagrant_queue
      Dir.chdir("#{@@config[:vagrant_path]}")
      system 'echo Starting Queue...'
      system 'echo Queue Running...; echo ""'
      system 'vagrant ssh -- -t "cd Code/mw; php artisan queue:listen --tries=1"'
    end
  end
end
