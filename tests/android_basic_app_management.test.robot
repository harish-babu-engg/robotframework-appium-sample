*** Settings ***
Documentation  Android Basic Interactions
Resource  ../resources/resource.robot
Test Teardown  Close Application

*** Test Cases ***
Clear application
  Open Android Test App  .app.SearchInvoke
  &{vars}=  Create Dictionary   appId='io.appium.android.apis'
  Execute Script  mobile: clearApp  &{vars}

