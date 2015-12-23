# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Check close functionality in banners for Wikipedia

  Background:

  Scenario: Checks if the banner stays closed when the hidecookie is set
    When I am on a random Wikipedia article page and provide a B15WMDE_bulb_prototype
    And The WMDE_Banner banner container is visible
    And I reset the hide banner cookie centralnotice_wmde15_hide_cookie
    And I click the banner close button
    And I am on a random Wikipedia article page and provide a B15WMDE_ikea_prototype
    And I wait 10 seconds
    Then The WMDE_Banner banner should not be visible

  Scenario: Checks if the banner shows again when the hidecookie value differs
    When I am on a random Wikipedia article page and provide a B15WMDE_bulb_prototype
    And The WMDE_Banner banner container is visible
    And I reset the hide banner cookie centralnotice_wmde15_hide_cookie
    And I click the banner close button
    And I am on a random Wikipedia article page and provide a B15WMDE_42_151222_ctrl
    Then The WMDE_Banner banner container should be visible