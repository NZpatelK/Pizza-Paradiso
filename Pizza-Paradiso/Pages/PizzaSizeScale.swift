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
    @State private var Selected:String = "S"
    @State private var isSelected:Bool = false
    
    var body: some View {
        GeometryReader{ geometry in
            VStack(){
                ZStack {
                    Image("pan")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: panSize, height: panSize)
                        .animation(isSelected ? Animation.interpolatingSpring(stiffness: 300, damping:10, initialVelocity: 0) : .none)
                    Image("pizza-1")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: pizzaSize, height: pizzaSize)
                        .animation(isSelected ? Animation.interpolatingSpring(stiffness: 300, damping: 10, initialVelocity: 0): .none)
                    
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
