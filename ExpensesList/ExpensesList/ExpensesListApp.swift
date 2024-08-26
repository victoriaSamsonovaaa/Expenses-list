//
//  ExpensesListApp.swift
//  ExpensesList
//
//  Created by Victoria Samsonova on 26.08.24.
//

import SwiftUI
import SwiftData

@main
struct ExpensesListApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Expense.self)
    }
}
