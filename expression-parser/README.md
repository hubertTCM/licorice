parse expression, to practice ruby. eg: 1 + 2 \* 3

https://stackoverflow.com/questions/37720892/you-dont-have-write-permissions-for-the-var-lib-gems-2-3-0-directory
sudo apt-get remove ruby
sudo snap install ruby --classic
gem install rubocop // Does not work zsh: command not found: rubocop
add `gem 'rubocop', require: false` to Gemfile, and run `bundle exec rubocop`
`bundle add dry-struct`

rubocop: https://marketplace.visualstudio.com/items?itemName=misogi.ruby-rubocop
rubocop file from: https://nextlinklabs.com/insights/our-rubocop-configuration-for-rails-development-projects
