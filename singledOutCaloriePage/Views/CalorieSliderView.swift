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
    var body: some View {
        let dailyCalories = dataModel.dailyCalories
        VStack {
            Text("Calories:  \(String(format: "%.0f", dataModel.maleBMR))")
        
        }
    }
}

struct CalorieSliderView_Previews: PreviewProvider {
    static var previews: some View {
        CalorieSliderView(dataModel: UserDataViewModel())
    }
}
