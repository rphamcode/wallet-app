//
//  ContentView.swift
//  wallet-app
//
//  Created by Pham on 4/25/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
          GeometryReader {
                let size = $0.size
                let safeArea = $0.safeAreaInsets
                
                ScrollViewReader { proxy in
                      HomeView(proxy: proxy, size: size, safeArea: safeArea)
                }
                .preferredColorScheme(.light)
                .ignoresSafeArea()
          }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
