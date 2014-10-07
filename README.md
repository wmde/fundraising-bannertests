WikimediaBannerBrowserTests
====================
This directory contains the browser tests for Wikimedia Banners.

## Prerequisites
See prerequisites on [Browser Testing for Wikidata](https://www.mediawiki.org/wiki/Wikibase/Programmer%27s_guide_to_Wikibase#Browser_Testing_for_Wikidata).

OR follow these steps (Linux):

	\curl -L https://get.rvm.io | bash -s stable --ruby 
	source /home/USERNAME/.rvm/scripts/rvm && rvm
	
	gem update --system
	gem install bundler
	bundle install
	
	git clone https://github.com/wmde/fundraising-bannertests.git
	cd fundraising-bannertests
	bundle install	

## Configuration

Mediawiki URL

	MEDIAWIKI_URL: ""

## Executing tests

Update/install gems
```shell
bundle update
```

Run all tests
```shell
bundle exec cucumber
```

Run a specific feature
```shell
bundle exec cucumber features/banner.feature
```

Run a specific scenario (codeline)
```shell
bundle exec cucumber features/banner.feature:42
```

Run only tests with a specific tag
```shell
bundle exec cucumber --tag @foo_bar
```

## Executing tests on Sauce Labs

Uncomment Sauce Labs configuration in config.yml

Adjust Browser settings according to https://saucelabs.com/platforms/webdriver

Execute tests as seen above