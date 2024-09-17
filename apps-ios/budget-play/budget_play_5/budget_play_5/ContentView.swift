//
//  ContentView.swift
//  budget_play_5
//
//  Created by Ryan on 8/7/24.
//

import SwiftUI

struct ContentView: View {
    @State var budgets: [Budget] = [.init(title: "Car", budget: 747.00, allocated: 0.00),
                                            .init(title: "8.6.24 Groceries", budget: 100.00, allocated: 69.09)]
    @State var isShowingSheet = false
    @State var output: String = ""
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
                EditLight(id: budget, output:$output)
                    
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

struct EditLight: View {
    var id: Budget
    @Binding var output: String
    var body: some View {
        VStack {
            Text("Insert test text here")
            TextField("\(id.title)", text: $output).onSubmit {
                print("\(id.title), \(output)")
            }
//            Button {
//                DetailLight(id: id)
//                //instead use NavStack and pop backwards here
//            } label: {Text("Submit")}
        }
    }
}

//struct DetailBudgetView: View {
//    @Binding var budgeting: [Budget]
//    @Binding var isShowingSheet: Bool
//    @Environment(\.presentationMode) var presentationMode
////    @Binding var budgets: [Budget]
//    var body: some View {
//        VStack {
//            Label(budgeting.title, systemImage: "dollarsign.circle")
//            Label("Allocated dollars: \(budgeting.allocated)", systemImage: "dollarsign")
//            Button {
//                isShowingSheet = true
//            } label: {
//                Text("Edit Budget")
//            }
//        }.sheet(isPresented: $isShowingSheet, content: {EditBudgetView(budgetahee:budgeting)})
//        }
//    }
//
//struct EditBudgetView: View {
//    @Environment(\.presentationMode) var presentationMode
//    @State var budgetahee: Budget
//    var body: some View {
//        Button {
//            presentationMode.wrappedValue.dismiss()
//        } label: {Text("Submit")
//        }
//    }
//}

#Preview {
    ContentView()
}

struct Budget: Hashable {
    let title: String
    let budget: Double
    let allocated: Double
}
