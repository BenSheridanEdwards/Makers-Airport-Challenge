### [Makers Academy](http://www.makersacademy.com) - Week 1 Weekend Project

Airport Challenge 
-

[Outline](#Outline) | [Task](#Task) | [Installation Instructions](#Installation) | [Feature Tests](#Feature_Tests) | [User Stories](#Story) | [Objects & Methods](#Methods) |


## <a name="Outline">Outline</a>
 
We've had a request to write the software to control the flow of planes at an airport. The planes can land and take off provided that the weather is sunny. Occasionally it may be stormy, in which case no planes can land or take off.

## <a name="Task">Makers Task</a>
"The task is to test drive the creation of a set of classes/modules to satisfy all the below user stories. You will need to use a random number generator to set the weather (it is normally sunny but on rare occasions it may be stormy). In your tests, you'll need to use a stub to override random weather to ensure consistent test behaviour.

Your code should defend against edge cases such as inconsistent states of the system ensuring that planes can only take off from airports they are in; planes that are already flying cannot take off and/or be in an airport; planes that are landed cannot land again and must be in an airport, etc.

For overriding random weather behaviour, please read the documentation to learn how to use test doubles: https://www.relishapp.com/rspec/rspec-mocks/docs . There’s an example of using a test double to test a die that’s relevant to testing random weather in the test.

Please create separate files for every class, module and test suite.

In code review we'll be hoping to see:

All tests passing
High Test coverage (>95% is good)
The code is elegant: every class has a clear responsibility, methods are short etc.
Reviewers will potentially be using this code review rubric. Referring to this rubric in advance will make the challenge somewhat easier. You should be the judge of how much challenge you want this weekend."

## <a name="Installation">Installation Instructions</a>

Clone the repository from github then change directory into it. Then load dependencies with bundle.

```
$ git clone git@github.com:BenSheridanEdwards/Makers-Airport-Challenge.git
$ cd Makers-Airport-Challenge
$ gem install bundle #Skip this step if you already have bundle installed
$ bundle
```

## <a name="Story">User Stories</a>

```
As an air traffic controller 
So I can get passengers to a destination 
I want to instruct a plane to land at an airport

As an air traffic controller 
So I can get passengers on the way to their destination 
I want to instruct a plane to take off from an airport and confirm that it is no longer in the airport

As an air traffic controller 
To ensure safety 
I want to prevent landing when the airport is full 

As the system designer
So that the software can be used for many different airports
I would like a default airport capacity that can be overridden as appropriate

As an air traffic controller 
To ensure safety 
I want to prevent takeoff when weather is stormy 

As an air traffic controller 
To ensure safety 
I want to prevent landing when weather is stormy 
```

## <a name="Methods">Objects & Methods</a>

### Airport

| Methods        | Description                                            |
|----------------|--------------------------------------------------------|
| | |

### Plane

| Methods        | Description                                            |
|----------------|--------------------------------------------------------|
| | |

### Weather

| Methods        | Description                                            |
|----------------|--------------------------------------------------------|
| | |
