//
//  ContentView.swift
//  Pizza-Paradiso
//
//  Created by Karan Patel on 23/03/24.
//

import SwiftUI
struct ContentView: View {
   
    var body: some View {
        NavigationView {
                    List {
                        NavigationLink(destination: PizzaRotateSlide()) {
                            Text("Pizza Rotation Slide")
                        }
                        NavigationLink(
                            destination: PizzaScaleUpSlide(),
                            label: {
                                Text("Pizza Scale Up Slide")
                            })
                    }
                    .navigationTitle("Main Menu")
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
