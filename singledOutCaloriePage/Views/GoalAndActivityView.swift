//
//  GoalAndActivityView.swift
//  singledOutCaloriePage
//
//  Created by Rob Maltese on 5/26/21.
//

import SwiftUI

// Current data model setup will cause issues as it takes a new "picture" or crates a new "state", wiping the other input.

struct GoalAndActivityView: View {
    @ObservedObject var dataModel = UserDataViewModel()
    @State var selection = 1
    var body: some View {
        VStack {
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
        }
    }
}

struct GoalAndActivityView_Previews: PreviewProvider {
    static var previews: some View {
        GoalAndActivityView()
    }
}
