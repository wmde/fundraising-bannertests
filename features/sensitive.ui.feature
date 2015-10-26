# @licence GNU GPL v2+
# @author Christoph Fischer <christoph.fischer@wikimedia.de>

Feature: Checks wikimedia.de fundraising ui functionality in the sensitive banner for Wikipedia

  Background:
    When I am on a random Wikipedia article page and provide a B15WMDE_sensitive

  Scenario: Checks if the banner shows
    Then The WMDE_BannerFullForm should become visible

  Scenario: Checks if the form switches the interval options
    When WMDE_BannerFullForm becomes visible
    And I click the regularly interval option
    Then Regularly details shows