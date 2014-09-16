WikimediaBannerBrowserTests
====================
This directory contains the browser tests for Wikimedia Banners.

## Prerequisites
See prerequisites on [Browser Testing for Wikidata](https://www.mediawiki.org/wiki/Wikibase/Programmer%27s_guide_to_Wikibase#Browser_Testing_for_Wikidata).

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



                    <ul class="horizontal clearfix amount-list">
                      <li class="first">
                        <input type="radio" id="amount-1" name="betrag_auswahl" value="5" title="5&euro;" checked>
                        <label for="amount-1">5&euro;</label>
                      </li>

                      <li>
                        <input type="radio" id="amount-2" name="betrag_auswahl" value="15" title="15&euro;">
                        <label for="amount-2">15&euro;</label>
                      </li>

                      <li>
                        <input type="radio" id="amount-3" name="betrag_auswahl" value="25" title="25&euro;">
                        <label for="amount-3">25&euro;</label>
                      </li>

                      <li>
                        <input type="radio" id="amount-4" name="betrag_auswahl" value="50" title="50&euro;">
                        <label for="amount-4">50&euro;</label>
                      </li>

                      <li>
                        <input type="radio" id="amount-5" name="betrag_auswahl" value="75" title="75&euro;">
                        <label for="amount-5">75&euro;</label>
                      </li>

                      <li>
                        <input type="radio" id="amount-6" name="betrag_auswahl" value="100" title="100&euro;">
                        <label for="amount-6">100&euro;</label>
                      </li>

                      <li>
                        <input type="radio" id="amount-7" name="betrag_auswahl" value="250" title="250&euro;">
                        <label for="amount-7">250&euro;</label>
                      </li>

                      <li class="amount-custom last no-margin">
                        <div class="container" style="width: 100px;">
                          <input id="amount-8" name="betrag" type="text" value="" title="Betrag zwischen 1 und 99999,99 Euro; Komma als Dezimaltrenner" autocomplete="off" pattern="^[1-9]{1}\d{0,4}(?:,\d\d)?$">
                          <label class="right top" for="amount-8">&euro;</label>
                        </div>
                      </li>
                    </ul>