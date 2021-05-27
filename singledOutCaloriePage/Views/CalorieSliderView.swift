//
//  CalorieSliderView.swift
//  singledOutCaloriePage
//
//  Created by Rob Maltese on 5/26/21.
//

import SwiftUI

struct CalorieSliderView: View {
    @ObservedObject var dataModel = UserDataViewModel()
    
    var body: some View {
            Text("Hi")
    }
}

struct CalorieSliderView_Previews: PreviewProvider {
    static var previews: some View {
        CalorieSliderView()
    }
}
