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


struct UserData {
    var age: Int
    var weight: Double
//    var height: Double
    
    var heightFeet: Double
    var heightInches: Double
    
    init?(age: String, weight: String, heightInches: String, heightFeet: String) {
        
        let filteredAge = age.filter { "0123456789".contains($0) }
        guard let validAgeInput = Int(filteredAge) else {
            return nil
        }
        self.age = validAgeInput
        
        let filteredWeight = weight.filter { "0123456789".contains($0) }
        guard let validWeightInput = Double(filteredWeight) else {
            return nil
        }
        self.weight = validWeightInput
//
//        let filteredHeight = height.filter { "0123456789".contains($0) }
//        guard let validHeight = Double(filteredHeight) else {
//            return nil
//        }
//        self.height = validHeight
        
        let filteredFeet = heightFeet.filter { "0123456789".contains($0) }
        guard let validFeet = Double(filteredFeet) else {
            return nil
        }
        self.heightFeet = validFeet
        
        let filteredInches = heightInches.filter { "0123456789".contains($0) }
        guard let validInches = Double(filteredInches) else {
            return nil
        }
        self.heightInches = validInches
    }
}


struct CalculationData {
    var showAlert = false
    
    @Binding var carbohydrateSlider: Double
    @Binding var fatsSlider: Double
    @Binding var proteinSlider: Double 
    
    var defaultCarbohydrateValue: Double = 0.50
    var defaultFatValue: Double = 0.25
    var defaultProteinValue: Double = 0.25
    
    var carbsOutputText = 0.0
    var fatsOutputText = 0.0
    var proteinOutputText = 0.0
}
