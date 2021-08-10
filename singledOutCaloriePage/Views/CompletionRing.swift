//
//  CompletionRing.swift
//  singledOutCaloriePage
//
//  Created by Rob Maltese on 7/18/21.
//

import SwiftUI

/*
 Colors :
 Red - Protein
 Blue - Carbs
 Green - Fats
 */

struct CompletionRing: View {
    @State var show = false
    @ObservedObject var dataModel: UserDataViewModel
    var body: some View {
        VStack {
            ZStack {
                VStack {
                    Text("Total")
//                    Text(dataModel.dailyCalories)
                }
                Circle()
                    .trim(from: show ? 0 : 0.99, to: 1)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.red, Color.orange]),
                            startPoint: .leading,
                            endPoint: .trailing),
                        style: StrokeStyle(lineWidth: 25, lineCap: .round)
                    )
                    .rotationEffect(Angle(degrees: 90))
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                    .onAppear {
                        withAnimation { show = true }
                    }
                
            }
        }
        .padding(.horizontal, 25)
        
    }
}

struct CompletionRing_Previews: PreviewProvider {
    static var previews: some View {
        CompletionRing(dataModel: UserDataViewModel())
    }
}


