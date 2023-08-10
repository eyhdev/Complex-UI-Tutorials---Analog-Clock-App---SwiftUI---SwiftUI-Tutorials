//
//  CountdownView.swift
//  CircleLoader
//
//  Created by eyh.mac on 24.07.2023.
//

import SwiftUI

struct CountdownView: View {
    
    @ObservedObject var viewModel: WorkoutTimerViewModel
    @State private var animationAmount: Double = 1.0
    
    var body: some View {
        VStack {
            Text("\(Int(viewModel.remainingTime))")
                .font(.largeTitle)
                .scaleEffect(animationAmount) // Apply animation to the countdown label
        }
        .onAppear {
            viewModel.startTimer()
        }
        .onReceive(viewModel.$remainingTime) { time in
            withAnimation(.easeInOut(duration: 1)) {
                // Trigger the animation when the remaining time changes
                animationAmount = 1.2 // You can adjust this value for a more noticeable effect
            }
        }
    }
}
