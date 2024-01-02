//
//  DrawingControls.swift
//  DrawMailer
//
//  Created by gccisadmin on 11/30/23.
//

import SwiftUI

struct DrawingControls: View {
    @Binding private var drawings: [Drawing]
    @Binding private var color: Color
    @Binding private var lineWidth: CGFloat
    @Binding private var uiImage: UIImage?
    @Binding private var drawingRect: CGRect
    
    @State private var colorPickerShown = false
    private let spacing: CGFloat = 20
    
     var body: some View {
        VStack(spacing: spacing){
            HStack(spacing: spacing) {

                Button(action: {
                    self.colorPickerShown = true
                }, label: {
                    Text("Line Color")
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 2)
                        )})
                Button(action: {
                    if self.drawings.count > 0 {
                        self.drawings.removeLast()
                    }
                }, label: {
                    Text("Undo")
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 2)
                        )})
                Button(action: {
                    self.drawings = [Drawing]()
                }, label: {
                    Text("Clear")
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 2)
                        )})
            }
            HStack(spacing: spacing) {
                Button(action: {
                }, label: {
                    Text("Background Color")
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 2)
                        )})
                Button(action: {

                }, label: {
                    Text("Save")
                        .padding(10)
                        .overlay(
        RoundedRectangle(cornerRadius: 10)
            .stroke(Color.blue, lineWidth: 2)
                        )})
                Button(action: {
                }, label: {
                    Text("Share")
                        .padding(10)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.blue, lineWidth: 2)
                        )})
            }
            HStack {
                Text("Pencil width")
                    .padding()
                Slider(value: $lineWidth, in: 1.0...15.0, step: 1.0)
                    .padding()
            }
        }
        .frame(height: 250)
        .sheet(isPresented: $colorPickerShown, onDismiss: {
            self.colorPickerShown = false
        }, content: { () -> ColorPicker in
            ColorPicker(color: self.$color, colorPickerShown: self.$colorPickerShown)
        })
    }
}
