//
//  ContentView.swift
//  ShapesAndPaths
//
//  Created by GCCISAdmin on 11/28/23.
//

import SwiftUI

struct Dome: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: 0))
        path.addQuadCurve(to: CGPoint(x: rect.size.width, y: 0), control: CGPoint(x: rect.size.width / 2, y: -(rect.size.width * 0.1)))
        path.addRect(CGRect(x: 0, y: 0, width: rect.size.width, height: rect.size.height))
        
        return path
    }
}

struct ContentView: View {
    var body: some View {
  Circle()
            .foregroundColor(.green)
            .frame(width: 200, height: 200)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .frame(width: 80, height: 80)
                    .foregroundColor(.white)
            )
//        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
//            Text("Test")
//                .font(.system(.title, design: .rounded))
//                .bold()
//                .foregroundColor(.white)
//                .frame(width: 250, height: 50)
//                .background(Dome().fill(.red))
//        })
//        ZStack {
//            
//            Path { path in
//                path.move(to: CGPoint(x: 200, y: 200))
//                path.addArc(center: .init(x: 200, y: 200), radius: 125, startAngle: Angle(degrees: 0.0), endAngle: Angle(degrees: 190), clockwise: true)
//            }
//            .fill(Color(.systemYellow))
//            
//            
//            Path { path in
//                path.move(to: CGPoint(x: 200, y: 200))
//                path.addArc(center: .init(x: 200, y: 200), radius: 125, startAngle: Angle(degrees: 190), endAngle: Angle(degrees: 110), clockwise: true)
//            }
//            .fill(Color(.systemTeal))
//            
//            
//            Path { path in
//                path.move(to: CGPoint(x: 200, y: 200))
//                path.addArc(center: .init(x: 200, y: 200), radius: 125, startAngle: Angle(degrees: 110), endAngle: Angle(degrees: 90), clockwise: true)
//            }
//            .fill(Color(.systemBlue))
//            
//            Path { path in
//                path.move(to: CGPoint(x: 200, y: 200))
//                path.addArc(center: .init(x: 200, y: 200), radius: 125, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 360), clockwise: true)
//            }
//            .fill(Color(.systemPurple))
//            .offset(x: 20, y: 20)
//            
//            Path { path in
//                path.move(to: CGPoint(x: 200, y: 200))
//                path.addArc(center: .init(x: 200, y: 200), radius: 125, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 360), clockwise: true)
//                path.closeSubpath()
//            }
//            .stroke(Color(red: 52/255, green: 52/255, blue: 122/255), lineWidth: 10)
//            .offset(x: 20, y: 20)
//            .overlay(
//                Text("25%")
//                    .font(.system(.largeTitle, design: .rounded))
//                    .bold()
//                    .foregroundColor(.white)
//                    .offset(x: 75, y: -100)
//            )
//        }
//        ZStack {
//            Path() { path in
//                path.move(to: CGPoint(x: 20, y: 60))
//                path.addLine(to: CGPoint(x: 40, y: 60))
//                path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
//                path.addLine(to: CGPoint(x: 230, y: 60))
//                path.addLine(to: CGPoint(x: 230, y: 100))
//                path.addLine(to: CGPoint(x: 20, y: 100))
//                path.closeSubpath()
//            }
//            
//            .fill(.purple)
//            
//            
//            Path() { path in
//                path.move(to: CGPoint(x: 20, y: 60))
//                path.addLine(to: CGPoint(x: 40, y: 60))
//                path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
//                path.addLine(to: CGPoint(x: 230, y: 60))
//                path.addLine(to: CGPoint(x: 230, y: 100))
//                path.addLine(to: CGPoint(x: 20, y: 100))
//                path.closeSubpath()
//            }
//            .stroke(lineWidth: 5)
//        }
//        
//        Path() { path in
//            path.move(to: CGPoint(x: 20, y: 60))
//            path.addLine(to: CGPoint(x: 40, y: 60))
//            path.addQuadCurve(to: CGPoint(x: 210, y: 60), control: CGPoint(x: 125, y: 0))
//            path.addLine(to: CGPoint(x: 230, y: 60))
//            path.addLine(to: CGPoint(x: 230, y: 100))
//            path.addLine(to: CGPoint(x: 20, y: 100))
//            path.closeSubpath()
//        }
//        
//        .fill(.green)
        //.stroke(.green, lineWidth: 10)
        
//        Path() { path in
//            path.move(to: CGPoint(x: 20, y: 20))
//            path.addLine(to: CGPoint(x: 300, y: 20))
//            path.addLine(to: CGPoint(x: 300, y: 200))
//            path.addLine(to: CGPoint(x: 20, y: 200))
//            path.closeSubpath()
//        }
//        
//        //.fill(.green)
//        .stroke(.green, lineWidth: 10)
    }
    
}

#Preview {
    ContentView()
}
