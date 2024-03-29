//
//  Protein.swift
//  Protein
//
//  Created by Rob Maltese on 8/10/21.
//

import SwiftUI

struct Protein: View {
    @ObservedObject var dataModel: UserDataViewModel
    var body: some View {
        ZStack {

            VStack {
                Text("\(String(format: "%.0f", dataModel.proteinCalculation))g")
                    .font(.title)
                    .bold()
                    .padding(.top, 5)
                Text("Protein")
                    .font(.system(size: 12, weight: .semibold, design: .default))
                    .foregroundColor(.white)
            }
            .foregroundColor(.white)
            .background(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .foregroundColor(.mint)
                    .frame(width: 100, height: 100, alignment: .center)
            )
            Image("protein")
                .resizable()
                .frame(width: 50, height: 50, alignment: .center)
                .padding(.bottom, 90)
        }
    }
}

struct Protein_Previews: PreviewProvider {
    static var previews: some View {
        Protein(dataModel: UserDataViewModel())
    }
}
