# Expenses list

Expense tracker app built with SwiftUI and SwiftData. The app allows users to add, view, sort, and filter their expenses. 

- `SwiftData`: A framework for managing and persisting data in Swift apps.
- `SortDescriptor`: A type that describes how to sort a sequence of values.
- `@Query`: A property wrapper type that fetches data from a SwiftData model context and updates a view whenever the data changes. In this case we filter expenses by type (all, personal, or business)


`MainView`: The main view of the application, which displays the list of expenses and the navigation bar.
`ExpenseView`: A subview that displays the list of expenses. Uses a @Query property to fetch the expenses from the database, and it uses a ForEach loop to display each expense as a row in the list.
`AddView`: A subview that allows the user to add a new expense. It uses a Form to display the input fields, and it uses a @StateObject property to manage the state of the view.
`AddViewViewModel`: A view model that manages the state of the AddView. It defines the properties for the name, type, and value of the expense, and it defines a method for saving the expense to the database.

### Users are able to:
* Add new expenses with a name, type (personal or business), and value
* View a list of expenses with their name, type, and value. Also there is a color differentiation depending on value of an expense.
* Sort expenses by name or value. It is created using sort descriptors
* Filter expenses by type (all, personal, or business). It is handled by filtering @Query
* Edit and delete expenses using .onDelete and EditButton()

