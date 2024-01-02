//
//  Pies.swift
//  MyCharts
//
//  Created by GCCISAdmin on 11/30/23.
//

import SwiftUI
import Charts

struct MyPies: Comparable {
    
    var type: String
    var sold: Double
    
    static func <(lhs: MyPies, rhs: MyPies) -> Bool {
        return lhs.sold < rhs.sold
    }
    
}

struct Pies: View {
    
    var data: [MyPies] = [
        .init(type: "Apple", sold: 30),
        .init(type: "Cherry", sold: 15),
        .init(type: "Blueberry", sold: 10),
        .init(type: "Strawberry", sold: 50),
        .init(type: "Rhubarb", sold: 20),
        .init(type: "Key Lime", sold: 50),

    ]
    
    @State private var pieSelection: Double?
    @State private var graphSelection: String?
    
    var body: some View {
        
        Chart(data, id: \.type) { element in
            
            SectorMark(angle: .value("Sales", element.sold), innerRadius: .ratio(0.618), angularInset: 1.5)
            
            // BarMark(x: .value("Sales", element.sold), stacking: .normalized)
                .cornerRadius(5)
                .foregroundStyle(by: .value("Type", element.type))
                .opacity(graphSelection == nil ? 1 : (graphSelection == element.type ? 1: 0.4))
        }
        
        //.chartXAxis(.hidden)
        .chartAngleSelection(value: $pieSelection)
        .frame(height: 300)
        .chartBackground { ChartProxy in
            
            GeometryReader { geometry in
                let frame = geometry[ChartProxy.plotFrame!]
                
                VStack {
                    Text("Most Sold Type")
                        .font(.callout)
                        .foregroundStyle(.secondary)
                    Text(data.max()?.type ?? "")
                        .font(.title2.bold())
                        .foregroundColor(.primary)
                }
                .position(x: frame.midX, y: frame.midY)
            }
            
        }
        .padding()
        .onChange(of: pieSelection, initial: false) { oldValue, newValue in
            
            if let newValue {
                findPie(newValue)
            } else {
                graphSelection = nil
            }
            
        }
        
    }
    func findPie(_ rangeValue: Double) {
        var initialValue = 0.0
        
        let convertedArray = data.compactMap { pie -> (String, Range<Double>) in
            let rangeEnd = initialValue + pie.sold
            
            let tuple = (pie.type, initialValue..<rangeEnd)
            
            //update the initial value for the next iteration
            initialValue = rangeEnd
            
            return tuple
            
        }
        
        //now find if the vlue lies in the range
        if let pie = convertedArray.first(where: { $0.1.contains(rangeValue) }) {
            //update the selection
            graphSelection = pie.0
                
        }
    }
}

#Preview {
    Pies()
}
