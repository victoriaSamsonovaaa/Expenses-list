//
//  ContentView.swift
//  ExpensesList
//
//  Created by Victoria Samsonova on 26.08.24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query var expenses: [Expense]
    
    @State private var showingAddScreen = false
    @State private var expType = "All"
    let types = ["All", "Business", "Personal"]
    @State private var order = [
        SortDescriptor(\Expense.name),
        SortDescriptor(\Expense.value)
    ]
    
    @State private var path = [Expense]()
    
    var body: some View {
        NavigationStack(path: $path) {
            ExpenseView(sortOrder: order, type: expType)
            .navigationTitle("Expenses")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Menu("Sort", systemImage: "arrow.up.arrow.down") {
                        Picker("Sort", selection: $order) {
                            Text("Sort by Name")
                                .tag([
                                    SortDescriptor(\Expense.name),
                                    SortDescriptor(\Expense.value)
                                ])
                            
                            Text("Sort by price")
                                .tag([
                                    SortDescriptor(\Expense.value),
                                    SortDescriptor(\Expense.name)
                                ])
                        }
                    }
                }
                ToolbarItem(placement: .topBarLeading) {
                    Menu("filter", systemImage: "line.3.horizontal.decrease.circle") {
                        Picker("filter", selection: $expType) {
                            ForEach(types.indices, id: \.self) {
                                Text(types[$0]).tag(types[$0])
                            }
                        }
                    }
                }
                
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button("Add expense", systemImage: "plus") {
                        showingAddScreen.toggle()
                    }
                }

                ToolbarItem(placement: .topBarTrailing) {
                    EditButton()
                }
           }
            .sheet(isPresented: $showingAddScreen) {
                AddView()
            }
        }
    }
}

#Preview {
    ContentView()
}


// UUID – short for “universally unique identifier”,

//Classes that use @Observable can be used in more than one SwiftUI view, and all of those views will be updated when the properties of the class change. it will only update those views if they actually used the properties that changed.

//@Observable
//class Expenses {
//    var items = [ExpenseItem]() {
//        didSet {
//            if let encoded = try? JSONEncoder().encode(items) {
//                UserDefaults.standard.set(encoded, forKey: "Items")
//            }
//        }
//    }
//    init() {
//        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
//            if let decodedItems = try? JSONDecoder().decode([ExpenseItem].self, from: savedItems) {
//                items = decodedItems
//                return
//            }
//        }
//    }
//}
