# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Checks wikimedia.de fundraising form functionality in banners for Wikipedia

  Background:
    When I am on a random Wikipedia article page and provide a B15WMDE_bulb_prototype
    And WMDE_Banner becomes visible

  Scenario: Checks if the banner can be closed and the hidecookie is set
    When WMDE_Banner becomes visible
    And I reset the hide banner cookie centralnotice_wmde15_hide_cookie
    And I click the banner close button
    Then The WMDE_Banner banner should not be visible
    And The hide banner cookie centralnotice_wmde15_hide_cookie should be set

  Scenario: Checks if the form switches the interval options
    And I click the regularly interval option
    Then The regularly details shows

  Scenario Outline: Checks if the form submits the interval options correctly
    When I click the banner amount75 amount option
    And I click the regularly interval option
    And I click the <interval> interval option
    And I click the banner deposit option
    Then The fundraising frontend shows
    And The <interval> interval should be selected

    Examples:
      | interval |
      | monthly |
      | quarterly |
      | semiyearly |
      | yearly |

  Scenario Outline: Checks if the form submits the payment method correctly
    When I click the banner amount75 amount option
    And I click the banner <payment_method> option
    Then The fundraising frontend shows
    And The <payment_method> option should be selected

  Examples:
    | payment_method |
    | deposit |
    | debit |
    | credit |
    | paypal |

  Scenario: Checks if the low amount warning shows
    When I click the banner deposit option
    Then The low amount alert shows

  Scenario: Checks if the low amount warning blocks the form
    When I click the banner deposit option
    And I confirm the low amount alert
    Then WMDE_Banner becomes visible

  Scenario Outline: Checks if the form submits the selectable amount correctly
    When I click the banner <amount> amount option
    And I click the banner deposit option
    Then The fundraising frontend shows
    And The <amount> amount should be selected

  Examples:
    | amount |
    | amount5 |
    | amount15 |
    | amount25 |
    | amount50 |
    | amount75 |
    | amount100 |
    | amount250 |

  Scenario: Checks if the form submits the free field amount correctly
    When I enter an random valid amount
    And I click the banner deposit option
    Then The fundraising frontend shows
    And The given amount should show