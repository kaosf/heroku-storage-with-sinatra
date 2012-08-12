exit if ARGV.size < 1

appname = ARGV[0]
system "mkdir #{appname}"
File.open "#{appname}/config.ru", 'w' do |f|
  f.puts "require 'sinatra'"
  f.puts "run Sinatra::Application"
end
File.open "#{appname}/Gemfile", 'w' do |f|
  f.puts "source :rubygems"
  f.puts "gem 'sinatra'"
end
File.open "#{appname}/Procfile", 'w' do |f|
  f.puts "web: bundle exec rackup -p $PORT"
end
system "mkdir #{appname}/public"
commit_message = ARGV[1] || 'init'
system "cd #{appname}; " +
       "bundle install; " +
       "git init; " +
       "git add .; " +
       "git ci -m '#{commit_message}'; " +
       "heroku create #{appname}; " + # ここでコケた場合どうするのか考慮してない
       "heroku ps:scale web=1"
