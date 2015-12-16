# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Checks wikimedia.de fundraising donation functionality in the buttonbanner banner for Wikipedia

  Background:
    When I am on a random Wikipedia article page and provide a B15WMDE_30_151211_buttons
    And The WMDE_Banner banner container is visible

  Scenario: Checks if the banner can be closed and the hidecookie is set
    When I reset the hide banner cookie centralnotice_wmde15_hide_cookie
    And I click the banner close button
    Then The WMDE_Banner banner should not be visible
    And The hide banner cookie centralnotice_wmde15_hide_cookie should be set

  Scenario: Checks if the form switches the interval options
    When I click the buttonbanner regularly interval option
    Then The buttonbanner regularly details should show

  Scenario Outline: Checks if the form submits the interval options correctly
    When I click the buttonbanner field-amount_total_6 amount option
    And I click the buttonbanner regularly interval option
    And I click the <interval> interval option
    And I click the buttonbanner deposit option
    Then The fundraising frontend shows
    And The <interval> interval should be selected

    Examples:
      | interval |
      | monthly |
      | quarterly |
      | semiyearly |
      | yearly |

  Scenario: Checks if the low amount warning shows
    When I click the buttonbanner deposit option
    Then The low amount alert shows

  Scenario: Checks if the low amount warning blocks the form
    When I click the buttonbanner deposit option
    And I confirm the low amount alert
    Then The WMDE_Banner banner container is visible

  Scenario Outline: Checks if the form submits the selectable amount correctly
    And I click the buttonbanner <amount> amount option
    When I click the buttonbanner deposit option
    Then <result_amount> should show on the formpage as amount

    Examples:
      | amount | result_amount |
#      | field-amount_total_1 | 5,00€ |
#      | field-amount_total_2 | 15,00€ |
#      | field-amount_total_3 | 25,00€ |
#      | field-amount_total_4 | 50,00€ |
#      | field-amount_total_5 | 75,00€ |
      | field-amount_total_6 | 100,00€ |
      | field-amount_total_7 | 250,00€ |

  Scenario: Checks if the form submits the free field amount correctly
    When I enter an random valid amount in the buttonbanner other amount field
    And I click the buttonbanner deposit option
    Then The fundraising frontend shows
    And The given amount should show

  Scenario Outline: Checks if the form submits the payment method correctly
    When I click the buttonbanner field-amount_total_6 amount option
    When I click the buttonbanner <payment_method> option
    Then The fundraising frontend shows
    And 100,00€ should show on the formpage as amount
    And The <payment_method> option should be selected

    Examples:
      | payment_method |
      | deposit |
      | debit |
      | credit |
      | paypal |