//
//  ContentView.swift
//  Gestures
//
//  Created by GCCISAdmin on 11/16/23.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isPressed = false
    @GestureState private var longPressTap = false
    var body: some View {

            Image(systemName: "star.circle.fill")
            .font(.system(size: 200))
            .opacity(longPressTap ? 0.4 : 1.0)
            .scaleEffect(isPressed ? 0.5 : 1.0)
            .animation(.easeInOut, value: isPressed)
            .foregroundColor(.green)
            .gesture (
                //TapGesture()
                LongPressGesture(minimumDuration: 1.0)
                    .updating($longPressTap, body: { currentState, state, transaction in
                        state = currentState
                    })
                    .onEnded({ _ in // _ in is only needed for the LongPressGesture
                        isPressed.toggle()
                    })
            )//gesture
    }//body
}//ContentView

#Preview {
    ContentView()
}
