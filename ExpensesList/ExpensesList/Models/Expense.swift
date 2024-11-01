//
//  Expense.swift
//  ExpensesList
//
//  Created by Victoria Samsonova on 26.08.24.
//

import Foundation
import SwiftData

@Model
class Expense {
    var id = UUID()
    var name: String
    var type: String
    var value: Double
    
    init(id: UUID = UUID(), name: String, type: String, value: Double) {
        self.id = id
        self.name = name
        self.type = type
        self.value = value
    }
}
