//
//  ContentView.swift
//  7.31.24_nav_stack_tutorial
//
//  Created by Ryan on 7/31/24.
//

import SwiftUI
// import UIKit

struct ContentView: View {
    
    var platforms: [Platform] = [.init(name:"Xbox", color: .green),
                                 .init(name:"Playstation", color: .indigo),
                                 .init(name:"PC", color: .pink),
                                 .init(name: "Mobile", color: .mint)]
    
    var body: some View {
        NavigationStack {
            List {
                Section("Platforms") {
                    ForEach(platforms, id: \.name) { platform in
                        NavigationLink(value: platform){
                            Label(platform.name, systemImage:"bolt.fill")
                        }
                    }
                }
            }.navigationDestination(for: Platform.self) { platform in
                ZStack {
                    platform.color.ignoresSafeArea()
                    Label(platform.name, systemImage: "01.square.fill")
                        .font(.title).bold()
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

    struct Platform: Hashable {
    let name: String
    let color: Color
}
