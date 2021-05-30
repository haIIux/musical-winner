//
//  ViewModel.swift
//  singledOutCaloriePage
//
//  Created by Rob Maltese on 5/26/21.
//

import Foundation
import SwiftUI

class UserDataViewModel: ObservableObject {
    
    @Published var userData: UserData?
    @Published var calculationData: CalculationData = CalculationData()
    
    @Published var goal: WeightGoal = WeightGoal.maintainWeight
    @Published var gender: GenderPickerSelector = GenderPickerSelector.male
    @Published var activityLevel: ActivityLevelSelector = ActivityLevelSelector.moderatelyActive
    
    @State var dailyCalories: Double = 0.0
    @State var age: Double = 0.0
    @State var weight: Double = 0.0
    @State var heightFeet: Double = 0.0
    @State var heightInches: Double = 0.0
    
    
    // Try Measurements?
    @State var height = 0
    func calculateBMR() -> Double {
        let userHeightInput = convertImperialHeightToCM()
        let userWeightInput = convertImperialWeight()
        let userAgeInput = (userData?.age)!
        
        
        switch gender {
        case .male:
            let stepOne = userWeightInput * 10
            let stepTwo = userHeightInput * 6.25
            let stepThree = userAgeInput * 5
            let stepFour = Int(stepOne + stepTwo) - stepThree + 5
            let stepFive = Double(stepFour) - goal.rawValue
            
            return stepFive
        case .female:
            let stepOne = userWeightInput * 10
            let stepTwo = userHeightInput * 6.25
            let stepThree = Double(userAgeInput) * 5
            let stepFour = stepOne + stepTwo - stepThree - 161
            
            return stepFour
        }
    }
    
//    func recommendedDailyCaloriesWithSelectionsMade() -> Double {
//        let userCalories = calculateBMR()
//        let selectedGoal = goal.rawValue
//        let activityLevel = activityLevel.rawValue
//        
//        switch gender {
//        case .male:
//            if goal.description.contains("Mild Weight Gain") {
//                
//                func mildGainGoalSelectedActivityMath() -> Double {
//                    let updatedBMR = userCalories * activityLevel
//                    return updatedBMR
//                }
//                
//                func mildGainGoalSelectedMath() -> Double {
//                    let updatedBMR = mildGainGoalSelectedActivityMath()
//                    let goalSelectionMath = updatedBMR * selectedGoal
//                    return goalSelectionMath
//                }
//                
//                func mildGainUpdateBMR() -> Double {
//                    
//                }
//            }
//            //
//        }
//        
//        return 0.0
//    }
//    
    func convertImperialHeightToCM() -> Double {
        
        let convertFeetToCm = Measurement(value: userData!.heightFeet, unit: UnitLength.feet)
            .converted(to: UnitLength.centimeters)
        
        let convertInchesToCm = Measurement(value: userData!.heightInches, unit: UnitLength.inches)
            .converted(to: UnitLength.centimeters)
        
        let addUpCentimeters = convertFeetToCm + convertInchesToCm
        
        return addUpCentimeters.value
    }
    
    func convertImperialWeight() -> Double {
        let usersPounds = Measurement(value: userData!.weight, unit: UnitMass.pounds)
            .converted(to: UnitMass.kilograms)
        return usersPounds.value
    }
    
    func calculateMaleBMR() -> Double {
        let userHeightInput = convertImperialHeightToCM()
        let userWeightInput = convertImperialWeight()
        let userAgeInput = (userData!.age)
        
        let stepOne = userWeightInput * 10
        let stepTwo = userHeightInput * 6.25
        let stepThree = userAgeInput * 5
        let stepFour = Int(stepOne + stepTwo) - stepThree + 5
        let stepFive = Double(stepFour) - goal.rawValue
        
        return stepFive
        
    }
    
    func calculateFemaleBMR() -> Double {
        let userHeightInput = convertImperialHeightToCM()
        let userWeightInput = convertImperialWeight()
        let userAgeInput = (userData!.age)
        
        let stepOne = userWeightInput * 10
        let stepTwo = userHeightInput * 6.25
        let stepThree = Double(userAgeInput) * 5
        let stepFour = stepOne + stepTwo - stepThree - 161
        
        return stepFour
    }
    
    func calculateCarbohydrates() -> Double {
        let defaultCarbohydrateMultiplyer: Double = 0.50
        let dailyCalories = calculateMaleBMR()
        let getCarbCalories = dailyCalories * defaultCarbohydrateMultiplyer
        let getCarbMacros = getCarbCalories / 4
        return getCarbMacros
    }
    
    func calculateFat() -> Double {
        let defaultFatMultiplyer: Double = 0.25
        let getFatCalories = dailyCalories * defaultFatMultiplyer
        let getFatMacros = getFatCalories / 9
        return getFatMacros
    }
    
    func calculateProtein() -> Double {
        let defaultProtienMultiplyer: Double = 0.25
        let getProteinCalories = dailyCalories * defaultProtienMultiplyer
        let getProteinMacros = getProteinCalories / 4
        return getProteinMacros
    }
}




/*
 
 func synchronizedSlider(from bindings: [Binding<Double>], index: Int) -> some View {
 return Slider(value: synchronizedBinding(from: bindings, index: index), in: 0...100)
 }
 func synchronizedBinding(from bindings: [Binding<Double>], index: Int) -> Binding<Double> {
 
 return Binding(get: {
 return bindings[index].wrappedValue
 }, set: { [self] newValue in
 
 let sum = bindings.indices
 .lazy
 .filter{ $0 != index }
 .map{ bindings[$0]
 .wrappedValue }
 .reduce(0.0, +)
 
 
 let remaining = 100.0 - newValue
 
 if sum != 0.0 {
 for i in bindings.indices {
 if i != index {
 bindings[i].wrappedValue = bindings[i].wrappedValue * remaining / sum
 }
 }
 } else {
 let newOtherValue = remaining / Double(bindings.count - 1)
 for i in bindings.indices {
 if i != index {
 bindings[i].wrappedValue = newOtherValue
 }
 }
 }
 bindings[index].wrappedValue = newValue
 //                calculationData.carbsOutputText = carbohydrateMath() / 100
 //                calculationData.fatsOutputText  = fatMath() / 100
 //                calculationData.proteinOutputText = proteinMath() / 100
 
 })
 }
 
 */
