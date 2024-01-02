import SwiftUI
import WebKit

struct ContentView: View {
    @State private var selectedTab: Tab = .first

    enum Tab: Int {
        case first,
             second,
             third,
             fourth
    }
    let websiteURL = "https://www.yourcartribe.com"
    var body: some View {
        TabView(selection: $selectedTab,
                content:  {
            NavigationView {
    WebViewContainer(urlString: websiteURL)
                    .navigationBarTitle("YourCarTribe", displayMode: .inline)
            }
                .tabItem {
                    Label("Website", systemImage: "terminal") }.tag(1)
            Cars()
                .tabItem {
                    Label("Cars", systemImage: "car") }.tag(2)
            Parts()
                .tabItem {
                    Label("Parts", systemImage: "tray") }.tag(3)
            Articles()
                .tabItem {
                    Label("Articles", systemImage: "book") }.tag(4)
        })
        .padding()
    }
}

#Preview {
    ContentView()
}

