//
//  DetailView.swift
//  hacker-news
//
//  Created by Josh Courtney on 5/3/21.
//

import SwiftUI

struct DetailView: View {
    let url: String?
    
    var body: some View {
        WebView(url: url)
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView(url: "https://www.google.com")
    }
}
