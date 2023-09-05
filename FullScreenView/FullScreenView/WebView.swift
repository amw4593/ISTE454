//
//  WebView.swift
//  FullScreenView
//
//  Created by GCCISAdmin on 8/31/23.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    var urlString: String //passed in when WebView is created
    func makeUIView(context: Context) -> some WKWebView {
        //return the actiual value we are going to show
        //he code below will showcase the url
        guard let url = URL(string: urlString) else{
        return WKWebView() //return an empty webview
        }
        let request = URLRequest(url: url)
        let wkWebView = WKWebView()
        wkWebView.load(request)
        return wkWebView
    }//make UIView
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        //Code is required but we are not using
    }
}
