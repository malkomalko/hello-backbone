test:
	@NODE_ENV=test NODE_PATH=lib:spec \
		./node_modules/.bin/mocha \
		--require ./spec/helper \
		--reporter list \
		spec/**/*.coffee

.PHONY: test test-web
