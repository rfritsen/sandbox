//
//  platforms.swift
//  7.31.24_nav_stack_play2
//
//  Created by Ryan on 7/31/24.
//

import SwiftUI

struct Platform: Hashable {
    let name: String
    let color: Color
}

var platforms: [Platform] = [.init(name:"Xbox", color: .green),
                                    .init(name:"Playstation", color: .indigo),
                                    .init(name:"PC", color: .pink),
                                    .init(name: "Mobile", color: .mint)]
