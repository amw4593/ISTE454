//
//  DragExample.swift
//  Gestures
//
//  Created by GCCISAdmin on 11/16/23.
//

import SwiftUI


struct DragExample: View {
    
    @GestureState private var dragState = DragState.inactive
    
    //For Long Press Gesture
    @GestureState private var isPressed = false
    
    
    //Drag Gesture
//    @GestureState private var dragOffset = CGSize.zero
    @State private var position = CGSize.zero
    
    var body: some View {
        Image(systemName: "star.circle.fill")
            .font(.system(size: 100))
            .opacity(dragState.isPressing ? 0.5 : 1.0)
            .offset(x: position.width + dragState.translation.width, y: position.height + dragState.translation.height)
            .animation(.easeInOut, value: dragState.translation)
            .foregroundColor(.green)
            .gesture (
                
                LongPressGesture(minimumDuration: 1.0)
//                    .updating($isPressed, body: { currentState, state, transaction in
//                        state = currentState
//                    })
                    .sequenced(before: DragGesture())
                    .updating($dragState, body: {
                        value, state, transaction in
                        
                        switch value {
                            
                        case .first(true):
                            print("tapping")
                            state = .pressing
                        case .second(true, let drag):
                            state = .dragging(translation: drag?.translation ?? .zero)
                        default:
                            break
                        }
                        
                    })
                    .onEnded({ value in
                        guard case .second(true, let drag?) = value else {
                            return
                        }
                        position.height += drag.translation.height
                        position.width += drag.translation.width
                    })
            )
        
        
    }
}

#Preview {
    DragExample()
}
