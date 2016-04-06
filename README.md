# House
## Authors
* Eva Zhang
* Sam Khano

## Purpose

It will be easy for housemates to distribute tasks amongst one another and keep track of the cost of household items. 

## Features
* We will have a point system that keeps track of each person's completed tasks(total score), and will use that to determine your next task("harder" tasks will be given to people with lower scores)

* We will also have a Score Hierarchy and a "Garbage Bin", if you have negative points(not doing your tasks), you will be given a harsh task to complete.

* A tab with each person's balance of how money they spent on the house that month(resests every month) so that everyone can see how much you contribute on a monthly basis. 

* You can add household items that you purchased, or that the house needs.

## Control Flow
* Starting screen: Your tasks for today, followed by the rest for the week, and your balance.

* Summary Calender(another tab), which has all tasks(and the person who is assigned it) on a calender. 

* Another Tab: All items purchased that month, and all items needed to be bought in another tab, and then another tab for each person's balance for the month.

## Implementation
### Model
* PersonProfile(name, balance, score, tasks)
* Calender (all tasks)
* Task (has name and person and day of the week and frequency)
* PurcasedItems
* ItemsNeeded
* ScoreChart

### View
* ScoreChartViewController
* CalenderViewController
* AddTaskItemViewController
* AddPurchasedItemViewController
* AddNeededItemViewController

### Controller

PersonProfileTableViewController(name, balance, score, tasks)
* Calender.... (all tasks)
* TaskTableViewController (has name and person and day of the week and frequency)
* PurcasedItemsTableViewController
* ItemsNeededTableViewController
* ScoreHierarchyTableViewController
