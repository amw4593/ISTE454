//
//  DelayedViewing.swift
//  Animations
//
//  Created by GCCISAdmin on 11/28/23.
//

import SwiftUI





struct DelayedViewing: View {

@State private var isLoading = false
    var body: some View {
        HStack {
            ForEach(0...4, id: \.self) { index in
                
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.green)
                    .scaleEffect(isLoading ? 0: 1)
                    .animation(.linear(duration: 0.6).repeatForever().delay(0.2 * Double(index)), value: isLoading)
            }
        }
        .onAppear() {
            isLoading = true
        }
    }
}

#Preview {
    DelayedViewing()
}
