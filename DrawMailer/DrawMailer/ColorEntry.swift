//
//  ColorEntry.swift
//  DrawMailer
//
//  Created by gccisadmin on 11/30/23.
//

import SwiftUI

struct ColorEntry: View {
    let colorInfo: ColorInfo
    var body: some View {
        HStack {
            Circle()
                .fill(colorInfo.color)
                .frame(width: 40, height: 40)
                .padding(.all)
            Text(colorInfo.displayName)
        }
    }
}
