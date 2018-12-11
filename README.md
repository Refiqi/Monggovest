# Monggovest App
 [![license](https://img.shields.io/github/license/mashape/apistatus.svg)]()
 Web based Investing Application
- Languages : Ruby, Framework : Rails
- Database: Postgresql
- Authentication: Devise,JWT token with knock
- Control Management system: Rails admin

# Pre
    Ruby version 2.5.0 or higher
    Postgresql
    Bundler
    Rails

# Run Local

    git clone <url repo> | Clone this repo
    bundle install | Install gem
    rake db:create | Create database
    rake db:migrate | Create migration
    rails server | Running rails server in localhost
    running at http://localhost:3000

# Run Local Rubocop


    bundle exec rubocop <your_file> [options]
    [options] : Auto Correct = -a

# Run Local RSpec


    bundle exec rspec
    You can see the Coverage Testing in folder /coverage/index.html you can open it in browser

# Run Local Admin interface


    http://localhost:3000/api/v1/admin
    Register first From the API To Assign role to admin, so that you can access the rails admin.

# Author
Refiqi Muhamad Fadila | refyfadhila96@gmail.com