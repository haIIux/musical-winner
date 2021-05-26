//
//  UserMetricsView.swift
//  singledOutCaloriePage
//
//  Created by Rob Maltese on 5/26/21.
//

import SwiftUI

struct UserMetricsView: View {
    @ObservedObject var viewModel: UserMetricViewModel
    
    var body: some View {
        VStack {
            Text("Calorie Calculator")
            HStack {
                TextField("Age", value: $viewModel.ageInput, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Weight", value: $viewModel.weightInput, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
            HStack {
                TextField("Feet", value: $viewModel.heightFeet, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                TextField("Inches", value: $viewModel.heightInches, formatter: NumberFormatter())
                    .textFieldStyle(RoundedBorderTextFieldStyle())
            }
        }
        .padding(.horizontal, 50)
    }
}

//struct UserMetricsView_Previews: PreviewProvider {
//    static var previews: some View {
//        UserMetricsView()
//    }
//}
