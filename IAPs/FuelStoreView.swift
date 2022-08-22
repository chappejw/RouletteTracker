//
//  FuelStoreView.swift
//  RouletteHistory
//
//  Created by Jacob Chappelle on 2022-08-17.
//

import SwiftUI
import StoreKit

struct FuelStoreView: View {
    let fuels: [Product]
    let onPurchase: (Product) -> Void
    
    var body: some View {
        VStack {
            Text("Give your ride a boost!")
                .font(.largeTitle)
                .multilineTextAlignment(.center)
            HStack {
                ForEach(fuels, id: \.id) { fuel in
                    FuelProductView(fuel: fuel, onPurchase: onPurchase)
                }
            }
        }
    }
}
