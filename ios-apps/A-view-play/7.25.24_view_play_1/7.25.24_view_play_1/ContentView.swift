//
//  ContentView.swift
//  7.25.24_view_play_1
//
//  Created by Ryan on 7/25/24.
//
//  Create a list of new greetings and cycle through them


import SwiftUI


var greets: Array<String> = ["Hello, World!", "Hi!"]
var sum = 0
struct ContentView: View {
    @State private var ver = ""
    @State private var greet = ""
    var ent = 0
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text(ver)}
            HStack {
                TextField("Create new greeting here", text: $greet)
                    .onSubmit{ greets.append(greet)}
            }
            Button("Submit new greeting") {
                greets.append(greet)}
            Text (greet)
            Button("Pick new greeting") {
                ver = newgreets(greet:greets)}
        }
        
 }
    
}
func newgreets(greet: Array<String>) -> String {
    let count = greets.count
    sum += 1
    if count > sum {()}
        else {sum = 0}
    return greets[sum]}
#Preview {
    ContentView()
}
