//
//  ContentView.swift
//  Pizza-Paradiso
//
//  Created by Karan Patel on 23/03/24.
//

import SwiftUI

//struct ContentView: View {
//    
//    private let pizzaImgs = ["pizza-1", "pizza-2", "pizza-3", "pizza-4"]
//    var body: some View {
//        ZStack {
//            Image("pan")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 300, height: 300)
//            ScrollView(.horizontal) {
//                HStack{
//                    ForEach (pizzaImgs, id: \.self) { pizza in
//                        Image(pizza)
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .frame(width: 280, height: 280)
//                            .containerRelativeFrame(.horizontal, count: 1, spacing: 4)
//                            .scrollTransition{content, phase in
//                                content
//                                    .opacity(phase.isIdentity ? 1.0 : 0)
//                                    .scaleEffect(x: phase.isIdentity ? 1 : 0.3,
//                                                 y: phase.isIdentity ? 1 : 0.3)
//                                    .offset(y: phase.isIdentity ? 0 : 50)
//                            }
//                        
//                            
//                    }
//                }
//                .scrollTargetLayout()
//            }
//            .scrollTargetBehavior(.viewAligned)
//        }
//    }
//}


struct ContentView: View {
    private let pizzaImgs = ["pizza-1", "pizza-2", "pizza-3", "pizza-4"]
    @State private var scrollOffset: CGFloat = 0
    
    var body: some View {
        ZStack {
            Image("pan")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 250, height: 250)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 4) {
                    ForEach(pizzaImgs.indices, id: \.self) { index in
                        GeometryReader { geo in
                            Image(pizzaImgs[index])
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 240, height: 240)
                                .rotationEffect(Angle(degrees: Double((geo.frame(in: .global).midX - scrollOffset) / UIScreen.main.bounds.width) * 90))
                        }
                        .frame(width: 240, height: 240)
                    }
                    .containerRelativeFrame(.horizontal, count: 1, spacing: 4)
                }
                .frame(height: 280)
                .onAppear {
                    DispatchQueue.main.async {
                        scrollOffset = UIScreen.main.bounds.width * CGFloat(pizzaImgs.count)
                    }
                }
                .onChange(of: scrollOffset) { _ in
                    if scrollOffset > UIScreen.main.bounds.width * CGFloat(pizzaImgs.count - 1) {
                        scrollOffset = UIScreen.main.bounds.width * CGFloat(pizzaImgs.count - 1)
                    }
                }
                .scrollTargetLayout()
            }
            .scrollTargetBehavior(.viewAligned)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

#Preview {
    ContentView()
}
