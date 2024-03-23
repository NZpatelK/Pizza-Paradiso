//
//  File.swift
//  Pizza-Paradiso
//
//  Created by Karan Patel on 24/03/24.
//

import Foundation
import SwiftUI

struct PizzaSizeScale: View {
    var body: some View {
        VStack{
            ZStack {
                Image("pan")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 300, height: 300)
                Image("pizza-1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 280, height: 280)
            }
        }
        HStack {
            ZStack{
                Button{
                    print("Tapped")
                } label: {
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
                Button{
                    print("Tapped")
                } label: {
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
                Button{
                    print("Tapped")
                } label: {
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
    }
    
}
