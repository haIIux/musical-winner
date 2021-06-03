//
//  GoalAndActivityView.swift
//  singledOutCaloriePage
//
//  Created by Rob Maltese on 5/26/21.
//

import SwiftUI

struct GoalAndActivityView: View {
    @ObservedObject var dataModel: UserDataViewModel
    @State var selection = 1
    
    var body: some View {
        VStack {
            Spacer()
            Text("Please select your activity level.")
            Picker("Activity Level", selection: $dataModel.activityLevel) {
                ForEach(ActivityLevelSelector.allCases, id: \.self) {
                    Text($0.description.capitalized)
                }
            }
            Text("Please select your goal.")
            Picker("Goal", selection: $dataModel.goal) {
                ForEach(WeightGoal.allCases, id: \.self) {
                    Text($0.description.capitalized)
                }
            }
            Divider()
                .padding()
            Text("Once you have made your selections, click the button below.")
            Button(action: {
                if selection == 1 {
                    withAnimation { selection = 2 }
                    
                }
            }, label: {
                HStack {
                    Text("Calculate")
                    Image(systemName: "arrow.right")
                }
            })
            Spacer()
        }
    }
}

struct GoalAndActivityView_Previews: PreviewProvider {
    static var previews: some View {
        GoalAndActivityView(dataModel: UserDataViewModel())
    }
}
