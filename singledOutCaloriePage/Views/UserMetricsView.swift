//
//  UserMetricsView.swift
//  singledOutCaloriePage
//
//  Created by Rob Maltese on 5/26/21.
//


/*
 
 Model was developed correct, ViewModel will handle math logic. TextField values were adapted to properly update on receive by using "text" over "value". Nested views within TabView in HomeView and set the Selection as a State on the HomeView to allow the UserMetricView to update the selection value.
 
 See notes on Model init.
  */

import SwiftUI
import Combine

struct UserMetricsView: View {
    @ObservedObject var dataModel: UserDataViewModel
    @State var age = ""
    @State var weight = ""
    @State var heightInches = ""
    @State var heightFeet = ""
    @State var height = ""
    
    @Binding var selection: Int
    var body: some View {
        VStack {
            Text("Calorie Calculator")
                .bold()
                .font(.title3)
            Divider()
                .padding()
            Picker("Gender", selection: $dataModel.gender) {
                ForEach(GenderPickerSelector.allCases, id: \.self) {
                    Text($0.rawValue.capitalized)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            Divider()
                .padding()
            HStack {
                TextField("Age", text: $age)
                TextField("Weight", text: $weight)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            HStack {
                TextField("Feet", text: $heightFeet)
                TextField("Inches", text: $heightInches)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Divider()
                .padding()
            Text("Data in Models from View Models").font(.headline).padding(.bottom)
            Button("Next") {
                if let data = UserData(age: age, weight: weight, height: height ) {
                    dataModel.userData = data
                    if selection == 0 {
                        withAnimation { selection = 1 }
                    }
                } else {
                    // ALERT HERE
                }
            }
        }
        .padding()
    }
}


struct UserMetricsView_Previews: PreviewProvider {
    static var previews: some View {
        UserMetricsView(dataModel: UserDataViewModel(), selection: .constant(0))
    }
}
