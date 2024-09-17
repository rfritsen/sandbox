//
//  ContentView.swift
//  budget_play_3
//
//  Created by Ryan on 8/7/24.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        VStack {
            Section("Unallocated Discretionary") {
                SummaryView()
            }
            Section("Summary") {
                BudgetList()
            }
            .padding()
        }
    }
}

struct SummaryView: View {
    @State private var disc = 72
    var body: some View {
        VStack {
            Text("\(disc)")
                .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                .font(.system(size:48))
        }.padding()
    }
}

struct BudgetList: View {
    @State private var budgets: [Budget] = [.init(title: "Car", budget: 747.00, allocated: 0.00),
                            .init(title: "8.6.24 Groceries", budget: 100.00, allocated: 69.09)]
    //@State private var Discretionary = 0
    var body: some View {
        NavigationStack {
            // Up next - Add a V Stack and a button for "new budget". Add a NavLink for each list item to Edit Budget screen.
            List {
                Section("Budgets") {
                    ForEach(budgets, id: \.title) {budget in
                        NavigationLink(value: budget) {
                                Label(budget.title, systemImage: "sun.max")
                        }
                    }
                }
            }
        }
    }
}

struct Budget: Hashable {
    let title: String
    let budget: Double
    let allocated: Double
}

#Preview {
    ContentView()
}


