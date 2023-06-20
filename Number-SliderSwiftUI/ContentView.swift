//
//  ContentView.swift
//  Number-SliderSwiftUI
//
//  Created by Pavel Karunnyj on 20.06.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var valueSlider: Float = Float.random(in: 0...100)
    @State private var targetValue = Int.random(in: 0...100)
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 50) {
            
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
            
            HStack {
                Text("0")
                SliderUIKit(currentValue: $valueSlider, alpha: computeScore())
                Text("100")
            }
            
            Button("Проверь меня!") {
                showAlert = true
            }
            .alert("Your Score", isPresented: $showAlert) {} message: {
                Text("\(computeScore())")
            }
            
            Button("Начать заново") {
                targetValue = Int.random(in: 0...100)
            }
        }
        .padding()
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(Double(valueSlider)))
        return 100 - difference
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
