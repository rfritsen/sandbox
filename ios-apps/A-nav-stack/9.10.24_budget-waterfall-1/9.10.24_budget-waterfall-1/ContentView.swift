//
//  ContentView.swift
//  9.10.24_budget-waterfall-1
//
//  Created by Ryan on 9/10/24.
//
//Code from Perplexity:
//https://www.perplexity.ai/search/write-swift-app-with-two-views-pL_mgmGUQJq5LdfXuDTO4Q

import SwiftUI
import Foundation

// Main app structure
//@main
struct BudgetAppApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}

struct ContentView: View {
    @State private var totalBudget: Double = 0
    @State private var budgetItems: [BudgetItem] = []

    var body: some View {
        TabView {
            TotalBudgetView(totalBudget: $totalBudget)
                .tabItem {
                    Label("Total Budget", systemImage: "dollarsign.circle")
                }
            
            BudgetItemsView(totalBudget: $totalBudget, budgetItems: $budgetItems)
                .tabItem {
                    Label("Budget Items", systemImage: "list.bullet")
                }
        }
    }
}

// Total Budget view
struct TotalBudgetView: View {
    @Binding var totalBudget: Double
    @Binding var remBudget: Double

    var body: some View {
        VStack {
            Text("Budget")
                .font(.largeTitle)
                .padding()
            HStack {
                Text("Total Earnings")
                Text(totalBudget, format:.currency(code: "USD"))
            }
            HStack {
                Text("Unallocated Earnings:")
                Text(remBudget, format:currency(code: "USD"))
            }
            Text("Enter new earnings")
                TextField("Enter total budget", value: $totalBudget, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                    .multilineTextAlignment(.center)
                    .font(.title)
                    .padding()
            Button("Save") {
                updateRemainingAmounts(remBudget)
                //Button("Add more earnings", action:newEarnings)
            }
        }
    }
}

//Budget Items View
struct BudgetItemsView: View {
    @Binding var totalBudget: Double
    @Binding var budgetItems: [BudgetItem]
    @State private var noItems: Bool = true
    @State private var newItemName: String = ""
    @State private var newItemTotalNeeded: Double = 0
    @State private var sortOrder: [KeyPathComparator<BudgetItem>] = [
        .init(\.totalNeeded, order: .reverse)
    ]

    var body: some View {
        NavigationView {
            VStack {
            List {
                ForEach(budgetItems) { item in
                    BudgetItemRow(item: item)
                }
                .onDelete(perform: deleteItems)
            }
            .navigationTitle("Budget Items")
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    EditButton()
                }
            }
        }
            .sheet(isPresented: $noItems) {
                AddBudgetItemView(
                    newItemName: $newItemName,
                    newItemTotalNeeded: $newItemTotalNeeded,
                    addItem: addItem
                )
//                Button("Add new budget") {
//                    navPath.add(1)
//                }.navigationDestination(for: budgetItems.self, destination: AddBudgetItemView)
            }
        }
    }

    private func checkNoItems() {
        if (budgetItems.count > 0) {
            noItems = false
        }
        else {
            noItems = false
        }
    }
    
    private func addItem() {
        let newItem = BudgetItem(name: newItemName, totalNeeded: newItemTotalNeeded, remaining: 0)
        budgetItems.append(newItem)
        newItemName = ""
        newItemTotalNeeded = 0
        updateRemainingAmounts()
    }

    private func deleteItems(at offsets: IndexSet) {
        budgetItems.remove(atOffsets: offsets)
        updateRemainingAmounts()
    }

    private func updateRemainingAmounts() {
        var remainingBudget = totalBudget
        
        for index in budgetItems.indices {
            if remainingBudget >= budgetItems[index].totalNeeded {
                budgetItems[index].remaining = 0
                remainingBudget -= budgetItems[index].totalNeeded
            } else {
                budgetItems[index].remaining = budgetItems[index].totalNeeded - remainingBudget
                remainingBudget = 0
            }
        }
        
        budgetItems.sort(using: sortOrder)
    }
}

// Add new earnings view

// Add new budget items
struct AddBudgetItemView: View {
    @Binding var newItemName: String
    @Binding var newItemTotalNeeded: Double
    var addItem: () -> Void
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationView {
            VStack {
                TextField("Item name", text: $newItemName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                TextField("Total needed", value: $newItemTotalNeeded, format: .currency(code: "USD"))
                    .keyboardType(.decimalPad)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()

                Button("Add Item") {
                    addItem()
                    presentationMode.wrappedValue.dismiss()
                }
                .padding()
            }
            .padding()
            .navigationTitle("Add Budget Item")
            .navigationBarItems(leading: Button("Back") {
                presentationMode.wrappedValue.dismiss()
            })
        }
    }
}
//Dislpy individual budget item rows
struct BudgetItemRow: View {
    let item: BudgetItem

    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text("Total needed: \(item.totalNeeded, format: .currency(code: "USD"))")
                    .font(.subheadline)
            }
            Spacer()
            Text("Remaining: \(item.remaining, format: .currency(code: "USD"))")
                .font(.subheadline)
                .foregroundColor(item.remaining > 0 ? .red : .green)
        }
    }
}


// Data model

struct BudgetItem: Identifiable {
    let id = UUID()
    let name: String
    let totalNeeded: Double
    var remaining: Double
}

// Preview
struct ContentView_Preview:
    PreviewProvider {
        static var previews: some View {
            ContentView()
        }
    }
