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
    
    @StateObject var viewModel = AddViewViewModel()    

    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $viewModel.name)

                Picker("Type", selection: $viewModel.type) {
                    ForEach(viewModel.types, id: \.self) {
                        Text($0)
                    }
                }

                TextField("Value", value: $viewModel.value, format: .currency(code: Locale.current.currency?.identifier ?? "USD"))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar {
                Button("Save") {
                    viewModel.save(name: viewModel.name, type: viewModel.type, value: viewModel.value, modelContext: modelContext, dismiss: dismiss)
                }
            }
            .alert("You can't add empty expense!", isPresented: $viewModel.showAtt) {
                Button("Got it", role: .cancel) { }
            }
            .navigationBarBackButtonHidden()
        }
    }
    
}

#Preview {
    AddView()
}
