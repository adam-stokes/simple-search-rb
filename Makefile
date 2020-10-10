SEARCHTERM ?= life

build:
	docker build . -t simple-search-rb

check:
	docker run simple-search-rb bundle exec rake spec

run:
	docker run -e SEARCHTERM=$(SEARCHTERM) simple-search-rb bundle exec ruby eg/main.rb


.phony: check run build
all: check
