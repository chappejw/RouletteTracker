//
//  StoreView.swift
//  RouletteHistory
//
//  Created by Jacob Chappelle on 2022-08-17.
//

import SwiftUI
import StoreKit

struct StoreView: View {
    @EnvironmentObject var store: Store

    var body: some View {
        List {
            Section("In App Purchases") {
                ForEach(store.products) { product in
                    ListCellView(product: product)
                }
            }
            .listStyle(GroupedListStyle())

//            SubscriptionsView()
//
//            Section("Navigation: Non-Renewing Subscription") {
//                ForEach(store.nonRenewables) { product in
//                    ListCellView(product: product, purchasingEnabled: store.purchasedSubscriptions.isEmpty)
//                }
//            }
//            .listStyle(GroupedListStyle())

            Button("Restore Purchases", action: {
                Task {
                    //This call displays a system prompt that asks users to authenticate with their App Store credentials.
                    //Call this function only in response to an explicit user action, such as tapping a button.
                    try? await AppStore.sync()
                }
            })

        }
        .navigationTitle("Magic Shop")
    }
}

struct StoreView_Previews: PreviewProvider {
    static var previews: some View {
        StoreView()
    }
}
