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

    def start_mw_server
      Dir.chdir("#{Dir.home}")
      Dir.chdir("#{@@config[:docker_path]}")
      system 'gnome-terminal -e "docker-compose up -d"'
    end

    def start_queue
      Dir.chdir("#{Dir.home}")
      Dir.chdir("#{@@config[:docker_path]}")
      system 'docker-compose exec workspace bash -c "php artisan queue:listen"'
    end

    def start_ngrok
      Dir.chdir("#{Dir.home}")
      Dir.chdir("#{@@config[:ngrok_path]}")
      system 'gnome-terminal -e "./ngrok http 8000"'
    end

    def open_directory
      Dir.chdir("#{Dir.home}")
      Dir.chdir("#{@@config[:mw_path]}")
      system 'gnome-terminal'
    end

    def vagrant_start
      Dir.chdir("#{Dir.home}")
      puts Dir.pwd
      Dir.chdir("#{@@config[:vagrant_path]}")
      system 'vagrant up'
    end

    def vagrant_intialize
      Dir.chdir("#{Dir.home}")
      Dir.chdir("#{@@config[:vagrant_path]}")
      system 'vagrant ssh -- -t "cd Code/mw; php artisan migrate; php artisan db:seed"'
    end

    def vagrant_queue
      Dir.chdir("#{Dir.home}")
      Dir.chdir("#{@@config[:vagrant_path]}")
      system 'echo Starting Queue...'
      system 'echo Queue Running...; echo ""'
      system 'vagrant ssh -- -t "cd Code/mw; php artisan queue:listen --tries=1"'
    end
  end
end
