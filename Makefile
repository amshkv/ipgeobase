install:
	bundle install

lint:
	bundle exec rake rubocop

test:
	bundle exec rake test

.PHONY: test
