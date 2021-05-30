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
    @State var isAlertPresented = false
    
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
                    .keyboardType(.numberPad)
                TextField("Weight", text: $weight)
                    .keyboardType(.numberPad)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            HStack {
                TextField("Feet", text: $heightFeet)
                    .keyboardType(.numberPad)
                TextField("Inches", text: $heightInches)
                    .keyboardType(.numberPad)
            }
            .textFieldStyle(RoundedBorderTextFieldStyle())
            
            Divider()
                .padding()
            Button(action: {
                if let data = UserData(age: age, weight: weight, heightInches: heightInches, heightFeet: heightFeet) {
                    dataModel.userData = data
                    if selection == 0 {
                        withAnimation { selection = 1 }
                    }
                }
            }, label: {
                HStack {
                    Text("Next")
                    Image(systemName: "arrow.right")
                }
            })
        }
        .padding()
    }
}
    
    
    struct UserMetricsView_Previews: PreviewProvider {
        static var previews: some View {
            UserMetricsView(dataModel: UserDataViewModel(), selection: .constant(0))
        }
    }
