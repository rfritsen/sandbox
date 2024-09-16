//
//  ContentView.swift
//  budget_play_4
//
//  Created by Ryan on 8/7/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var budgets: [Budget] = [.init(title: "Car", budget: 747.00, allocated: 0.00),
                                            .init(title: "8.6.24 Groceries", budget: 100.00, allocated: 69.09)]
    
    var body: some View {
        NavigationStack {
            List {
                Section("Budgeting") {
                    ForEach(budgets, id: \.title) {budget in
                        NavigationLink(value: budget) {
                            Label(budget.title, systemImage: "dollarsign.square")
                        }
                    }
                }
            }.navigationDestination(for: Budget.self) { budget in
                VStack {
                    Label(budget.title, systemImage: "dollarsign.circle")
                    Label("Allocated dollars: \(budget.allocated)", systemImage: "dollarsign")
        }
            }
        }
    }
}



//struct DetailBudgetView: View {
//    @Binding var budgets: [Budget]
//    var body: some View {
//        VStack {
//            ForEach(budgets, id:\.title) { budget in
//                Label($budgets.title, systemImage: "dollarsign.square")
//                Text(budgets.budget)
//                Text(budgets.allocated)
//            }
//        }
//    }
//}

//struct BudgetList: View {
//    //@Binding var budgets: [Budget]
//    //@State private var Discretionary = 0
//    var body: some View {
//        NavigationStack {
//            // Up next - Add a V Stack and a button for "new budget". Add a NavLink for each list item to Edit Budget screen.
//            List {
//                Section("Budgets") {
//                    ForEach(budgets, id: \.title) { budget in
//                        NavigationLink(value: budget) {
//                                Label(budget.title, systemImage: "sun.max")
//                        }
//                    }
//                }
//            }
//        }
//    }
//}

struct Budget: Hashable {
    let title: String
    let budget: Double
    let allocated: Double
}
