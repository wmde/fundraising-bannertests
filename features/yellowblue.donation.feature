# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Checks wikimedia.de fundraising donation functionality in the yellowblue banner for Wikipedia

  Background:
    When I am on a random Wikipedia article page and provide a B15WMDE_ikea_prototype
    And The WMDE_Banner banner container is visible

  Scenario: Checks if the banner can be closed and the hidecookie is set
    When I reset the hide banner cookie centralnotice_wmde15_hide_cookie
    And I click the banner close button
    Then The WMDE_Banner banner should not be visible
    And The hide banner cookie centralnotice_wmde15_hide_cookie should be set

  Scenario: Checks if the form switches the interval options
    When I click the yellowblue regularly interval option
    Then The yellowblue regularly details should show

  Scenario Outline: Checks if the form submits the interval options correctly
    When I click the yellowblue regularly interval option
    And I click the yellowblue <interval> interval option
    And I click the yellowblue banner submit button
    Then The fundraising frontend shows
    And The <interval> interval should be selected

    Examples:
      | interval |
      | monthly |
      | quarterly |
      | semiyearly |
      | yearly |

  Scenario Outline: Checks if the form submits the selectable amount correctly
    When I select yellowblue banner deposit option
    And I select the yellowblue banner <amount> amount option
    And I click the yellowblue banner submit button
    Then The fundraising frontend shows
    And <result_amount> should show on the formpage as amount

    Examples:
      | amount | result_amount |
#      | 5,00 € | 5,00€ |
#      | 15,00 € | 15,00€ |
#      | 25,00 € | 25,00€ |
#      | 50,00 € | 50,00€ |
#      | 75,00 € | 75,00€ |
      | 100,00 € | 100,00€ |
      | 250,00 € | 250,00€ |

  Scenario: Checks if the form submits the free field amount correctly
    When I select yellowblue banner deposit option
    And I select the yellowblue banner Anderer Betrag amount option
    And I enter an random valid amount in the yellowblue other amount field
    And I click the yellowblue banner submit button
    Then The fundraising frontend shows
    And The given amount should show

  Scenario: Checks if the form shows the free field amount correctly
    When I select yellowblue banner deposit option
    And I select the yellowblue banner Anderer Betrag amount option
    Then The yellowblue other amount field should show

  Scenario Outline: Checks if the form submits the payment method correctly
    When I select yellowblue banner <payment_method> option
    And I select the yellowblue banner 100,00 € amount option
    And I click the yellowblue banner submit button
    Then The fundraising frontend shows
    And 100,00€ should show on the formpage as amount
    And The <payment_method> option should be selected

  Examples:
    | payment_method |
    | deposit |
    | debit |
    | credit |
    | paypal |