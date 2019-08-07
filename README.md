# OpenBanking API Test Automation 

Same throughout comparision between different API automation frameworks has been done by third parties which we can leverage to select the most suitable frameworks based on below criteria
* **Simplicity**: low entry barrier, human (not just developer) friendly, least effort
* **Comprehensiveness**: ideally the selected framework should support performance test and / or mocking of service
* **Cost**: should be completely free and / or open-source


The selected framework details are below
* **Base tool**: Intuit Karate
* **BDD**: Cucumber (Gherkin) 
* **Backend**: Java
* **Build tool**: Maven
* **IDE**: Intellij or any Java-supporting IDE 

__Reference__

* [9 great open-source API testing tools: How to choose](https://techbeacon.com/app-dev-testing/9-great-open-source-api-testing-tools-how-choose)

* [Intuit Karate versus REST Assured](https://docs.google.com/document/d/1ETTrdMVcBXaPjdKY-_67zCWBsi2Ctc5DIQUIfr02H7A/edit)


## Getting started

### Hello World
1. Install Java, Git, Maven (if have not done so)
2. Create a new Git repo for each API  test suite and clone to your local machine
3. Running below command to scaffold the test suite

    ```
    mvn archetype:generate \
    -DarchetypeGroupId=com.intuit.karate \
    -DarchetypeArtifactId=karate-archetype \
    -DarchetypeVersion=[0.9.4 or the most suitable version at reading time] \
    -DgroupId=[your group Id e.g. com.mycompany] \
    -DartifactId=[your artifact Id e.g. sample-api-test-automation]
    ```
    Or if you prefer working with GUI

    ![Create a new project from maven archetype](images/quick-start-1.png "Create a new project from maven archetype") 
    ![Enter group & artifact Id](images/quick-start-2.png "Enter group & artifact Id") 

4. Once sample test suite is created, right click on the test suite and hit `Run`. Alternatively, you can run each `.feature` (normally for 1 test scenario)

    ![Hello World!](images/karate-hello-world.jpg "Hello World!") 



### Folder Structure

![Folder Structure](images/folder-structure.jpg "Folder Structure") 

All Git and IDE related folders / files (.idea, .git, *.iml) can be safely ignored. The focus is on `src/test/java` (referring to the annotation in above image)

1. `*.feature` is where you define test script using Given When Then format
2. Test scenario runner is a Java / Kotlin class which enable running `*.feature` via mvn command and by CI server. 
    * The advantage as compare to Cucumber is that no step definition is needed.
3. Test case runner is similar to test scenario runner but it's supposed to run all `*.feature` in sub-folders
4. `karate-config.js` is where you define variables for environments, API key, Auth header etc. which then can be passed in to mvn command at run time. This externalize all environment config & credentials from checked in code and only be made available at run time.



## CI or Command Line Testing

Given `env` & `authPassword` are defined in `karate-config.js`, below command can be invoked manually or by CI server to execute the entire test suite

```
mvn clean test -Dkarate.env="dev" -DauthPassword=<enter Authcode here>"
```


Particular feature file can be invoke using below command, given Cucumber options are configured in test runner files
```
mvn clean test -Dcucumber.options="src/test/java/examples/users/users.feature" -Dkarate.env="qat" "-DauthPassword=<enter Authcode here>"
```  


