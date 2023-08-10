//
//  WorkoutTimerViewModel.swift
//  CircleLoader
//
//  Created by eyh.mac on 24.07.2023.
//
import SwiftUI
import Combine

class WorkoutTimerViewModel: ObservableObject {
    @Published var remainingTime: TimeInterval = 60 // Initial time in seconds
    var timer: Timer?
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [weak self] _ in
            guard let self = self else { return }
            if self.remainingTime > 0 {
                self.remainingTime -= 1
            } else {
                self.stopTimer()
            }
        }
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
}

