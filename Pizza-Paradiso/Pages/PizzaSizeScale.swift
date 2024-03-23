//
//  File.swift
//  Pizza-Paradiso
//
//  Created by Karan Patel on 24/03/24.
//

import Foundation
import SwiftUI

struct PizzaSizeScale: View {
    private let pizzaImgs = ["pizza-1", "pizza-2", "pizza-3", "pizza-4"]
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
                
            }
        }
    }
    
}
