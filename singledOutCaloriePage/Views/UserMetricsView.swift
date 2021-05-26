//
//  UserMetricsView.swift
//  singledOutCaloriePage
//
//  Created by Rob Maltese on 5/26/21.
//

import SwiftUI

struct UserMetricsView: View {
    @ObservedObject var viewModel: UserMetricViewModel
    
    var body: some View {
        VStack {
            Text("Calorie Calculator")
            HStack {
                TextField("Age", value: $viewModel.defaultUserMetricData, formatter: NumberFormatter())
            }
        }
    }
}

struct UserMetricsView_Previews: PreviewProvider {
    static var previews: some View {
        UserMetricsView(viewModel: .init())
    }
}
