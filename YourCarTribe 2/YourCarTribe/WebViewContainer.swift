import Foundation
import SwiftUI
import WebKit


struct WebViewContainer: UIViewRepresentable {
    
    let urlString: String
    
    func makeUIView(context: UIViewRepresentableContext<WebViewContainer>) -> WKWebView {
        let webView = WKWebView()
        webView.navigationDelegate = context.coordinator
        return webView
    }
    func updateUIView(_ uiView: WKWebView, context: UIViewRepresentableContext<WebViewContainer>) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
}

func makeCoordinator() -> Coordinator {
    Coordinator(self)
}

class Coordinator: NSObject, WKNavigationDelegate {
    var parent: WebViewContainer
    
    init(_ parent: WebViewContainer) {
        self.parent = parent
    }
    }
}



