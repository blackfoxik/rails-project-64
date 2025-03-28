render-build:
  set -o errexit
  bundle lock --add-platform x86_64-linux
  bundle install
  bundle exec rake assets:precompile
  bundle exec rake assets:clean
  ./node_modules/.bin/esbuild app/javascript/*.* --bundle --outdir=app/assets/builds
  ./node_modules/.bin/tailwindcss -i ./app/assets/stylesheets/application.tailwind.css -o ./app/assets/builds/application.css
  bundle exec rake db:migrate

render-start:
	bundle exec puma -t 5:5 -p ${PORT} -e ${RACK_ENV}

start:
	rm -rf tmp/pids/server.pid
	bin/rails s -b 0.0.0.0

setup:
	bin/setup
	bin/rails db:reset
	bin/rails db:fixtures:load

install:
	bundle check || bundle install

db-prepare:
	bin/rails db:reset
	bin/rails db:fixtures:load

test:
	bin/rails test

lint:
	bundle exec rubocop
	bundle exec slim-lint app/views/

lint-fix:
	bundle exec rubocop -A

.PHONY: install lint test
