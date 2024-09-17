//
//  ContentView.swift
//  budget_play_6
//
//  Created by Ryan on 8/7/24.
//

import SwiftUI

struct ContentView: View {
    @State var budgets: [Budget] = [.init(title: "Car", budget: 747.00, allocated: 0.00, dueDate: Date(), deadDate: Date(), autoFill: false),
                                            .init(title: "8.6.24 Groceries", budget: 100.00, allocated: 69.09, dueDate: Date(), deadDate: Date(), autoFill: false)]
    @State var isShowingSheet = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                VStack {
                    List {
                        Section("Budgeting") {
                            ForEach(budgets, id: \.title) {budget in
                                NavigationLink(value: budget) {
                                    Label(budget.title, systemImage: "dollarsign.square")
                                }
                            }
                        }
                    }.navigationDestination(for: Budget.self) { budget in
                        DetailBudgetView(budgeting: budget)
                    }
                    Button {
                        isShowingSheet = true
                    } label: {AddBudgetButton(title: "Add Budget", imageName: "clock.fill", color:.green)
                    }
                }.sheet(isPresented: $isShowingSheet, content: {NewBudgetForm(budgets: $budgets)})
            }
        }
        }
        }

struct NewBudgetForm: View {
    // initialize new instance of Budget type
    // @State private var newBudgeting: Budget
    
    @Binding var budgets: Budget
    
    // Tie these to Binding at some point
//    @State private var title: String
//    @State private var budget = 0
//    @State private var allocated: Double
//    @State private var dueDate: Date
//    @State private var deadDate: Date
//    @State private var autoFill: Bool
    
    let formatter: NumberFormatter = {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        return formatter
    }()
    
    var body: some View{
        Form {
            TextField("Title", text: $title)
            TextField("Budget", value: $budget, formatter: formatter)
            DatePicker("Due Date", selection: $dueDate)
            DatePicker("Drop dead date", selection: $dueDate)
            Toggle("Autofill from unallocated discretionary?", isOn: $autoFill)
        }
        Button("Submit") {
            newBudget()
        }
    }
}

func newBudget() {
    //@Binding private var newBudgeting: Budget
    //populate instance of Budget type from NewBudgetForm
}

struct AddBudgetButton: View {
    
    var title: String
    var imageName: String
    var color: Color
    
    var body: some View {
        Label(title, systemImage: imageName)
            .frame(width: 280, height: 50)
            .background(color)
            .foregroundColor(.white)
            .cornerRadius(12)
            .padding()
    }
    }

struct DetailBudgetView: View {
    let budgeting: Budget
//    @Binding var budgets: [Budget]
    var body: some View {
        VStack {
            Label(budgeting.title, systemImage: "dollarsign.circle")
            Label("Allocated dollars: \(budgeting.allocated)", systemImage: "dollarsign")
            }
        }
    }

#Preview {
    ContentView()
}

struct Budget: Hashable {
    let title: String
    let budget: Double
    let allocated: Double
    let dueDate: Date
    let deadDate: Date
    let autoFill: Bool
}
