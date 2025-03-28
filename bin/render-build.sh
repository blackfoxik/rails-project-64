#!/usr/bin/env bash
# exit on error
# set -o errexit

# bundle install
# bundle exec rails assets:precompile
# bundle exec rails assets:clean
# bundle exec rake db:migrate
# bundle exec rake db:seed
#!/usr/bin/env bash

# exit on error

set -o errexit
bundle lock --add-platform x86_64-linux
bundle install
bundle exec rake assets:precompile
bundle exec rake assets:clean
./node_modules/.bin/esbuild app/javascript/*.* --bundle --outdir=app/assets/builds
./node_modules/.bin/tailwindcss -i ./app/assets/stylesheets/application.tailwind.css -o ./app/assets/builds/application.css
bundle exec rake db:migrate
bundle exec rake db:seed
