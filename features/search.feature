Feature: display cars using specific search criteria 

As a viewer
so i can quickly view cars i'm interested in 
I want to search car with specific criteria

Background: cars have been added to database

  Given the following cars exist:
  | mark     | model | cc   | kmpassed | centerlock | powersteering | abs   | automatic |
  | fiat     | 128   | 1300 | 15000    | true       | false         | true  | true      |
  | spranza  | 128   | 1400 | 16000    | true       | false         | true  | false     |
  | bmw      | 128   | 1500 | 17000    | true       | true          | true  | true      |
  | mercides | 128   | 1600 | 18000    | true       | false         | true  | true      |
  | bmw      | 128   | 1300 | 19000    | true       | false         | true  | false     |
  | cheeroki | 128   | 1400 | 20000    | true       | false         | false | true      |
  | mercides | 128   | 1500 | 21000    | true       | false         | true  | true      |
  | fiat     | 128   | 1600 | 22000    | true       | false         | true  | false     |
  
  And I am on the cars view page

Scenario: all cars are shown be default
Then I should see all cars

Scenario: search cars by make

 Given I fill in "mark" with "fiat"
 When I press "search"
 Then I should see 2 cars

Scenario: search cars by cc and make

 Given I fill in "ccmin" with "1550"
 And I fill in "mark" with "fiat"
 When I press "search"
 Then I should see 1 cars


  

