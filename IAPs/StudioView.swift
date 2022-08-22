//
//  MyCarsView.swift
//  RouletteHistory
//
//  Created by Jacob Chappelle on 2022-08-18.
//

import SwiftUI
import StoreKit

struct StudioView: View {
    @StateObject var store: Store = Store()
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    var body: some View {
        ZStack {
            HStack {
                NavigationView {
                    if store.purchasedProducts.isEmpty && store.purchasedNonRenewableSubscriptions.isEmpty && store.purchasedSubscriptions.isEmpty {
                        VStack {
                            Spacer()
                            Spacer()
                            Text("Rok Bichin Studios presents...")
                                .foregroundColor(.green)
                                .bold()
                                .font(.system(size: 50))
                                .padding(.bottom, 10)
                                .shadow(color: .green, radius: 8.0, x: 4, y: 7)
                            Text("Roulette Magic 🪄💨⚪️")
                                .foregroundColor(.red)
                                .font(.system(size: 50))
                                .padding(.bottom, 20)
                                .shadow(color: .red, radius: 10.0, x: 7.0, y: 12.0)
                            NavigationLink {
                                StoreView()
                            } label: {
                                Label("Unlock Roulette Magic", systemImage: "cart")
                                    .font(.headline)
                                    .foregroundColor(.black)
                                    .padding()
                                    .frame(width: 250, height: 40, alignment: .center)
                                    .background(.blue)
                                    .cornerRadius(15.0)
                            }
                            Spacer()
                            Spacer()
                            Button("Close", action: {
//                                showingSheet = false
                                //playSound(key: "fairy-glitter")
                                self.presentationMode.wrappedValue.dismiss()
                            })
                            .font(.headline)
                            .foregroundColor(.black)
                            .padding()
                            .frame(width: 100, height: 40, alignment: .center)
                            .background(.red)
                            .cornerRadius(15.0)
                            
                            Spacer()
                            Spacer()
                        }//.background(.black)
                    } else {
                        List {
                            Section("My Super Powers") {
                                if !store.purchasedProducts.isEmpty {
                                    ForEach(store.purchasedProducts) { product in
//                                        NavigationLink {
//                                            ProductDetailView(product: product)
//                                        } label: {
                                        ListCellView(product: product, purchasingEnabled: true)
//                                        }
                                    }
                                } else {
                                    Text("You don't own any magic products. \nHead over to the shop to get started!")
                                }
                            }
//                            Section("Navigation Service") {
//                                if !store.purchasedNonRenewableSubscriptions.isEmpty || !store.purchasedSubscriptions.isEmpty {
//                                    ForEach(store.purchasedNonRenewableSubscriptions) { product in
//                                        NavigationLink {
//                                            ProductDetailView(product: product)
//                                        } label: {
//                                            ListCellView(product: product, purchasingEnabled: false)
//                                        }
//                                    }
//                                    ForEach(store.purchasedSubscriptions) { product in
//                                        NavigationLink {
//                                            ProductDetailView(product: product)
//                                        } label: {
//                                            ListCellView(product: product, purchasingEnabled: false)
//                                        }
//                                    }
//
//                                } else {
//                                    if let subscriptionGroupStatus = store.subscriptionGroupStatus {
//                                        if subscriptionGroupStatus == .expired || subscriptionGroupStatus == .revoked {
//                                            Text("Welcome Back! \nHead over to the shop to get started!")
//                                        } else if subscriptionGroupStatus == .inBillingRetryPeriod {
//                                            //The best practice for subscriptions in the billing retry state is to provide a deep link
//                                            //from your app to https://apps.apple.com/account/billing.
//                                            Text("Please verify your billing details.")
//                                        }
//                                    } else {
//                                        Text("You don't own any subscriptions. \nHead over to the shop to get started!")
//                                    }
//                                }
//                            }
                            
                            Button("Close", action: {
//                                showingSheet = false
                                playSound(key: "fairy-glitter")
                                self.presentationMode.wrappedValue.dismiss()
                            })
//                            NavigationLink {
//                                //StoreView()
////                                self.dismiss()
//                                ContentView()
//                            } label: {
//                                Label("Close", systemImage: "xmark.circle.fill")
//                            }
                            .foregroundColor(.white)
                            .listRowBackground(Color.blue)
                        }
//                        .background(.black)
                        .navigationTitle("Rok Bichin Studios")
                    }
                }
            }.background(Image("background")
                .resizable()
                .aspectRatio(UIScreen.main.bounds.size, contentMode: .fill )
                .clipped())
            .edgesIgnoringSafeArea( .vertical )
        }.environmentObject(store)
            
    }
}
