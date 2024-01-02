//
//  ContentView.swift
//  MyCharts
//
//  Created by GCCISAdmin on 11/30/23.
//

import SwiftUI
import Charts

struct MonthPrice: Identifiable {
    var id = UUID()
    var month: String
    var value: Double
    var type: String
}

struct ContentView: View {
    //From SwiftData, COreData, API, etc.
    
    var Data: [MonthPrice] = [
        .init(month: "Jan", value: 5, type: "A"),
        .init(month: "Feb", value: 4, type: "A"),
        .init(month: "Mar", value: 7, type: "A"),
        .init(month: "Apr", value: 15, type: "A"),
        .init(month: "May", value: 14, type: "A"),
        .init(month: "Jun", value: 27, type: "A"),
        .init(month: "Jul", value: 27, type: "A"),
        
        .init(month: "Jan", value: 5, type: "B"),
        .init(month: "Feb", value: 4, type: "B"),
        .init(month: "Mar", value: 7, type: "B"),
        .init(month: "Apr", value: 15, type: "B"),
        .init(month: "May", value: 14, type: "B"),
        .init(month: "Jun", value: 27, type: "B"),
        .init(month: "Jul", value: 27, type: "B")
    ]
    
    
    var body: some View {

        Chart {
            ForEach(Data) {
                AreaMark (x: .value("Month", $0.month), y: .value("Value", $0.value))
                    .foregroundStyle(by: .value("Type", "Series \($0.type)"))
            }
        
        
        //        Chart(Data) {
//
//            LineMark(x: .value("Month", $0.month), y: .value("Month", $0.value))
//            
//            PointMark(x: .value("Month", $0.month), y: .value("Month", $0.value))
            
//            RuleMark(xStart: .value("Start", 1), xEnd: .value("End", 5), y: .value("Value", 2.5))
//            
//            RuleMark(xStart: .value("Start", 9), xEnd: .value("End", 16), y: .value("Value", 1.5))
//          
//            RuleMark(xStart: .value("Start", 3), xEnd: .value("End", 10), y: .value("Value", 0.5))
            
            
//            RectangleMark(x: .value("month", "Jan"), y: .value("Value", 5))
//            
//            RectangleMark(x: .value("month", "Feb"), y: .value("Value", 4))
//            
//            RectangleMark(x: .value("month", "Mar"), y: .value("Value", 7))
        }
        //The key has to match the foreground style above
        .chartForegroundStyleScale(["Series A": .red, "Series B": .blue])
        .frame(height: 250)
        .padding()
    }
}

#Preview {
    ContentView()
}
