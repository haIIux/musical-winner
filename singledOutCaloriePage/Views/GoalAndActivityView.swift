//
//  GoalAndActivityView.swift
//  singledOutCaloriePage
//
//  Created by Rob Maltese on 5/26/21.
//

import SwiftUI

struct GoalAndActivityView: View {
    @ObservedObject var dataModel: UserDataViewModel
    @Binding var selection: Int

    var body: some View {
        VStack {
            Spacer()
            Text("Please select your activity level.")
                .bold()
            Picker("Activity Level", selection: $dataModel.activityLevel) {
                ForEach(ActivityLevelSelector.allCases, id: \.self) {
                    Text($0.description.capitalized)
                }
            }
            .pickerStyle(WheelPickerStyle())
            Text("Please select your goal.")
                .bold()
            Picker("Goal", selection: $dataModel.goal) {
                ForEach(WeightGoal.allCases, id: \.self) {
                    Text($0.description.capitalized)
                }
            }
            .pickerStyle(WheelPickerStyle())
            Divider()
                .padding()
            Text("Once you have made your selections, click the button below.")
            Button(action: {
                if selection == 1 {
                    withAnimation {
                        selection = 2
                        dataModel.dailyCalories = dataModel.calculateDailyCalories
                    }
                    
                }
            }, label: {
                HStack {
                    Text("Calculate")
                    Image(systemName: "arrow.right")
                }
                .padding(10)
            })
                .foregroundColor(.white)
                .background(.blue)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .continuous))
                .buttonStyle(.borderedProminent)
            Spacer()
        }
    }
}

//struct GoalAndActivityView_Previews: PreviewProvider {
//    static var previews: some View {
//        GoalAndActivityView(dataModel: UserDataViewModel())
//    }
//}
