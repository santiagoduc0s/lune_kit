lint:
	dart fix --apply
	dart format .
	flutter analyze

dev:
	cp -f environments/dev/env.json env.json

stg:
	cp -f environments/stg/env.json env.json

prod:
	cp -f environments/prod/env.json env.json