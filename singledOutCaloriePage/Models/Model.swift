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

enum GoalSelector: Double, CaseIterable {
    
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


struct UserMetricData {
    @Binding var ageInput: Int
    @Binding var weightInput: Int
    @Binding  var heightFeet: Int
    @Binding  var heightInches: Int
    
    init(ageInput: Binding<Int>, weightInput: Binding<Int>, heightFeet: Binding<Int>, heightInches: Binding<Int>) {
        self._ageInput = ageInput
        self._weightInput = weightInput
        self._heightFeet = heightFeet
        self._heightInches = heightInches
    }
}

