//
//  ContentView.swift
//  7.31.24_view_play_2
//
//  Created by Ryan on 7/31/24.
//

import SwiftUI

var greets: Array<String> = ["Hello, World!", "Hi!"]
var sum = 0

var greetings: [Greetings] = [.init(name:"Hi!", lang: "English"),
                              .init(name:"Hello!", lang:"English")
]

struct ContentView: View {
    @State private var ver = ""
    @State private var greet = ""
    var ent = 0
    var body: some View {
        NavigationStack {
            
            VStack {
                HStack {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.tint)
                    Text(ver)}
                HStack {
                    TextField("Create new greeting here", text: $greet)
                        .onSubmit{greets.append(greet)}
                }
                Button("Submit new greeting") {
                    greets.append(greet)}
                Text (greet)
                Button("Pick new greeting") {
                    ver = newgreets(greet:greets)}
            }
            NavigationLink("See all greetings"){
                Label("See all greetings")
                }.navigationDestination(for: Greetings.self) {
                    List {
                        ForEach(greetings, id: \.name) {greeting in
                            Label(greeting.name)
                        }
                    }
                }
                    
            
        }
        
        
        
        
        
        
        VStack {
            HStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text(ver)}
            HStack {
                TextField("Create new greeting here", text: $greet)
                    .onSubmit{greets.append(greet)}
            }
            Button("Submit new greeting") {
                greets.append(greet)}
            Text (greet)
            Button("Pick new greeting") {
                ver = newgreets(greet:greets)}
        }
        
 }
    
}

struct Greetings: Hashable {
    let name: String
    let lang:String
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
