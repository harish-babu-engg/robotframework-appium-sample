*** Settings ***
Documentation  Common Suite
Resource  ../../../resources/resource.robot
Suite Setup   	Log     [Common Suite Setup]  	console=True
Suite Teardown  Log     [Common Suite Teardown]  	console=True
Name    New Hello World Suite
