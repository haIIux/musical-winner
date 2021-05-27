//
//  UserMetricsView.swift
//  singledOutCaloriePage
//
//  Created by Rob Maltese on 5/26/21.
//

import SwiftUI

struct UserMetricsView: View {
    @ObservedObject var dataModel = UserDataViewModel()
    @State var selection = 0
    var body: some View {
        NavigationView {
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
                    TextField("Age", value: $dataModel.userData.age, formatter: NumberFormatter())
                    TextField("Weight", value: $dataModel.userData.weight, formatter: NumberFormatter())
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                HStack {
                    TextField("Height", value: $dataModel.userData.height, formatter: NumberFormatter())
                    TextField("Height", value: $dataModel.userData.height, formatter: NumberFormatter())
                }
                .textFieldStyle(RoundedBorderTextFieldStyle())
                Divider()
                    .padding()
                Text("Data in Models from View Models").font(.headline).padding(.bottom)
                Button("Print Me!") {
                    print(dataModel.userData)
                }
            }
            .padding()
        }
    }
}


struct UserMetricsView_Previews: PreviewProvider {
    static var previews: some View {
        UserMetricsView()
    }
}
