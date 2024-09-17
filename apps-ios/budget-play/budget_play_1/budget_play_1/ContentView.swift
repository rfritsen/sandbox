//
//  ContentView.swift
//  budget_play_1
//
//  Created by Ryan on 8/6/24.
//

import SwiftUI

struct FormView: View {
    @State private var title = ""
    @State private var dueDate = Date()
    @State private var beCool = false
    @State private var stepValue = 0
    var body: some View {
        NavigationView {
            Form {
                TextField("Title", text:$title)
                DatePicker("Due date", selection: $dueDate, displayedComponents: .date)
                Toggle("Be cool now", isOn: $beCool)
                Stepper("Number of Likes", value: $stepValue, in: 1...100)
                Text("This video has \(stepValue) likes")
                Link("Terms of Service", destination: URL(string: "http://www.google.com")!)
            }
            .accentColor(.blue)
            .navigationTitle("Test Inputs")
            .toolbar {
                ToolbarItemGroup(placement: .navigationBarTrailing) {
                    Button {
                        hideKeyboard()
                    } label: {
                        Image(systemName: "keyboard.chevron.compact.down")
                    }
                    Button("Save", action: saveUser)
                    }
                }
            }
        }
    func saveUser() {
        print("User Saved")
    }
}
    

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}



struct Budget: Hashable {
    let name: String
    let amount: Double
    let paid: Bool
}

#Preview {
    ContentView()
}

#if canImport(UIKit)
extension View {
    func hideKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder), to: nil, from:nil, for:nil)
    }
}
#endif
