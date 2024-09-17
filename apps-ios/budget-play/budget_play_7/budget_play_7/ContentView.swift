//
//  ContentView.swift
//  budget_play_7
//
//  Created by Ryan on 8/9/24.
//

import SwiftUI

struct ContentView: View {
    @State var budgets: [Budget] = [.init(title: "Car", budget: 747.00, allocated: 0.00),
                                            .init(title: "8.6.24 Groceries", budget: 100.00, allocated: 69.09)]
    @State var isShowingSheet = false
    @State var output: String = ""
    @State private var path = NavigationPath()
    
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                Section("Budgeting") {
                    ForEach(budgets, id: \.title) {budget in
                        NavigationLink(value: budget) {
                            Label(budget.title, systemImage: "dollarsign.square")
                        }
                    }
                }
                Section("Buttons!") {
                    Button("New Budget") {
                        path.append(budgets.title)
                    }
                }
            }.navigationDestination(for: Budget.self) { budget in
                VStack {
                    
                    Button("NavButton") {
                        path.append(budgets.randomElement()!)
                    }
                }
                    
        }
            }
        }
    }

struct DetailLight: View {
    //@Binding var titleInput: Budget
    //@Binding var isShowingSheet: Bool
    var id: Budget
    
    var body: some View {
        Text("Testing DetailLight, \(id.title)")
    }
}

//struct OptionsLight

struct EditLight: View {
    var id: Budget
    @Binding var output: String
    var body: some View {
        VStack {
            Text("Insert test text here")
            TextField("\(id.title)", text: $output).onSubmit {
                print("\(id.title), \(output)")
            }
            Button {
                DetailLight(id: id)
                //instead use NavStack and pop backwards here
            } label: {Text("Submit")}
        }
    }
}


struct Budget: Hashable {
    let title: String
    let budget: Double
    let allocated: Double
}
