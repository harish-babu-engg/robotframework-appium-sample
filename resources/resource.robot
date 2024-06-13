*** Settings ***
Library  AppiumLibrary
Library  BuiltIn


*** Variables ***
${ANDROID_AUTOMATION_NAME}    UIAutomator2
${ANDROID_APP}                ${CURDIR}/../demoapp/ApiDemos-debug.apk
${ANDROID_PLATFORM_NAME}      Android
${ANDROID_PLATFORM_VERSION}   %{ANDROID_PLATFORM_VERSION=13}
${ANDROID_APP_PACKAGE}        io.appium.android.apis

# Browserstack Variables
${ANDROID_BS_AUTOMATION_NAME}     UIAutomator2
${ANDROID_BS_APP}                 bs://1b0a7bc4a4aa38e5ddde91a5428871e5c9b54f9e
${ANDROID_BS_PLATFORM_NAME}       Android
${ANDROID_BS_PLATFORM_VERSION}    %{ANDROID_PLATFORM_VERSION=13.0}
${ANDROID_BS_APP_PACKAGE}         io.appium.android.apis
${ANDROID_BS_USERNAME}            %{BSTACK_USERNAME=harish.babu}
${ANDROID_BS_ACCESS_KEY}          %{BSTACK_ACCESS_KEY=harish.babu.key}
${DEVICE_NAME}                    Google Pixel 7 Pro
${APPIUM_VERSION}                 2.4.1


${IOS_AUTOMATION_NAME}        XCUITest
${IOS_APP}                    ${CURDIR}/../demoapp/TestApp.app.zip
${IOS_PLATFORM_NAME}          iOS
${IOS_PLATFORM_VERSION}       %{IOS_PLATFORM_VERSION=13.6}
${IOS_DEVICE_NAME}            iPhone 8


*** Keywords ***
Open Android Test App
  [Arguments]    ${appActivity}=${EMPTY}
  open application  http://127.0.0.1:4723  automationName=${ANDROID_AUTOMATION_NAME}
  ...  app=${ANDROID_APP}  platformName=${ANDROID_PLATFORM_NAME}  platformVersion=${ANDROID_PLATFORM_VERSION}
  ...  appPackage=${ANDROID_APP_PACKAGE}  appActivity=${appActivity}

Open Android Test App on Browserstack
  [Arguments]    ${appActivity}=${EMPTY}
  &{vars}=  Create Dictionary   appiumVersion=${APPIUM_VERSION}
  open application  http://harishbabu_VuCbFD:FRgM7DmjtYCN9QwxkFRo@hub-cloud.browserstack.com/wd/hub
  ...  automationName=${ANDROID_BS_AUTOMATION_NAME}
  ...  app=${ANDROID_BS_APP}  platformName=${ANDROID_BS_PLATFORM_NAME}
  ...  platformVersion=${ANDROID_BS_PLATFORM_VERSION}
  ...  appPackage=${ANDROID_BS_APP_PACKAGE}  appActivity=${appActivity}  deviceName=${DEVICE_NAME}
  ...  bstack:options=&{vars}


Open iOS Test App
  open application  http://127.0.0.1:4723/wd/hub  automationName=${IOS_AUTOMATION_NAME}
  ...  app=${IOS_APP}  platformName=${IOS_PLATFORM_NAME}  platformVersion=${IOS_PLATFORM_VERSION}
  ...  deviceName=${IOS_DEVICE_NAME}