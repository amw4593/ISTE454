//
//  MorphView.swift
//  Animations
//
//  Created by GCCISAdmin on 11/28/23.
//

import SwiftUI

struct MorphView: View {
    
    @State private var recordBegin = false
    @State private var recording = false
    
    var body: some View {
        ZStack {
            
            RoundedRectangle(cornerRadius: recordBegin ? 30 : 5)
                .frame(width: recordBegin ? 60 : 250, height: 60)
                .foregroundColor(recordBegin ? .red : .green)
                .overlay(
                    Image(systemName: "mic.fill")
                        .font(.system(.title))
                        .foregroundColor(.white)
                        .scaleEffect(recording ? 0.7 : 1)
                )
            
            RoundedRectangle(cornerRadius: recordBegin ? 35 : 10)
                .trim(from: 0, to: recordBegin ? 0 : 1)
                .stroke(lineWidth: 5)
                .frame(width: recordBegin ? 70 : 260, height: 70)
                .foregroundColor(recordBegin ? .red : .green)
            
        }
        .onTapGesture {
            withAnimation(.spring()) {
                recordBegin.toggle()
            }
            withAnimation(.spring().repeatForever().delay(0.5)) {
                recording.toggle()
            }
        }
    }
}

#Preview {
    MorphView()
}
