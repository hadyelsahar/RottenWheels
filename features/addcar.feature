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
  
  And I am on add car page
  
Scenario: cant add car when not signed in and redirect to sign in page
  Then I should not see "New car"
  And I should see "Sign in"

Scenario: successfully add a car 

 Given I am not authenticated
 And I am a new, authenticated user
 And I am on add car page
 And I fill in "car_comment" with "this is an old car"
 And I fill in "car_mark" with "fiat"
 And I fill in "car_model" with "128"
 And I fill in "car_price" with "12000"
 When I press "Create Car"
 Then I should see "Car was successfully created."


  

