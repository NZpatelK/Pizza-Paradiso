//
//  PizzaApp.swift
//  Pizza-Paradiso
//
//  Created by Karan Patel on 28/05/2024.
//

import SwiftUI

struct PizzaApp: View {
    @State private var pizzaSize: CGFloat = 280
    @State private var panSize: CGFloat = 300
    @State private var Selected:String = "S"
    @State private var isSelected:Bool = false
    
    private let pizzaImgs = ["pizza-1", "pizza-2", "pizza-3", "pizza-4"]
    
    var body: some View {
        GeometryReader{ geometry in
            VStack(){
                ZStack {
                    Image("pan")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
//                        .frame(width: 300, height: 300)
                        .frame(width: panSize, height: panSize)
                        .animation(isSelected ? Animation.interpolatingSpring(stiffness: 300, damping:10, initialVelocity: 0) : .none)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach (pizzaImgs, id: \.self) { pizza in
                                Image(pizza)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
//                                    .frame(width: 280, height: 280)
                                    .frame(width: pizzaSize, height: pizzaSize)
                                    .animation(isSelected ? Animation.interpolatingSpring(stiffness: 300, damping: 10, initialVelocity: 0): .none)
                                    .containerRelativeFrame(.horizontal, count: 1, spacing: 4)
                                    .scrollTransition{content, phase in
                                        content
                                            .opacity(phase.isIdentity ? 1.0 : 0)
                                            .scaleEffect(x: phase.isIdentity ? 1 : 0.3,
                                                         y: phase.isIdentity ? 1 : 0.3)
                                            .offset(y: phase.isIdentity ? 0 : 50)
                                    }
                            }
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                }
            }
            .position(x: geometry.size.width / 2, y: 150)
            
            Spacer()
            HStack(spacing: 20) {
                ZStack{
                    Button(action:  {
                        panSize = 300
                        pizzaSize = 280
                        Selected = "S"
                        isSelected = true
                    })
                    {
                        Capsule()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Selected == "S" ? Color.orange : Color.gray)
                            .overlay(
                                Text("S")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(Color.white)
                            )
                    }
                }
                ZStack{
                    Button(action:  {
                        panSize = 350
                        pizzaSize = 330
                        Selected = "M"
                        isSelected = true
                    })
                    {
                        Capsule()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Selected == "M" ? Color.orange : Color.gray)
                            .overlay(
                                Text("M")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(Color.white)
                            )
                    }
                }
                ZStack{
                    Button(action:  {
                        panSize = 400
                        pizzaSize = 380
                        Selected = "L"
                        isSelected = true
                    })
                    {
                        Capsule()
                            .frame(width: 50, height: 50)
                            .foregroundColor(Selected == "L" ? Color.orange : Color.gray)
                            .overlay(
                                Text("L")
                                    .font(.system(size: 16, weight: .semibold))
                                    .foregroundColor(Color.white)
                            )
                    }
                }
            }
            .position(x: geometry.size.width / 2, y: geometry.size.height-200)
            Spacer()
        }
    }
}

#Preview {
    PizzaApp()
}
