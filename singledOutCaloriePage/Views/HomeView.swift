//
//  HomeView.swift
//  singledOutCaloriePage
//
//  Created by Rob Maltese on 5/26/21.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var userModelViewModel: UserDataViewModel
    @State var selection = 0
    var body: some View {
        TabView(selection: $selection) {
            UserMetricsView(dataModel: userModelViewModel, selection: $selection)
                .tag(0)
            GoalAndActivityView(dataModel: userModelViewModel, selection: $selection)
                .tag(1)
            CalorieOutputView(dataModel: userModelViewModel)
                .tag(2)
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(userModelViewModel: UserDataViewModel())
    }
}
