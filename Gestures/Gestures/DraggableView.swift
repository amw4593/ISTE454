//
//  DraggableView.swift
//  Gestures
//
//  Created by GCCISAdmin on 11/16/23.
//

import SwiftUI

enum DragState {
    case inactive
    case pressing
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive, .pressing:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isPressing: Bool {
        switch self {
        case .pressing, .dragging:
            return true
        case .inactive:
            return false
        }
    }
}

struct DraggableView<Content>: View where Content: View {
    
    
    @GestureState private var dragState = DragState.inactive
    @State private var position = CGSize.zero
    
    var content: () -> Content
    
    var body: some View {
        
        content()
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
    DraggableView() {
//        Image(systemName: "star.circle.fill")
//            .font(.system(size: 100))
//            .foregroundColor(.green)
  //      Text("Swift")
//            .font(.system(size: 50))
        Circle()
            .frame(width: 100, height: 100)
            .foregroundColor(.purple)
    }
}
