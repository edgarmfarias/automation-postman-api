## Automation Postman API

This project has been created as a part of the QA Yalo challenge and its purpose is to automate the API testing of the Postman API.

The test plan can be found [here](https://docs.google.com/document/d/1Ou-1JZlrWx6WJ-L29_sXmF_nPpM8houTU3zPHOSHuWE/edit?usp=sharing) 

### Project Structure
    src/test/java
       |
       +-- karate-config.js
       +-- ParallelTestRunner.java
       |
       \-- postman
           |
           \-- functional
           |   |
           |   +-- test.feature
           |   +-- ...
           |     
           \-- performance
           |   |
           |   +-- test.feature
           |   +-- ...
           |
           \-- security
               |
               +-- test.feature
               +-- ...
               
##### karate-config.js
Global karate configuration.
Timeouts, base URLs and values based on environment variables can be set here. Properties set in the config object are accessible from any feature file.

##### ParallelTestRunner.java
Point of entry for the execution of scenarios.
It scans the folder where it is located and all sub-folders, looking for feature files with scenarios marked with the tag(s) passed as command line arguments, if any.
It runs max 5 scenarios in parallel (configurable) and skips scenarios marked with the ignore tag.

##### postman folder
Contains all the test scenarios, organized in sub-packages, based on the type of testing.

##### functional folder
Contains all the test scenarios related to functional testing scenarios

##### performance folder
Contains all the test scenarios related to performance testing scenarios

##### Security folder
Contains all the test scenarios related to Security testing scenarios

### How to run it
The execution of the scenarios is triggered by gradle as follows:

##### All
To run all available scenarios, execute the command:

`./gradlew test`

##### Subset
An specific subset of scenarios can be run by adding a custom tag to them and then pass that tag as argument in the gradle command:

###### To run all scenarios with:

**@customTag**:

`./gradlew test -Dkarate.options="--tags @customTag"`

**@customTagA** and **@customTagB**:

`./gradlew test -Dkarate.options="--tags @customTagA --tags @customTagB"`

**@customTagA** and not **@customTagB**:

`./gradlew test -Dkarate.options="--tags @customTagA --tags ~@customTagB"`

### Rationale for choosing KarateDSL
The reasons about why Java and Karate were chosen for this project are explained in the [test plan](https://docs.google.com/document/d/1Ou-1JZlrWx6WJ-L29_sXmF_nPpM8houTU3zPHOSHuWE/edit?usp=sharing), section "APPENDIX: Automation tools assessment" 
