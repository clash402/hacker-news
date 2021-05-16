//
//  WebView.swift
//  hacker-news
//
//  Created by Josh Courtney on 5/3/21.
//

import Foundation
import SwiftUI
import WebKit

struct WebView: UIViewRepresentable {
    let url: String?
    
    func makeUIView(context: Context) -> WKWebView {
        return WKWebView()
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        guard let urlString = url else { return }
        guard let url = URL(string: urlString) else { return }
        
        let request = URLRequest(url: url)
        uiView.load(request)
    }
}
