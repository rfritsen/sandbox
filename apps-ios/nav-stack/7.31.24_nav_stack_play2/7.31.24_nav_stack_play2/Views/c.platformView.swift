//
//  c.platformView.swift
//  7.31.24_nav_stack_play2
//
//  Created by Ryan on 7/31/24.
//

import Foundation
import SwiftUI

struct cplatformView: View {
    
    var body: some View {
        ZStack {
            Color.green.ignoresSafeArea()
            List {
                Section("Platforms") {
                    ForEach(platforms, id: \.name) { platform in
                        NavigationLink(value: platform) {
                            Label(platform.name, systemImage:"bolt.fill")
                        }
                        //.navigationDestination(item: <#T##Binding<Optional<Hashable>>#>, destination: PlatView())
                        //.navigationDestination(for: Platform.self) { platform in
                        //    PlatView()
                        //}
                    }
                }
            }
            }
        }
    }
