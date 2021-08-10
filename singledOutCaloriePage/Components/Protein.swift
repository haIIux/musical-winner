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
                    .font(.headline)
                    .bold()
                    .padding(.top, 10)

                Text("Protein")
                    .font(.caption)
                    .foregroundColor(.white)
                    .padding(.top, 2)
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
                .padding(.bottom, 100)
        }
    }
}

struct Protein_Previews: PreviewProvider {
    static var previews: some View {
        Protein(dataModel: UserDataViewModel())
    }
}
