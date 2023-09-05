//
//  ContentView.swift
//  FullScreenView
//
//  Created by GCCISAdmin on 8/31/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        WebView(urlString: "https://rit.edu")
            .edgesIgnoringSafeArea(.all)
    }//body
}

#Preview {
    ContentView()
}
