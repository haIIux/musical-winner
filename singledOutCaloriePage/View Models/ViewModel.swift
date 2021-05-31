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
    

    
    func calculateDailyCalories() {
        switch gender {
        case .male:
            if goal.description.contains("Mild Weight Gain") {
                print("Mild Gain Male :", mildGainMathFinalMale)
                dailyCalories = mildGainMathFinalMale
                print(dailyCalories)
            } else if goal.description.contains("Moderate Weight Gain"){
                print("Moderate Gain Male :", moderateGainMathFinalMale)
                dailyCalories = moderateGainMathFinalMale
            } else if goal.description.contains("Mild Weight Loss") {
                print("Mild Loss Male :", mildLossFinalMathMale)
                dailyCalories = mildLossFinalMathMale
            } else if goal.description.contains("Moderate Weight Loss") {
                print("Moderate Loss Male :", moderateLossFinalMathMale)
                dailyCalories = moderateLossFinalMathMale
            } else if goal.description.contains("Maintain Weight") {
                print("Maintain Weight Male :", maintainWeightActivityMaleFinal)
                dailyCalories = maintainWeightActivityMaleFinal
            }
        case .female:
            if goal.description.contains("Mild Weight Gain") {
                print("Mild Gain Female :", mildGainMathFinalFemale)
            } else if goal.description.contains("Moderate Weight Gain"){
                print("Moderate Gain Female :", moderateGainMathFinalFemale)
            } else if goal.description.contains("Mild Weight Loss") {
                print("Mild Loss Female :", mildLossFinalMathFemale)
            } else if goal.description.contains("Moderate Weight Loss") {
                print("Moderate Loss Female :", moderateLossFinalMathFemale)
            } else if goal.description.contains("Maintain Weight") {
                print("Maintain Weight Female :", maintainWeightActivityFemaleFinal)
            }
        }
    }
    
    // MARK: - Male Math
    var mildGainGoalSelectedActivityMathMale: Double {
        maleBMR * activityLevel.rawValue
    } //
    var mildGainGoalSelectedMathMale: Double {
        mildGainGoalSelectedActivityMathMale * goal.rawValue
    } //
    var mildGainMathFinalMale: Double {
        mildGainGoalSelectedActivityMathMale + mildGainGoalSelectedMathMale
    } //
    var moderateGainGoalSelectedActivityMathMale: Double {
        maleBMR * activityLevel.rawValue
    } 
    var moderateGainGoalSelectedMathMale: Double {
        moderateGainGoalSelectedActivityMathMale * goal.rawValue
    }
    var moderateGainMathFinalMale: Double {
        moderateGainGoalSelectedActivityMathMale + moderateGainGoalSelectedMathMale
    }
    var mildLossSelectedActivityMale: Double {
        maleBMR * activityLevel.rawValue
    }
    var mildLossSelectedGoalMale: Double {
        mildLossSelectedActivityMale * goal.rawValue
    }
    var mildLossFinalMathMale: Double {
       mildLossSelectedActivityMale - mildLossSelectedGoalMale
    }
    var moderateLossSelectedActivityMale: Double {
        maleBMR * activityLevel.rawValue
    }
    var moderateLossSelectedGoalMale: Double {
        moderateLossSelectedActivityMale * goal.rawValue
    }
    var moderateLossFinalMathMale: Double {
        moderateLossSelectedActivityMale - moderateLossSelectedGoalMale
    }
    var maintainWeightActivityMaleFinal: Double {
        maleBMR * activityLevel.rawValue
    }
//    var maintainWeightFinalMathMale: Double {
//        maintainWeightActivityMale + maleBMR
//    }
    
    // MARK: - Female Math
    
    var mildGainGoalSelectedActivityMathFemale: Double {
        femaleBMR * activityLevel.rawValue
    }
    var mildGainGoalSelectedMathFemale: Double {
        mildGainGoalSelectedActivityMathFemale * goal.rawValue
    }
    var mildGainMathFinalFemale: Double {
        mildGainGoalSelectedActivityMathFemale + mildGainGoalSelectedMathFemale
    }
    var moderateGainGoalSelectedActivityMathFemale: Double {
        femaleBMR * activityLevel.rawValue
    }
    var moderateGainGoalSelectedMathFemale: Double {
        moderateGainGoalSelectedActivityMathFemale * goal.rawValue
    }
    var moderateGainMathFinalFemale: Double {
        moderateGainGoalSelectedActivityMathFemale + moderateGainGoalSelectedMathFemale
    }
    var mildLossSelectedActivityFemale: Double {
        femaleBMR * activityLevel.rawValue
    }
    var mildLossSelectedGoalFemale: Double {
        mildLossSelectedActivityFemale * goal.rawValue
    }
    var mildLossFinalMathFemale: Double {
        mildLossSelectedActivityFemale - mildLossSelectedGoalFemale
    }
    var moderateLossSelectedActivityFemale: Double {
        femaleBMR * activityLevel.rawValue
    }
    var moderateLossSelectedGoalFemale: Double {
        moderateLossSelectedActivityFemale * goal.rawValue
    }
    var moderateLossFinalMathFemale: Double {
        moderateLossSelectedActivityFemale - moderateLossSelectedGoalFemale
    }
    var maintainWeightActivityFemaleFinal: Double {
        femaleBMR * activityLevel.rawValue

    }
//    var maintainWeightFinalMathFemale: Double {
//        maintainWeightActivityFemale + femaleBMR
//    }
    
    var convertImperialHeight: Double {
         Measurement(value: userData!.heightFeet, unit: UnitLength.feet)
            .converted(to: UnitLength.centimeters)
            .value
         + Measurement(value: userData!.heightInches, unit: UnitLength.inches)
            .converted(to: UnitLength.centimeters)
            .value
    }
    
    var convertImperialWeight: Double {
        Measurement(value: userData!.weight, unit: UnitMass.pounds)
            .converted(to: UnitMass.kilograms)
            .value
    }
    
    var maleBMR: Double {
        let stepOne = convertImperialWeight * 10
        let stepTwo = convertImperialHeight * 6.25
        let stepThree = userData!.age * 5
        let stepFour = Int(stepOne + stepTwo) - stepThree + 5
        let stepFive = Double(stepFour) - goal.rawValue
        
        return stepFive
    }

    var femaleBMR: Double {
        let stepOne = convertImperialWeight * 10
        let stepTwo = convertImperialHeight * 6.25
        let stepThree = Double(userData!.age) * 5
        let stepFour = stepOne + stepTwo - stepThree - 161
        
        return stepFour
    }

    var carbohydrateCalculation: Double {
        let defaultCarbohydrateMultiplyer: Double = 0.50
        
        let getCarbCalories = dailyCalories * defaultCarbohydrateMultiplyer
        return getCarbCalories / 4
        
    }
    
    var fatCalculation: Double {
        let defaultFatMultiplyer: Double = 0.25
        let getFatCalories = dailyCalories * defaultFatMultiplyer
        return getFatCalories / 9
    }
        
    var proteinCalculation: Double {
        let defaultProtienMultiplyer: Double = 0.25
        let getProteinCalories = dailyCalories * defaultProtienMultiplyer
        return getProteinCalories / 4
    }
}
//    func calculateBMR() -> Double {
//        let userHeightInput = convertImperialHeight
//        let userWeightInput = convertImperialWeight
//        let userAgeInput = (userData?.age)!
//
//
//        switch gender {
//        case .male:
//            let stepOne = userWeightInput * 10
//            let stepTwo = userHeightInput * 6.25
//            let stepThree = userAgeInput * 5
//            let stepFour = Int(stepOne + stepTwo) - stepThree + 5
//            let stepFive = Double(stepFour) - goal.rawValue
//
//            return stepFive
//        case .female:
//            let stepOne = userWeightInput * 10
//            let stepTwo = userHeightInput * 6.25
//            let stepThree = Double(userAgeInput) * 5
//            let stepFour = stepOne + stepTwo - stepThree - 161
//
//            return stepFour
//        }
//    }
//    func convertImperialHeightToCM() -> Double {
//        let convertFeetToCm = Measurement(value: userData!.heightFeet, unit: UnitLength.feet)
//            .converted(to: UnitLength.centimeters)
//        let convertInchesToCm = Measurement(value: userData!.heightInches, unit: UnitLength.inches)
//            .converted(to: UnitLength.centimeters)
//        let addUpCentimeters = convertFeetToCm + convertInchesToCm
//        return addUpCentimeters.value
//    }
//    func convertImperialWeight() -> Double {
//        let usersPounds = Measurement(value: userData!.weight, unit: UnitMass.pounds)
//            .converted(to: UnitMass.kilograms)
//        return usersPounds.value
//    }
//
//    func calculateMaleBMR() -> Double {
//        let userHeightInput = convertImperialHeight
//        let userWeightInput = convertImperialWeight
//        let userAgeInput = (userData!.age)
//
//        let stepOne = userWeightInput * 10
//        let stepTwo = userHeightInput * 6.25
//        let stepThree = userAgeInput * 5
//        let stepFour = Int(stepOne + stepTwo) - stepThree + 5
//        let stepFive = Double(stepFour) - goal.rawValue
//
//        return stepFive
//
//    }
//    func calculateProtein() -> Double {
//        let defaultProtienMultiplyer: Double = 0.25
//        let getProteinCalories = dailyCalories * defaultProtienMultiplyer
//        let getProteinMacros = getProteinCalories / 4
//        return getProteinMacros
//    }
//}
//    func calculateFat() -> Double {
//        let defaultFatMultiplyer: Double = 0.25
//        let getFatCalories = dailyCalories * defaultFatMultiplyer
//        let getFatMacros = getFatCalories / 9
//        return getFatMacros
//    }
//    func calculateCarbohydrates() -> Double {
//        let defaultCarbohydrateMultiplyer: Double = 0.50
//        let getCarbCalories = dailyCalories * defaultCarbohydrateMultiplyer
//        let getCarbMacros = getCarbCalories / 4
//        return getCarbMacros
//    }
//
//    func calculateFemaleBMR() -> Double {
//        let userHeightInput = convertImperialHeight
//        let userWeightInput = convertImperialWeight
//        let userAgeInput = (userData!.age)
//
//        let stepOne = userWeightInput * 10
//        let stepTwo = userHeightInput * 6.25
//        let stepThree = Double(userAgeInput) * 5
//        let stepFour = stepOne + stepTwo - stepThree - 161
//
//        return stepFour
//    }


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
