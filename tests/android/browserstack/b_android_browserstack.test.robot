*** Settings ***
Resource  ../../../resources/resource.robot
Name    HWSuite 2

*** Test Cases ***

Clear application
  &{vars}=  Create Dictionary   appId='io.appium.android.apis'
  Execute Script  mobile: clearApp  &{vars}
