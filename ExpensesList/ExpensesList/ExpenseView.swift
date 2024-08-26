//
//  ExpenseView.swift
//  ExpensesList
//
//  Created by Victoria Samsonova on 26.08.24.
//

import SwiftUI
import SwiftData

struct ExpenseView: View {
    @Environment(\.modelContext) var modelContext
    @Query var expenses: [Expense]
    init(sortOrder:[SortDescriptor<Expense>], type: String) {
        if type == "All" {
            _expenses = Query(sort: sortOrder)
        }
        else {
            _expenses = Query(filter: #Predicate<Expense> { expense in
                expense.type == type
            }, sort: sortOrder)
        }
    }
    
    var body: some View {
        List {
            ForEach(expenses) { item in
                HStack {
                    VStack(alignment: .leading) {
                        if item.value > 0 && item.value < 20 {
                            Text(item.name)
                               .foregroundStyle(.pink)
                               .font(.headline)
                            Text(item.type)
                        }
                        else if item.value > 10 && item.value < 100 {
                            Text(item.name)
                                .foregroundStyle(.blue)
                                .font(.headline)
                            Text(item.type)
                        }
                        else {
                          Text(item.name)
                            .foregroundStyle(.green)
                            .font(.headline)
                        Text(item.type)
                        }
                    }
                    Spacer()
                    Text(item.value, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                }
            }
            .onDelete(perform: removeItems)
        }
    }
    
    func removeItems(at offsets: IndexSet) {
        for offset in offsets {
            let exp = expenses[offset]
            modelContext.delete(exp)
        }
    }
}

#Preview {
    ExpenseView(sortOrder: [SortDescriptor(\Expense.name)], type: "Personal")
        .modelContainer(for: Expense.self)
}
