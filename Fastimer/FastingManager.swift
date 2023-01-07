//
//  FastingManager.swift
//  Fastimer
//
//  Created by Soro on 2023-01-06.
//

import Foundation

enum FastingState {
    case notStarted
    case fasting
    case feeding
}

enum FastingPlan: String {
    case Beginner = "12:12"
    case Intermediate = "16:8"
    case Advanced = "20:4"
    
    var fastingPeriod: Double {
        switch self {
        case .Beginner:
            return 12
        case .Intermediate:
            return 16
        case .Advanced:
            return 20
        }
    }
}


class FastingManager: ObservableObject {
    @Published private(set) var fastingState: FastingState = .notStarted
    @Published private(set) var fastingPlan: FastingPlan = .Intermediate
    @Published private(set) var startTime: Date {
        didSet {
            if fastingState == .fasting {
                endTime = startTime.addingTimeInterval(fastingTime * 60 * 60)
            }else{
                endTime = startTime.addingTimeInterval(feedingTime * 60 * 60) 
            }
        }
    }
    @Published private(set) var endTime: Date {
        didSet {
            //pass
        }
    }
    
    @Published private(set) var elapsed: Bool = false
    
    @Published private(set) var elapsedTime: Double = 0.0
    @Published private(set) var progress: Double = 0.0
    
    var fastingTime: Double {
        return fastingPlan.fastingPeriod
    }
    var feedingTime: Double {
        return 24 - fastingPlan.fastingPeriod
    }
    
    init() {
        let calendar = Calendar.current
//        var components = calendar.dateComponents([.year,.month,.day,.hour],from: Date())
//        components.hour = 20
//
//        let scheduledTime = calendar.date(from: components) ?? Date.now
        let components = DateComponents(hour: 20)
        let scheduledTime = calendar.nextDate(after: .now, matching: components, matchingPolicy: .nextTime)!
        
        startTime = scheduledTime
        endTime = scheduledTime.addingTimeInterval(FastingPlan.Intermediate.fastingPeriod * 60 * 60)
    }
    
    func toggleFastingState() {
        fastingState = fastingState == .fasting ? .feeding : .fasting
        startTime = Date()
        elapsedTime = 0.0
    }
    
    func track(){
        guard fastingState != .notStarted else { return }
        if endTime >= Date() {
            elapsed = false
        } else {
            elapsed = true
        }
        elapsedTime += 1
        
        let totalTime = fastingState == .fasting ? fastingTime : feedingTime
        progress = (elapsedTime / totalTime * 100).rounded() / 100
    }
}
