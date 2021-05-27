//
//  Model.swift
//  singledOutCaloriePage
//
//  Created by Rob Maltese on 5/26/21.
//

import Foundation
import SwiftUI

/*
 Model
 - Handles all sources of truth such as default values and such.
 */

// Pickers
enum GenderPickerSelector: String, CaseIterable {
    case male
    case female
}

enum ActivityLevelSelector: Double, CaseIterable {
    case sedentary = 1.2
    case lightlyActive = 1.375
    case moderatelyActive = 1.55
    case veryActive = 1.725
    
    var description: String {
        switch self {
        case .sedentary:
            return "Sedentary"
        case .lightlyActive:
            return "Lightly Active"
        case .moderatelyActive:
            return "Moderately Active"
        case .veryActive:
            return "Very Active"
        }
    }
}

enum WeightGoal: Double, CaseIterable, Identifiable {
    var id: RawValue { rawValue }
    
    case mildWeightLoss = 0.18 // 18% deficit.
    case moderateWeightLoss = 0.25 // 25% deficit.
    case maintainWeight = 0.0 // No weight loss or gain.
    case mildWeightGain = 0.1 // 10% gain.
    case moderateWeightGain = 0.2 // 20% gain.
    
    var description: String {
        switch self {
        case .mildWeightLoss:
            return "Mild Weight Loss"
        case .moderateWeightLoss:
            return "Moderate Weight Loss"
        case .maintainWeight:
            return "Maintain Weight"
        case .mildWeightGain:
            return "Mild Weight Gain"
        case .moderateWeightGain:
            return "Moderate Weight Gain"
        }
    }
}


protocol Height {
    var heightInCentimeters: Int { get }
}

struct ImperialHeight: Height {
    var feet: Int
    var inches: Int
    
    var heightInCentimeters: Int {
        Int(((Double(feet) * 12.0)) + Double(inches) * 2.54)
    }
}

struct MetricHeight: Height {
    var heightInCentimeters: Int
}

protocol Weight {
    var weightInKilograms: Int { get }
}

struct ImperialWeight: Weight {
    var pounds: Int
    
    var weightInKilograms: Int {
        Int(Double(pounds) * 0.4535924)
    }
}

struct MetricWeight {
    var weightInKilograms: Int
}



struct UserData {
    var age: Int = 18
    var weight: Weight
    var height: Height
}

struct CalculationData {
    var showAlert = false
    
    var dailyCalories: Double = 2000.0
    var carbohydrateSlider = 50.0
    var fatsSlider = 25.0
    var proteinSlider = 25.0
    
    var defaultCarbohydrateValue: Double = 0.50
    var defaultFatValue: Double = 0.25
    var defaultProteinValue: Double = 0.25
    
    var carbsOutputText = 0.0
    var fatsOutputText = 0.0
    var proteinOutputText = 0.0
}
