//
//  SheetView.swift
//  RouletteHistory
//
//  Created by Jacob Chappelle on 2022-08-18.
//

import SwiftUI

struct SheetView: View {
    @Environment(\.dismiss) var dismiss

    var body: some View {
        Button("Press to dismiss") {
            dismiss()
        }
        .font(.title)
        .padding()
        .background(.black)
    }
}
