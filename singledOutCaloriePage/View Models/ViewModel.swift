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
    
    
    
    func calculateMaleBMR(weight: Int, height: Int, age: Int) -> Double {
        
        let userWeightInput = ImperialWeight(pounds: Double(userData?.weight))
        let userHeightInput = userData?.height
        let userAgeInput = userData?.age
        
        
    }
    
//        func maleBMR() -> Double {
//
//                let userHeightInput = ImperialWeight.init(pounds: userData?.weight!)
//                let userWeightInput = userData?.weight
//                guard let userAgeInput = userData?.age else { return 0.0 }
//            
//                
//
//                let stepOne = 10 * userWeightInput         // weightConversionFunction
//                let stepTwo = 6.25 * Double(userData.height  )          // heightConversionFunction
//                let stepThree = 5 * userAgeInput                    // Age in Years.
//                let stepFour = stepOne + stepTwo - stepThree + 5
//                let stepFive = stepFour - goal.rawValue
//    
//                return Double(stepFive)
//            }
    //
    //        func femaleBMR() -> Double {
    //            let heightConversionFunction = ConvertHeight()
    //            let weightConversionFunction = convertPoundsToKg()
    //
    //            let stepOne = 10 * weightConversionFunction
    //            let stepTwo = 6.25 * heightConversionFunction
    //            let stepThree = 5 * Double(ageInput)! // Age in Years.
    //            let stepFour = stepOne + stepTwo - stepThree - 161
    //
    //            return Double(stepFour)
    //        }
    //
    //        func carbohydrateMath() -> Double {
    //            let defaultCarbohydratesValue: Double = 0.50
    //            let getCarbCalories = dailyCalories * defaultCarbohydratesValue
    //            let getCarbMacros = getCarbCalories / 4
    //
    //            return getCarbMacros
    //        }
    //
    //        func fatMath() -> Double {
    //            let defaultFatValue: Double = 0.25
    //            let getFatCalories = dailyCalories * defaultFatValue
    //            let getFatMacros = getFatCalories / 9
    //
    //            return getFatMacros
    //        }
    //
    //        func proteinMath() -> Double {
    //            let defaultProteinValue: Double = 0.25
    //            let getProteinCalories = dailyCalories * defaultProteinValue
    //            let getProteinMacros = getProteinCalories / 4
    //
    //            return getProteinMacros
    //        }
}

// Use the View Model to get the input from the UserMetricView TextFields, then parse the data and let the view call for it.

//struct DisplayTextFieldData {
//    // Access the class here, then get the data from it. Then on the View we will call the data from THIS... figure out how to fix the error below.
//    let userDataAccess = UserDataViewModel()
//    var body: some View {
//        if let age = userDataAccess.userData.age {
//            Text("User Age: \(age)")
//        } else {
//            Text("User Age Unknown")
//        }
//    }
//}


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
