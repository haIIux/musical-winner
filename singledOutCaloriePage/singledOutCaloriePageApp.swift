//
//  singledOutCaloriePageApp.swift
//  singledOutCaloriePage
//
//  Created by Rob Maltese on 5/24/21.
//

import SwiftUI

@main
struct singledOutCaloriePageApp: App {
    let userDataModel = UserDataViewModel()
    var body: some Scene {
        WindowGroup {
            HomeView(userModelViewModel: userDataModel)
        }
    }
}
