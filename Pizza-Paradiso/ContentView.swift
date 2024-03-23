//
//  ContentView.swift
//  Pizza-Paradiso
//
//  Created by Karan Patel on 23/03/24.
//

import SwiftUI

struct ContentView: View {
    
    private let pizzaImgs = ["pizza-1", "pizza-2", "pizza-3", "pizza-4"]
    var body: some View {
        ZStack {
            Image("pan")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300, height: 300)
            ScrollView(.horizontal) {
                HStack{
                    ForEach (pizzaImgs, id: \.self) { pizza in
                        Image(pizza)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 280, height: 280)
                            .containerRelativeFrame(.horizontal, count: 1, spacing: 4)
                    }
                }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
