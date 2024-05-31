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
                        .frame(width: panSize, height: panSize)
                        .animation(isSelected ? Animation.interpolatingSpring(stiffness: 300, damping: 10, initialVelocity: 0): .none)
                        .shadow(color: Color(CGColor(genericCMYKCyan: 0, magenta: 0, yellow: 0, black: 1, alpha: 0.7)) , radius: 10)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach (pizzaImgs, id: \.self) { pizza in
                                Image(pizza)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: pizzaSize, height: pizzaSize)
                                    .animation(isSelected ? Animation.interpolatingSpring(stiffness: 200, damping: 10, initialVelocity: 0): .none)
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
//            .animation(isSelected ? Animation.interpolatingSpring(stiffness: 300, damping: 10, initialVelocity: 0): .none)
            .position(x: geometry.size.width / 2, y: 200)
        
            
            Spacer()
            
            
            Text("$20.00").position(x: geometry.size.width/2, y: geometry.size.height - 260)
            
            VStack{
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
                                .foregroundColor(Selected == "S" ? Color.orange : Color.white)
                                .if(Selected != "S") { view in
                                    view.shadow(color: Color.black.opacity(0.2), radius: 4, y: 4)
                                }
                                .overlay(
                                    Capsule()
                                        .if(Selected != "S") { view in
                                                view.stroke(Color(red: 0, green: 0, blue: 0, opacity: 0.2), lineWidth: 1)
                                        }
                                        .foregroundColor(Selected == "S" ? Color.orange : Color.white)
                                )
                                .overlay(
                                    Text("S")
                                        .font(.system(size: 26, weight: .semibold))
                                        .foregroundColor(Selected == "S" ? Color.white : Color.black)
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
                                .foregroundColor(Selected == "M" ? Color.orange : Color.white)
                                .if(Selected != "M") { view in
                                    view.shadow(color: Color.black.opacity(0.2), radius: 4, y: 4)
                                }
                                .overlay(
                                    Capsule()
                                        .if(Selected != "M") { view in
                                                view.stroke(Color(red: 0, green: 0, blue: 0, opacity: 0.2), lineWidth: 1)
                                        }
                                        .foregroundColor(Selected == "M" ? Color.orange : Color.white)
                                )
                                .overlay(
                                    Text("M")
                                        .font(.system(size: 26, weight: .semibold))
                                        .foregroundColor(Selected == "M" ? Color.white : Color.black)
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
                                .foregroundColor(Selected == "L" ? Color.orange : Color.white)
                                .if(Selected != "L") { view in
                                    view.shadow(color: Color.black.opacity(0.2), radius: 4, y: 4)
                                }
                                .overlay(
                                    Capsule()
                                        .if(Selected != "L") { view in
                                                view.stroke(Color(red: 0, green: 0, blue: 0, opacity: 0.2), lineWidth: 1)
                                        }
                                        .foregroundColor(Selected == "L" ? Color.orange : Color.white)
                                )
                                .overlay(
                                    Text("L")
                                        .font(.system(size: 26, weight: .semibold))
                                        .foregroundColor(Selected == "L" ? Color.white : Color.black)
                                )
                        }
                    }
                }
                .position(x: geometry.size.width / 2, y: geometry.size.height-200)
                Spacer()
                
            }
            
        }
    }
}

extension View {
    @ViewBuilder func `if`<Content: View>(_ condition: Bool, transform: (Self) -> Content) -> some View {
        if condition {
            transform(self)
        } else {
            self
        }
    }
}

#Preview {
    PizzaApp()
}
