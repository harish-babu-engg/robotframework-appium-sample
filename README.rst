############################################################
Appium Testing Sample with Robot Framework and AppiumLibrary
############################################################

AppiumLibrary_ is an appium testing library for `Robot Framework`_.
In this sample usage of the library, you can find ios and android test suites
that are ready to execute. Also you can find how the reports look like.

.. contents:: **Contents:**
   :depth: 1
   :local:

Downloading demo package
============================

To get the demo, you can either `download`_ the repository from GitHub or checkout
the `source code`_ directly.

Reports are available also online in `generated results`_.

Overview
============================
In this sample framework, you will find test cases for iOS and Android.
Test cases are written for sample applications under `demoapp`_ folder.

- Test suite for iOS and Android Locators
- Test suite for iOS and Android  Mobile Web Testing
- Test suite for iOS and Android  Basic Interactions
- Test suite for iOS and Android  Selectors

Generated results
============================
After `running tests`_ you will get report and log in HTML format. Example
files are also visible online in case you are not interested in running
the demo yourself:

- `report.html`_
- `log.html`_


Running Sample
==============

Preconditions
-------------

Install `Robot Framework`_ and `AppiumLibrary`_

The simplest way is using `pip`_ package manager::

  pip install -r requirements.txt


Device Setup
------------
After installing the library, you still need to setup an simulator/emulator or real device to use in tests.
iOS and Android have separate paths to follow, and those steps better explained in `Appium Driver Setup Guide`_.
Please follow the **Driver-Specific Setup** according to platform.


Running tests
-------------

Test cases are located in the ``tests`` folder. They can be
executed using the ``robot`` command::

    robot  tests/*.test.robot

You can also run an iOS or Android case file/test::

    robot tests/android_basic_interactions.test.robot
    robot --test "Should find elements by ID" tests

Test Suites - Setup & Teardown
==============================

Test suite can have setup and tear downs.  The ``tests/android`` directory shows hierarchical test suites that have multiple directories & files.  You could run a test using the command from inside the ``tests/android`` directory.
::
  
    robot --suite "Android Suite" .

This will ensure that that only test suite "Android Suite" runs.  Any Suite Setup & Teardowns from the current folder down will be run.  Setup & teardown of test suites at each level in the hierarchy will be run.


Running on Browserstack
=======================

Overview
--------
Browserstack is a cloud based shared device provider.  We can use Robot framework with Appium Library to run automation tests on the service.

Since it uses Appium with specific drivers to test, we can use the same method that we use for local testing, even with Browserstack.  There are a few Browserstack specific capabilities that needs to be modified to run the tests. 

Setup
-----

Setting Up App URL
++++++++++++++++++
A key change with Browserstack is the ``app`` parameter in the DesiredCapabilites.  Instead of a file path to your local application bundle, it should be a ``bs://`` scheme provided by Browserstack.  Upload your application to Browserstack and then copy the URL provided.  Use that in your resource script in Robot.  See ``Open Android Test App on Browserstack`` keyword in  `resource configuration <resources/resource.robot>`_ for an example of how to do this.

Setting up Accesss Keys
+++++++++++++++++++++++

Find the Browserstack username & access keys.  They can be found on the browserstack dashboard once you log in. On your terminal where you run the tests, export them as environment variables.
::

    export BSTACK_ACCESS_KEY=<browserstack-access-key>
    export BSTACK_USERNAME=<browserstack-username>

Once it is exported, you can run the tests in the manner presented above.
::

    robot tests/android_browserstack.test.robot

Using Appium v2.x
+++++++++++++++++

The default version of Appium that Browserstack uses is the latest version on the Appium 1.x tree (1.17 as of this writing).  2.4.1 is the latest version of Appium that is supported by Browserstack.  If you need to use this version, Browserstack expects certain options to be set in the DesiredCapabilities.  Refer to `this document to learn more <https://www.browserstack.com/docs/app-automate/appium/references/appium-2-migration-doc>`_.  The resource configuration on this project uses Appium version 2.4.1.


To-Do
=====
There are much more to improve, here is the list of things to come

- Circle.ci build pipeline
- SauceLabs Execution Support
- More coverage from library methods


.. _Robot Framework: http://robotframework.org
.. _Robot Framework User Guide: http://robotframework.org/robotframework/#user-guide
.. _Appium Driver Setup Guide: http://appium.io/docs/en/about-appium/getting-started/?lang=en
.. _AppiumLibrary: https://github.com/serhatbolsu/robotframework-appiumlibrary
.. _pip: http://pip-installer.org
.. _download: https://github.com/serhatbolsu/robotframework-appium-sample/archive/master.zip
.. _source code: https://github.com/serhatbolsu/robotframework-appium-sample.git
.. _demoapp: https://github.com/serhatbolsu/robotframework-appium-sample/tree/master/demoapp
.. _report.html: https://serhatbolsu.github.io/robotframework-appium-sample/docs/report.html
.. _log.html: https://serhatbolsu.github.io/robotframework-appium-sample/docs/log.html
