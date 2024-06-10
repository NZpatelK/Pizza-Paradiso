//
//  PizzaApp.swift
//  Pizza-Paradiso
//
//  Created by Karan Patel on 28/05/2024.
//

import SwiftUI

struct Pizza: Identifiable, Codable, Hashable {
    var id = UUID()
    var img: String
    var name: String
    var s_price: Float
    var m_pirce: Float
    var l_price: Float
}


class ViewModel: ObservableObject {
    @Published var pizza: [Pizza]

    init() {
        // Initialize ViewModel with some initial data
        self.pizza = [
            Pizza(img: "pizza-1", name: "pepperoni pizza", s_price: 15.99, m_pirce: 20.99, l_price: 28.99 ),
            Pizza(img: "pizza-2", name: "premium pepperoni", s_price: 25.50, m_pirce: 32.50, l_price: 40.50),
            Pizza(img: "pizza-3", name: "Chesse Pizza", s_price: 10.00, m_pirce: 15.00, l_price: 18.00),
            Pizza(img: "pizza-4", name: "Vege Pizza", s_price: 12.99, m_pirce: 18.99, l_price: 24.99)
        ]
    }
}

struct PizzaApp: View {
    @StateObject var viewModel = ViewModel()
    @State private var pizzaSize: CGFloat = 280
    @State private var panSize: CGFloat = 300
    @State private var SelectedColor: Color = Color(red: 0.8, green: 0, blue: 0, opacity: 1)
    @State private var Selected:String = "S"
    @State private var isSelected:Bool = false
    @State private var animate: Bool = false
    
    @State var currentPostion: CGFloat = 0
    @State private var currentSize: KeyPath<Pizza, Float> = \.s_price
    @State var currentPizza:Int = 0
    @State private var swipeDirection: CGFloat = 0
    
    
    var body: some View {
        GeometryReader{ geometry in
            Image("pizzaLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 150)
                .position(x: geometry.size.width / 2, y: 80)
            VStack{
                ZStack {
                    Image("pan")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: panSize, height: panSize)
                        .animation(isSelected ? Animation.interpolatingSpring(stiffness: 300, damping: 10, initialVelocity: 0): .none)
                        .shadow(color: Color(CGColor(genericCMYKCyan: 0, magenta: 0, yellow: 0, black: 1, alpha: 0.4)) , radius: 10)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack{
                            ForEach(viewModel.pizza, id: \.self) { pizza in
                                VStack{
                                    Image(pizza.img)
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
                        }
                        .scrollTargetLayout()
                    }
                    .scrollTargetBehavior(.viewAligned)
                    .simultaneousGesture(
                           DragGesture().onChanged({
                               let isScrollDown = 0 < $0.translation.width
                               currentPostion = $0.translation.width
                               if isScrollDown {
                                   if currentPizza > 0 {
                                       currentPizza -= 1
                                       swipeDirection = -1
                                   }
                               } else {
                                   if currentPizza < viewModel.pizza.count - 1 {
                                       currentPizza += 1
                                       swipeDirection = 1
                                   }
                               }
                               swipeDirection = 0
                           })
                    )
                }
            }
            .position(x: geometry.size.width / 2, y: 320)
            
        
            
            ZStack {
                VStack (spacing: 10){
                    
                    Text("\(viewModel.pizza[currentPizza].name)")
                        .font(.system(size: 26, weight: .heavy))
                        .foregroundStyle(Color(CGColor(genericCMYKCyan: 0, magenta: 0, yellow: 0, black: 0, alpha: 1)))
                        .textCase(.uppercase)
                        .tracking(4)
                        .transition(.slide)
                        .animation(.linear, value: currentPizza)
                    
                    Text("$\(String(format: "%.2f", viewModel.pizza[currentPizza][keyPath: currentSize]))")
                        .font(.system(size: 24, weight: .semibold))
                        .foregroundStyle(Color(CGColor(genericCMYKCyan: 0, magenta: 0, yellow: 0, black: 0, alpha: 1)))
                        .tracking(4)
                        .transition(.slide)
                        .animation(.linear, value: currentPizza)
                }
                .position(x: geometry.size.width/2, y: 60)
                
                VStack{
                    HStack(spacing: 20) {
                        ZStack{
                            Button(action:  {
                                panSize = 300
                                pizzaSize = 280
                                Selected = "S"
                                isSelected = true
                                currentSize = \.s_price
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
                                            .foregroundColor(Selected == "S" ? SelectedColor : Color.white)
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
                                currentSize = \.m_pirce
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
                                            .foregroundColor(Selected == "M" ? SelectedColor : Color.white)
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
                                currentSize = \.l_price
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
                                            .foregroundColor(Selected == "L" ? SelectedColor : Color.white)
                                    )
                                    .overlay(
                                        Text("L")
                                            .font(.system(size: 26, weight: .semibold))
                                            .foregroundColor(Selected == "L" ? Color.white : Color.black)
                                    )
                            }
                        }
                    }
                    .position(x: geometry.size.width / 2, y: 150)
                    Spacer()
                    
                }
            }
            .frame(width: geometry.size.width, height: geometry.size.height/2)
            .background(Color(red: 0.9, green: 0.4, blue: 0, opacity: 1))
            .position(x: geometry.size.width/2  ,y: geometry.size.height-50)
            
        }.background(Color(red: 1, green: 0.63, blue: 0, opacity: 0.5))
        
        Button(action:  {
        })
        {
            Capsule()
                .frame(width: 300, height: 50)
                .foregroundColor(Color.white)
                .shadow(color: Color.black.opacity(0.2), radius: 4, y: 4)
                .overlay(
                    Text("Add Cart")
                        .font(.system(size: 26, weight: .regular))
                        .foregroundColor(Selected == "L" ? Color.white : Color.black)
                )
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
