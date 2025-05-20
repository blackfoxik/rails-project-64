lint:
	bundle exec slim-lint app/views/
	bundle exec rubocop

lint_manual:
	./bin/rubocop
	