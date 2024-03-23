//
//  File.swift
//  Pizza-Paradiso
//
//  Created by Karan Patel on 24/03/24.
//

import Foundation
import SwiftUI

struct PizzaSizeScale: View {
    
    @State private var pizzaSize: CGFloat = 280
    @State private var panSize: CGFloat = 300
    @State private var isClicked:Bool = false
    
    var body: some View {
        VStack(){
            ZStack {
                Image("pan")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: panSize, height: panSize)
                    .animation(isClicked ? Animation.interpolatingSpring(stiffness: 300, damping:8 , initialVelocity: 0) : .none)
                Image("pizza-1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: pizzaSize, height: pizzaSize)
                    .animation(isClicked ? Animation.interpolatingSpring(stiffness: 300, damping: 8, initialVelocity: 0) : .none)
                 
            }
        }
        Spacer()
        HStack(spacing: 20) {
            ZStack{
                Button(action:  {
                    panSize = 300
                    pizzaSize = 280
                    isClicked = true
                })
                {
                    Capsule()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.orange)
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
                    isClicked = true
                })
                {
                    Capsule()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.gray)
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
                    isClicked = true
                })
                {
                    Capsule()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.gray)
                        .overlay(
                            Text("L")
                                .font(.system(size: 16, weight: .semibold))
                                .foregroundColor(Color.white)
                        )
                }
            }
        }
        Spacer()
    }
    
}
