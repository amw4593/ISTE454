//
//  ContentView.swift
//  Transitions
//
//  Created by GCCISAdmin on 11/28/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var show = false
    
    var body: some View {
        VStack {
            
            RoundedRectangle(cornerRadius: 10)
                .frame(width: 300, height: 300)
                .foregroundColor(.green)
                .overlay(
                    Text("Show Details")
                        .font(.system(.largeTitle, design: .rounded))
                        .bold()
                        .foregroundColor(.white)
                )
            if show {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 300, height: 300)
                    .foregroundColor(.purple)
                    .overlay(
                        Text("Well, Here Are The Details")
                            .font(.system(.largeTitle, design: .rounded))
                            .bold()
                            .foregroundColor(.white)
                    )
                   // .transition(.scale(scale: 0, anchor: .bottom))
                   // .transition(.offset(x: -600, y:0).combined(with: .scale).combined(with: .opacity))
                   // .transition(.offsetScaleOpacity)
                    .transition(.scaleAndOffset)
            }
        }
        .onTapGesture {
            withAnimation(.spring()) {
                show.toggle()
            }
        }
    }
}

extension AnyTransition {
    static var offsetScaleOpacity: AnyTransition {
        .offset(x: -600, y:0).combined(with: .scale).combined(with: .opacity)
    }
    static var scaleAndOffset: AnyTransition {
        .asymmetric(insertion: .scale(scale: 0, anchor: .bottom), removal: .offset(x: -600, y: 0))
    }
}


#Preview {
    ContentView()
}
