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



