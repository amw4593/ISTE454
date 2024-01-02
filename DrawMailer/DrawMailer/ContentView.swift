//
//  ContentView.swift
//  DrawMailer
//
//  Created by gccisadmin on 11/30/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentDrawing: Drawing = Drawing()
    @State private var drawings: [Drawing] = [Drawing]()
    @State private var color: Color = Color.black
    @State private var lineWidth: CGFloat = 3.0
    @State private var uiImage: UIImage? = nil
    @State private var drawingRect: CGRect = .zero
    
    
    var body: some View {
        VStack(alignment: .center) {
            DrawingPad(currentDrawing: $currentDrawing, drawings: $drawings, color: $color, lineWidth: $lineWidth)
            DrawingControls(drawings: $drawings, color: $color, lineWidth: $lineWidth, uiImage: $uiImage, drawingRect: $drawingRect)
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

#Preview {
    ContentView()
}
