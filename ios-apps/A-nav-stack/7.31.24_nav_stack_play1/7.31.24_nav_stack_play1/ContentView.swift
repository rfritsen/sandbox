//
//  ContentView.swift
//  7.31.24_nav_stack_play1
//
//  Created by Ryan on 7/31/24.
//

import SwiftUI
// import UIKit

var platforms: [Platform] = [.init(name:"Xbox", color: .green),
                                    .init(name:"Playstation", color: .indigo),
                                    .init(name:"PC", color: .pink),
                                    .init(name: "Mobile", color: .mint)]

struct ContentView: View {
    
    var body: some View {
        NavigationStack {
            NavigationLink("StrK", destination: ListView())
        }.navigationTitle("See platforms")
            .buttonStyle(PinkButtonStyle())
    }
    struct PinkButtonStyle: ButtonStyle {
            func makeBody(configuration: Configuration) -> some View {
                configuration.label
                    .padding()
                    .font(.title)
                    .foregroundColor(.purple)
                    .background(configuration.isPressed ? Color.blue : Color.pink)
                    .cornerRadius(5)
            }
        }
    
    
}

struct ListView: View {
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            List {
                Section("Platforms") {
                    ForEach(platforms, id: \.name) { platform in
                        Label(platform.name, systemImage:"bolt.fill")
                    }
                }
            }
        }
    }
}
//struct ButtonView: ButtonStyle {
  //  func makeHead(configuration: Configuration) -> some View {
    //    Text("Starten")
      //  .frame(width: 200, height: 100, alignment: .center)
        //.background(Color.yellow)
        //.foregroundColor(Color.red)
//}
//}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

    struct Platform: Hashable {
    let name: String
    let color: Color
}
