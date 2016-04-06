Heading 1: House
Heading 2: Authors
* Eva Zhang
* Sam Khano
Heading 2: Purpose
Raw Text: It will be easy for housemates to distribute tasks amongst one another and keep track of the cost of household items. 
Heading 2: Features
* We will have a point system that keeps track of each person's completed tasks(total score), and will use that to determine your next task("harder" tasks will be given to people with lower scores)

* We will also have a Score Hierarchy and a "Garbage Bin", if you have negative points(not doing your tasks), you will be given a harsh task to complete.

* A tab with each person's balance of how money they spent on the house that month(resests every month) so that everyone can see how much you contribute on a monthly basis. 

* You can add household items that you purchased, or that the house needs.

Heading 2: Control Flow
* Starting screen: Your tasks for today, followed by the rest for the week, and your balance.

* Summary Calender(another tab), which has all tasks(and the person who is assigned it) on a calender. 

* Another Tab: All items purchased that month, and all items needed to be bought in another tab, and then another tab for each person's balance for the month.

Heading 2: Implementation
Heading 3: Model
* PersonProfile(name, balance, score, tasks)
* Calender (all tasks)
* Task (has name and person and day of the week and frequency)
* PurcasedItems
* ItemsNeeded
* ScoreChart

Heading 3: View
* ScoreChartViewController
* CalenderViewController
* AddTaskItemViewController
* AddPurchasedItemViewController
* AddNeededItemViewController

Heading 3: Controller

PersonProfileTableViewController(name, balance, score, tasks)
* Calender.... (all tasks)
* TaskTableViewController (has name and person and day of the week and frequency)
* PurcasedItemsTableViewController
* ItemsNeededTableViewController
* ScoreHierarchyTableViewController
