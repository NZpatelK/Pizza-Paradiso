//
//  ContentView.swift
//  Pizza-Paradiso
//
//  Created by Karan Patel on 23/03/24.
//

import SwiftUI

struct ContentView: View {
    
    private let pizza = ["pizza-1", "pizza-2", "pizza-3", "pizza-4"]
    var body: some View {
        VStack {
            Image("pan")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
