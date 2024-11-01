//
//  AddViewViewModel.swift
//  ExpensesList
//
//  Created by Victoria Samsonova on 1.11.24.
//

import Foundation
import SwiftData
import SwiftUI

class AddViewViewModel: ObservableObject {

    @Published var name = ""
    @Published var type = "Personal"
    @Published var value = 0.0
    @Published var showAtt = false
    let types = ["Business", "Personal"]
    
    func save(name: String, type: String, value: Double, modelContext: ModelContext, dismiss: DismissAction) {
        let newExp = Expense(name: name, type: type, value: value)
        if isVAlid(exp: newExp) {
            modelContext.insert(newExp)
            dismiss()
        }
        else {
            showAtt = true
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
