# Homies
## Authors
* Eva Zhang
* Sam Khano

## Purpose

It will be easy for housemates to distribute tasks amongst one another and keep track of the cost of household items. 

## Features
* We will have a point system that keeps track of each person's completed tasks(total score), and will use that to determine your next task("harder" tasks will be given to people with lower scores)

* We will also have a Score Hierarchy and a "Garbage Bin", which consists of the lowest scoring individual in the house, who will be given a random task by the other people in the house.

* A tab with each person's balance of how money they spent on the house that month(resests every month) so that everyone can see how much you contribute on a monthly basis. 

* You can add household items that you purchased, or that the house needs.

## Control Flow
* Starting screen: A summary Calender tab, which has all tasks(and the person who is assigned it) for the week and the month. 

* Second Tab: All items purchased that month, and all items needed to be bought in another tab

* Third Tab: Score chart with everyone's score, ranked by the top scores. There is also a trash icon on the top right that will take you to the "Garbage Bin", which displays the person with the lowest score.

* Fourth Tab: Current user profile, consisting of the tasks completed and the items bought for the house.

## Implementation
### Model
* Task
* User
* House

### View
* GarbageBinView

### TableViewController(name, balance, score, tasks)
* TasksTableViewController
* AddTaskViewController
* HouseItemsTableViewController
* AddHouseItemViewController
* RegisterHouseViewController
* RegisterUserViewController
* StatsTableViewController
* ProfileTableViewController

