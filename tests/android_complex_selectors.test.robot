*** Settings ***
Documentation  Android Selectors
Resource  ../resources/resource.robot
Test Setup     Open Android Test App
Test Teardown  Close Application

*** Test Cases ***

Should find elements by Complex XPath
  Click element   xpath=//android.widget.TextView[@content-desc="Views"]
  Click Element   xpath=//android.widget.TextView[@content-desc="Expandable Lists"]
  Click Element   xpath=//android.widget.TextView[@content-desc="3. Simple Adapter"]
  Click Element   xpath=//android.widget.TextView[@resource-id="android:id/text1" and @text="Group 0"]
  # Complex XPath.  Xpaths that start with (// is only parsed when prefixed by xpath=
  @{elements}  get webelements  xpath=(//android.widget.TextView[@resource-id="android:id/text2"])[1]
  length should be  ${elements}  1