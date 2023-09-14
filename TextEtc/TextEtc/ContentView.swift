//
//  ContentView.swift
//  TextEtc
//
//  Created by GCCISAdmin on 9/14/23.
//

import SwiftUI

struct ContentView: View {
   // @State private var useBold = true
    var body: some View {
        
        
//        Text("Hey There \(Text("Some Text").foregroundStyle(.orange))")
        
        Text("yegfvielurgl roifl hguogifongiozfgsdopjgiflnusfni oio zfiogio djvnzv")
        
            .fontWeight(.bold)
            .font(.custom("Hevetica Neue", size: 25))
            .font(.system(size: 20))
            .foregroundColor(.red)
            .multilineTextAlignment(.trailing)
            .lineSpacing(/*@START_MENU_TOKEN@*/10.0/*@END_MENU_TOKEN@*/)
            .lineLimit(3...6)
            .truncationMode(.head)
            .padding(10.0)
            .rotationEffect(.degrees(20), anchor: UnitPoint(x: 0, y: 0))
//            .font(.system(.largeTitle, design: .rounded))
          //  .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
//            .bold(useBold)
//            .italic(false)
//        
    }//body
}

#Preview {
    ContentView()
}
