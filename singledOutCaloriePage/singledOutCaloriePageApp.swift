//
//  singledOutCaloriePageApp.swift
//  singledOutCaloriePage
//
//  Created by Rob Maltese on 5/24/21.
//

import SwiftUI

@main
struct singledOutCaloriePageApp: App {
    @State var ageInput = 0
    @State var weightInput = 0
    @State var heightFeet = 0
    @State var heightInches = 0
    var body: some Scene {
        WindowGroup {
            UserMetricsView(viewModel: .init(ageInput: $ageInput, weightInput: $heightFeet, heightFeet: $heightFeet, heightInches: $heightInches))
        }
    }
}
