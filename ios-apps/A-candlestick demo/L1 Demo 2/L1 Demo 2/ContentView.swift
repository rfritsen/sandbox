//
//  ContentView.swift
//  L1 Demo 2
//
//  Created by Ryan on 7/24/24.
//

import SwiftUI
import Charts

struct ContentView: View {
    var body: some View {
        NavigationStack {
            VStack {
                Chart {
                    ForEach(candle_stocks) { item in
                        RectangleMark(x: .value("Day", item.day),
                                      yStart: .value("Low Price",
                                                     item.lowPrice),
                                      yEnd: .value("High Price", item.highPrice),
                                      width: 4)
                        .opacity(0.4)
                        
                        RectangleMark(x: .value("Day", item.day),
                                      yStart: .value("Open Price",
                                                     item.openPrice),
                                      yEnd: .value("Close Price", item.closePrice),
                                      width: 12)
                    }
                }
                .padding(40)
            }
        }
    }
}

struct Candle: Identifiable {
    var id = UUID().uuidString
    var name: String
    var day: String
    var lowPrice: Double
    var highPrice: Double
    var openPrice: Double
    var closePrice: Double
    
}

var candle_stocks: [Candle] = [
    Candle(
        name: "SHOP",
        day: "Monday",
        lowPrice: 10,
        highPrice: 20,
        openPrice: 13,
        closePrice: 17
        ),
    Candle(
        name: "SHOP",
        day: "Tuesday",
        lowPrice: 7,
        highPrice: 17,
        openPrice: 17,
        closePrice: 10
        ),
    Candle(
        name: "SHOP",
        day: "Weds",
        lowPrice: 6,
        highPrice: 19,
        openPrice: 10,
        closePrice: 15
        ),
    Candle(
        name: "SHOP",
        day: "Thurs",
        lowPrice: 12,
        highPrice: 21,
        openPrice: 15,
        closePrice: 21
        ),
]
