#!/bin/bash

set -u

run_command() {
    local cmd="$1"
    echo -e "Running: $cmd"
    eval "$cmd"
}

# Update the package repo and install dependencies
run_command "sudo apt-get update"
run_command "sudo apt-get install -y libpq-dev libsqlite3-dev build-essential"

# Install Ruby and Ruby development tools
run_command "sudo apt-get install gnupg2"
run_command "\curl -sSL https://get.rvm.io | bash -s stable"
run_command "source ~/.rvm/scripts/rvm"
run_command "rvm install 3.1.2"
run_command "rvm use 3.1.2 --default"
#run_command "sudo apt-get install -y ruby ruby3.1-dev"  # Replace with your Ruby version as needed

# Install Bundler
run_command "gem install bundler"

# Clone the Dradis repository and set the bundler path
run_command "git clone https://github.com/dradis/dradis-ce.git"
run_command "bundle config set --local path '/opt/dradis-ce'"
run_command "git config --global --add safe.directory /home/vagrant/dradis-ce"

# Change to the Dradis project directory and run the setup script
run_command "cd dradis-ce/"
run_command "./bin/setup"
#run_command "export PATH='$HOME/.rvm/rubies/ruby-3.1.2/bin/ruby'"
