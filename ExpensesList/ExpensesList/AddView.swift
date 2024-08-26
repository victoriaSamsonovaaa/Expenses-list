//
//  AddView.swift
//  ExpensesList
//
//  Created by Victoria Samsonova on 26.08.24.
//

import SwiftUI
import SwiftData

struct AddView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var value = 0.0
    let types = ["Business", "Personal"]
    @State private var showAtt = false

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)

                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }

                TextField("Value", value: $value, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    let newExp = Expense(name: name, type: type, value: value)
                    if isVAlid(exp: newExp) {
                        modelContext.insert(newExp)
                        dismiss()
                    }
                    else {
                        showAtt = true
                    }
                }
            }
            .alert("You can't add empty expense!", isPresented: $showAtt) {
                Button("Got it", role: .cancel) { }
            }
            .navigationBarBackButtonHidden()
        }
    }
    
    func isVAlid(exp: Expense) -> Bool {
        if exp.name == " " || exp.name.isEmpty {
            return false
        }
        else {
            return true
        }
    }
}

#Preview {
    AddView()
}
