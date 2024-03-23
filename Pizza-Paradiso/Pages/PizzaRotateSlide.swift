//
//  File.swift
//  Pizza-Paradiso
//
//  Created by Karan Patel on 23/03/24.
//

import Foundation
import SwiftUI

struct PizzaRotateSlide: View {
    var body: some View {
        Text("This os Page 1")
    }
    
    private let pizzaImgs = ["pizza-1", "pizza-2", "pizza-3", "pizza-4"]
    @State private var scrollOffset: CGFloat = 0
    
//    var body: some View {
//        ZStack {
//            Image("pan")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
//                .frame(width: 250, height: 250)
//            ScrollView(.horizontal, showsIndicators: false) {
//                HStack(spacing: 4) {
//                    ForEach(pizzaImgs.indices, id: \.self) { index in
//                        GeometryReader { geo in
//                            Image(pizzaImgs[index])
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(width: 240, height: 240)
//                                .rotationEffect(Angle(degrees: Double((geo.frame(in: .global).midX - scrollOffset) / UIScreen.main.bounds.width) * 90))
//                        }
//                        .frame(width: 240, height: 240)
//                    }
//                    .containerRelativeFrame(.horizontal, count: 1, spacing: 4)
//                }
//                .frame(height: 280)
//                .onAppear {
//                    DispatchQueue.main.async {
//                        scrollOffset = UIScreen.main.bounds.width * CGFloat(pizzaImgs.count)
//                    }
//                }
//                .onChange(of: scrollOffset) { _ in
//                    if scrollOffset > UIScreen.main.bounds.width * CGFloat(pizzaImgs.count - 1) {
//                        scrollOffset = UIScreen.main.bounds.width * CGFloat(pizzaImgs.count - 1)
//                    }
//                }
//                .scrollTargetLayout()
//            }
//            .scrollTargetBehavior(.viewAligned)
//        }
//    }
}




