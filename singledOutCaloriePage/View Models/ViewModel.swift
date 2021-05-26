//
//  ViewModel.swift
//  singledOutCaloriePage
//
//  Created by Rob Maltese on 5/26/21.
//

import Foundation
import SwiftUI

class UserMetricViewModel: ObservableObject {
    @Binding var ageInput: Int
    @Binding var weightInput: Int
    @Binding  var heightFeet: Int
    @Binding  var heightInches: Int
    
    init(ageInput: Binding<Int>, weightInput: Binding<Int>, heightFeet: Binding<Int>, heightInches: Binding<Int>) {
        self._ageInput = ageInput
        self._weightInput = weightInput
        self._heightFeet = heightFeet
        self._heightInches = heightInches
    }
}



