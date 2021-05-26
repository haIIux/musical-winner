//
//  ContentView.swift
//  singledOutCaloriePage
//
//  Created by Rob Maltese on 5/24/21.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var viewModel: UserMetricViewModel
    var body: some View {
        VStack {
            Text(String(viewModel.defaultUserMetricData.ageInput))
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView(viewModel: .init())
    }
}
