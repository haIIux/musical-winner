//
//  CalorieSliderView.swift
//  singledOutCaloriePage
//
//  Created by Rob Maltese on 5/26/21.
//

import SwiftUI

struct CalorieOutputView: View {
    @ObservedObject var dataModel: UserDataViewModel
    @State var selection = 2
    @State var show = false

    
    var body: some View {
        VStack {
            Text("Daily Macro Goals")
                .font(.system(size: 25, weight: .semibold, design: .default))
            ring
                .frame(width: 150, height: 150)
            macroBreakdown
            resetButton
        }

    }
}


extension CalorieOutputView {
    var macroBreakdown: some View {
        VStack {
            HStack {
                Spacer()
                Carbohydrates(dataModel: dataModel)
                Spacer()
                Fats(dataModel: dataModel)
                Spacer()
                Protein(dataModel: dataModel)
                Spacer()
            }
        }
    }
    var ring: some View {
        VStack {
            ZStack {
                VStack {
                    Text("Total")
                        .font(.headline)
                    Text("\(String(format: "%.0f", dataModel.dailyCalories))")
                        .bold()
                        .font(.largeTitle)
                    Text("kcal")
                        .font(.subheadline)
                }
                Circle()
                    .trim(from: show ? 0 : 0.99, to: 1)
                    .stroke(
                        LinearGradient(
                            gradient: Gradient(colors: [Color.blue, Color.orange]),
                            startPoint: .leading,
                            endPoint: .trailing),
                        style: StrokeStyle(lineWidth: 15, lineCap: .round)
                    )
                    .rotationEffect(Angle(degrees: 90))
                    .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0))
                    .onAppear {
                        withAnimation { show = true }
                    }
                
            }
        }
    }
    var resetButton: some View {
        Button(action: {
            dataModel.dailyCalories = 0.0
        }, label: {
            Text("Reset")
        })
        .padding()
        .padding(.horizontal, 50)
        .foregroundColor(.white)
        .background(Color(.systemBlue))
        .cornerRadius(5.0)
    }
}


/*
 var macroBreakdown: some View {
     VStack {
//            Text("Calories : \(String(format: "%.0f", dataModel.dailyCalories))")
         HStack {
             Text("Carbohydrates :")
             Text("\(String(format: "%.0f", dataModel.carbohydrateCalculation))")
                 
         }
         .frame(width: 175)
         .padding()
         .background(Color(.systemBlue))
         .foregroundColor(.white)
         .cornerRadius(8.0)
         .padding(.vertical, 5)
         
         HStack {
             Text("Fats :")
             Text("\(String(format: "%.0f", dataModel.fatCalculation))")
                 .bold()
         }
         .frame(width: 175)
         .padding()
         .background(Color(.systemBlue))
         .foregroundColor(.white)
         .cornerRadius(8.0)
         .padding(.vertical, 5)

         
         HStack {
             Text("Protein :")
             Text("\(String(format: "%.0f", dataModel.proteinCalculation))")
                 .bold()
         }
         .frame(width: 175)
         .padding()
         .background(Color(.systemBlue))
         .foregroundColor(.white)
         .cornerRadius(8.0)
         .padding(.vertical, 5)

     }
 }
 */
