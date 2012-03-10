test:
	@NODE_ENV=test NODE_PATH=lib:spec/server \
		./node_modules/.bin/mocha \
		--require ./spec/server/helper \
		--reporter list \
		spec/server/**/*.coffee

.PHONY: test test-web
