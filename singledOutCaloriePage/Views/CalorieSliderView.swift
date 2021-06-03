//
//  CalorieSliderView.swift
//  singledOutCaloriePage
//
//  Created by Rob Maltese on 5/26/21.
//

import SwiftUI

struct CalorieSliderView: View {
    @ObservedObject var dataModel: UserDataViewModel
    @State var selection = 2
    @State var carbohydrateSlider: Double = 50.0
    @State var fatsSlider: Double = 25.0
    @State var proteinSlider: Double = 25.0
    
    var body: some View {
//        var dailyCalories = dataModel.calculateDailyCalories
        let allBindings = [
            $dataModel.carbohydrateSlider,
            $dataModel.fatsSlider,
            $dataModel.proteinSlider
        ]

        VStack {
            Text("Calories:  \(String(format: "%.0f", dataModel.dailyCalories))")
            HStack {
                VStack {
                    Text("Carbohydrates")
                    Text("\(String(format: "%.0f", dataModel.carbohydrateCalculation))")
                }
                VStack {
                    Text("Fats")
                    Text("\(String(format: "%.0f", dataModel.fatCalculation))")
                }
                VStack {
                    Text("Protein")
                    Text("\(String(format: "%.0f", dataModel.proteinCalculation))")
                }
            }
            dataModel.synchronizedSlider(from: allBindings, index: 0)
            dataModel.synchronizedSlider(from: allBindings, index: 1)
            dataModel.synchronizedSlider(from: allBindings, index: 2)
        }
    }
}

//struct CalorieSliderView_Previews: PreviewProvider {
//    static var previews: some View {
//        CalorieSliderView(dataModel: UserDataViewModel())
//    }
//}
