//
//  ContentView.swift
//  RouletteTracker
//
//  Created by Jacob Chappelle on 2022-06-10.
//

import SwiftUI
import DeviceKit

extension View {
    func multicolorGlow() -> some View {
        ZStack {
            ForEach(0..<2) { i in
                Rectangle()
                    .fill(AngularGradient(gradient: Gradient(colors: [.red, .yellow, .green, .blue, .purple, .red]), center: .center))
                    .frame(width: 40, height: 45)
                    .mask(self.blur(radius: 10))
                    .overlay(self.blur(radius: 5 - CGFloat(i * 5)))
            }
        }
    }
}

extension View {
    func glow(color: Color = .red, radius: CGFloat = 10) -> some View {
        self
            .shadow(color: color, radius: radius)
            .shadow(color: color, radius: radius)
            .shadow(color: color, radius: radius)
    }
}

struct ContentView: View {
    
    @StateObject var rouletteTable = RouletteTable(reset: true)
    @StateObject var store = Store()
    
    @State private var showingSheet = false
    @State private var isPurchased = false
    var device: Device
    
    struct Defaults {
        static let tileWidth = 33.0
        static let tileHeight = 33.0
        static let sectionWidth = 138.0
        static let sectionHeight = 215.0
        static let two2oneWidth = 70.0
        static let magicButtonWidth = 50.0
        static let magicButtonHeight = 50.0
        static let two2oneHeight = 55.0
        static let section12Height = 50.0
        static let fifty50Width = sectionWidth/2.0-4.0
        static let buttonWidth = 150.0
        static let buttonHeight = 20.0
        static let historyNumWidth = 25.0
        static let historyNumHeight = 25.0
        static let sectionShadowRadius = 1.0
        static let tileShadowRadius = 1.0
        static let twelveShadowRadius = 4.0
        static let infoSectionWidth = 70.0
    }
    
    let columns = [
        GridItem(.adaptive(minimum: 26, maximum: 26))
    ]
    
    let tableColor = Color.clear //Color(red: 0.0, green: 0.556, blue: 0.326)
    
    init() {
        let dev = Device.current
        print(dev)
        device = dev
    }
    
//    func didInAppPurchase() {
//        isPurchased = true
//    }
    
    private func hapticClick() {
        let impactMed = UIImpactFeedbackGenerator(style: .heavy)
        impactMed.impactOccurred()
    }
    
    func numberHistoryWidth() -> CGFloat {
        var width = 750.0
        if device == .simulator(.iPhone6s)
            || device == .simulator(.iPhone6sPlus)
            || device == .simulator(.iPhone7)
            || device == .simulator(.iPhone7Plus)
            || device == .simulator(.iPhone8)
            || device == .simulator(.iPhone8Plus)
            || device == .simulator(.iPhoneX)
            || device == .simulator(.iPhoneXS)
            || device == .simulator(.iPhoneXSMax)
            || device == .simulator(.iPhoneSE)
            || device == .simulator(.iPhoneSE2)
            || device == .simulator(.iPhoneSE3)
            || device == .simulator(.iPhone12Mini)
            || device == .simulator(.iPhone13Mini)
            || device == .iPhone6s
            || device == .iPhone6sPlus
            || device == .iPhone7
            || device == .iPhone7Plus
            || device == .iPhone8
            || device == .iPhone8Plus
            || device == .iPhoneX
            || device == .iPhoneXS
            || device == .iPhoneXSMax
            || device == .iPhoneSE
            || device == .iPhoneSE2
            || device == .iPhoneSE3
            || device == .iPhone12Mini
            || device == .iPhone13Mini {
            width = 650.0
        }
        return width
    }
    
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 0.0) {
                VStack(spacing: 0.0) {
                    Spacer()
                    Button {
                        if rouletteTable.isStopped() {
                            playSound(key: "fairy-glitter")
                        } else {
                            playSound(key: "torch-click")
                            hapticClick()
                        }
                        rouletteTable.updateCountsForNumber("0")
                    } label: {
                        RouletteNumberTile(numberTile: "0",
                                           numberCount: String(rouletteTable.getCountForNumber("0")),
                                           background: .green,
                                           tileWidth: Defaults.tileWidth,
                                           tileHeight: Defaults.tileHeight,
                                           magicNumber: rouletteTable.magicNumber)
                    }.frame(width:Defaults.tileWidth,
                            height: Defaults.tileHeight,
                            alignment: .center)
                    
                    Button {
                        if rouletteTable.isStopped() {
                            playSound(key: "fairy-glitter")
                        } else {
                            playSound(key: "torch-click")
                            hapticClick()
                        }
                        rouletteTable.updateCountsForNumber("00")
                    } label: {
                        RouletteNumberTile(numberTile: "00",
                                           numberCount: String(rouletteTable.getCountForNumber("00")),
                                           background: .green,
                                           tileWidth: Defaults.tileWidth,
                                           tileHeight: Defaults.tileHeight,
                                           magicNumber: rouletteTable.magicNumber)
                    }.frame(width:Defaults.tileWidth,
                            height: Defaults.tileHeight,
                            alignment: .center)
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }.frame(width: 40, height: 275)
                
                ScrollView {
                    VStack {
                        LazyVGrid(columns: columns, spacing: 0) {
                            ForEach(rouletteTable.first12, id: \.self) { item in
                                Button {
                                    rouletteTable.updateCountsForNumber(item)
                                    if rouletteTable.isStopped() {
                                        playSound(key: "fairy-glitter")
                                    } else {
                                        playSound(key: "torch-click")
                                        hapticClick()
                                    }
                                } label: {
                                    RouletteNumberTile(numberTile: "\(item)",
                                                       numberCount: String(rouletteTable.getCountForNumber(item)),
                                                       background: rouletteTable.blacks.contains(item) ? .black : .red,
                                                       tileWidth: Defaults.tileWidth,
                                                       tileHeight: Defaults.tileHeight,
                                                       magicNumber: rouletteTable.magicNumber)
                                }.frame(width:Defaults.tileWidth,
                                        height: Defaults.tileHeight,
                                        alignment: .center)
                            }
                        }
                        .background(tableColor)
                        
                        Text("1st 12")
                            .fontWeight(.bold)
                            .frame(width:Defaults.sectionWidth, height: Defaults.section12Height)
                            .shadow(color: .black,
                                    radius: Defaults.twelveShadowRadius,
                                    x: 1,
                                    y: 1)
                            .background(tableColor)
                            .foregroundColor(.white)
                            .font(.title)
                            .overlay {
                                Text(String(rouletteTable.getCountForNumber("1st12")))
                                    .frame(width: Defaults.sectionWidth,
                                           height:Defaults.section12Height+22.0,
                                           alignment: .bottomTrailing)
                                    .shadow(color: .black,
                                            radius: Defaults.tileShadowRadius,
                                            x: 1,
                                            y: 1)
                                    .foregroundColor(.white)
                            }
                        
                        HStack {
                            Text("1 to 18")
                                .fontWeight(.bold)
                                .frame(width: Defaults.fifty50Width,
                                       height: Defaults.section12Height,
                                       alignment: .center)
                                .shadow(color: .black,
                                        radius: Defaults.twelveShadowRadius,
                                        x: 1,
                                        y: 1)
                                .border(.black, width: 1.0)
                                .background(tableColor)
                                .font(.title3)
                                .foregroundColor(.white)
                                .overlay {
                                    Text(String(rouletteTable.getCountForNumber("1to18")))
                                        .padding(1.0)
                                        .frame(width: Defaults.fifty50Width,
                                               height:Defaults.section12Height+5.0,
                                               alignment: .bottomTrailing)
                                        .foregroundColor(.white)
                                }
                            
                            Text("EVEN")
                                .fontWeight(.bold)
                                .frame(width: Defaults.fifty50Width,
                                       height: Defaults.section12Height,
                                       alignment: .center)
                                .shadow(color: .black,
                                        radius: Defaults.twelveShadowRadius,
                                        x: 1,
                                        y: 1)
                                .border(.black, width: 1.0)
                                .background(tableColor)
                                .font(.title3)
                                .foregroundColor(.white)
                                .overlay {
                                    Text(String(rouletteTable.getCountForNumber("EVEN")))
                                        .padding(1.0)
                                        .frame(width: Defaults.fifty50Width,
                                               height:Defaults.section12Height+5.0,
                                               alignment: .bottomTrailing)
                                        .foregroundColor(.white)
                                }
                            
                        }.border(.black, width: 1.0)
                    }
                }
                .frame(width: Defaults.sectionWidth, height: Defaults.sectionHeight, alignment: .top)
                .border(.black, width: 1.0)
                .scrollEnabled(false)
                
                ScrollView {
                    VStack {
                        LazyVGrid(columns: columns, spacing: 0) {
                            ForEach(rouletteTable.second12, id: \.self) { item in
                                Button {
                                    rouletteTable.updateCountsForNumber(item)
                                    if rouletteTable.isStopped() {
                                        playSound(key: "fairy-glitter")
                                    } else {
                                        playSound(key: "torch-click")
                                        hapticClick()
                                    }
                                } label: {
                                    RouletteNumberTile(numberTile: "\(item)",
                                                       numberCount: String(rouletteTable.getCountForNumber(item)),
                                                       background: rouletteTable.blacks.contains(item) ? .black : .red,
                                                       tileWidth: Defaults.tileWidth,
                                                       tileHeight: Defaults.tileHeight,
                                                       magicNumber: rouletteTable.magicNumber)
                                }.frame(width:Defaults.tileWidth, height: Defaults.tileHeight, alignment: .center)
                            }
                        }
                        .background(tableColor)
                        
                        Text("2nd 12")
                            .fontWeight(.bold)
                            .frame(width:Defaults.sectionWidth, height: Defaults.section12Height)
                            .shadow(color: .black,
                                    radius: Defaults.twelveShadowRadius,
                                    x: 1,
                                    y: 1)
                            .background(tableColor)
                            .font(.title)
                            .foregroundColor(.white)
                            .overlay {
                                Text(String(rouletteTable.getCountForNumber("2nd12")))
                                    .padding(1.0)
                                    .frame(width: Defaults.sectionWidth,
                                           height:Defaults.section12Height+22.0,
                                           alignment: .bottomTrailing)
                                    .shadow(color: .black,
                                            radius: Defaults.tileShadowRadius,
                                            x: 1,
                                            y: 1)
                                    .foregroundColor(.white)
                            }
                        HStack {
                            Text("RED")
                                .fontWeight(.bold)
                                .frame(width: Defaults.fifty50Width, height: Defaults.section12Height, alignment: .center)
                                .shadow(color: .black,
                                        radius: Defaults.twelveShadowRadius,
                                        x: 1,
                                        y: 1)
                                .border(.black, width: 1.0)
                                .background(tableColor)
                                .foregroundColor(.red)
                                .font(.title3)
                                .overlay {
                                    Text(String(rouletteTable.getCountForNumber("RED")))
                                        .padding(1.0)
                                        .frame(width: Defaults.fifty50Width,
                                               height:Defaults.section12Height+5.0,
                                               alignment: .bottomTrailing)
                                        .foregroundColor(.white)
                                }
                            
                            Text("BLACK")
                                .fontWeight(.bold)
                                .frame(width: Defaults.fifty50Width,
                                       height: Defaults.section12Height,
                                       alignment: .center)
                                .shadow(color: .black,
                                        radius: Defaults.twelveShadowRadius,
                                        x: 1,
                                        y: 1)
                                .border(.black, width: 1.0)
                                .background(tableColor)
                                .foregroundColor(.black)
                                .font(.title3)
                                .overlay {
                                    Text(String(rouletteTable.getCountForNumber("BLACK")))
                                        .padding(1.0)
                                        .frame(width: Defaults.fifty50Width,
                                               height:Defaults.section12Height+5.0,
                                               alignment: .bottomTrailing)
                                        .foregroundColor(.white)
                                }
                            
                        }.border(.black, width: 1.0)
                    }
                }
                .frame(width: Defaults.sectionWidth, height: Defaults.sectionHeight, alignment: .top)
                .border(.black, width: 1.0)
                .scrollEnabled(false)
                
                ScrollView {
                    VStack {
                        LazyVGrid(columns: columns, spacing: 0) {
                            ForEach(rouletteTable.third12, id: \.self) { item in
                                Button {
                                    rouletteTable.updateCountsForNumber(item)
                                    if rouletteTable.isStopped() {
                                        playSound(key: "fairy-glitter")
                                    } else {
                                        playSound(key: "torch-click")
                                        hapticClick()
                                    }
                                } label: {
                                    RouletteNumberTile(numberTile: "\(item)",
                                                       numberCount: String(rouletteTable.getCountForNumber(item)),
                                                       background: rouletteTable.blacks.contains(item) ? .black : .red,
                                                       tileWidth: Defaults.tileWidth,
                                                       tileHeight: Defaults.tileHeight,
                                                       magicNumber: rouletteTable.magicNumber)
                                }.frame(width:Defaults.tileWidth, height: Defaults.tileHeight, alignment: .center)
                            }
                        }
                        .background(tableColor)
                        
                        Text("3rd 12")
                            .fontWeight(.bold)
                            .frame(width: Defaults.sectionWidth, height: Defaults.section12Height)
                            .shadow(color: .black,
                                    radius: Defaults.twelveShadowRadius,
                                    x: 1,
                                    y: 1)
                            .background(tableColor)
                            .font(.title)
                            .foregroundColor(.white)
                            .overlay {
                                Text(String(rouletteTable.getCountForNumber("3rd12")))
                                    .padding(1.0)
                                    .frame(width: Defaults.sectionWidth,
                                           height:Defaults.section12Height+22.0,
                                           alignment: .bottomTrailing)
                                    .shadow(color: .black,
                                            radius: Defaults.tileShadowRadius,
                                            x: 1,
                                            y: 1)
                                    .foregroundColor(.white)
                            }
                        HStack {
                            Text("ODD")
                                .fontWeight(.bold)
                                .frame(width: Defaults.fifty50Width, height: 50, alignment: .center)
                                .shadow(color: .black,
                                        radius: Defaults.twelveShadowRadius,
                                        x: 1,
                                        y: 1)
                                .border(.black, width: 1.0)
                                .background(tableColor)
                                .foregroundColor(.white)
                                .font(.title3)
                                .overlay {
                                    Text(String(rouletteTable.getCountForNumber("ODD")))
                                        .padding(1.0)
                                        .frame(width: Defaults.fifty50Width,
                                               height:Defaults.section12Height+5.0,
                                               alignment: .bottomTrailing)
                                        .foregroundColor(.white)
                                }
                            
                            Text("19 to 36")
                                .fontWeight(.bold)
                                .frame(width:Defaults.fifty50Width, height: 50, alignment: .center)
                                .shadow(color: .black,
                                        radius: Defaults.twelveShadowRadius,
                                        x: 1,
                                        y: 1)
                                .border(.black, width: 1.0)
                                .background(tableColor)
                                .foregroundColor(.white)
                                .font(.title3)
                                .overlay {
                                    Text(String(rouletteTable.getCountForNumber("19to36")))
                                        .padding(1.0)
                                        .frame(width: Defaults.fifty50Width,
                                               height: Defaults.section12Height+5.0,
                                               alignment: .bottomTrailing)
                                        .foregroundColor(.white)
                                }
                        }.border(.black, width: 1.0)
                    }
                }
                .frame(width: Defaults.sectionWidth, height: Defaults.sectionHeight, alignment: .top)
                .border(.black, width: 1.0)
                .scrollEnabled(false)
                
                VStack(alignment: .center, spacing: 0.0) {
                    
                    Text("2to1")
                        .fontWeight(.bold)
                        .frame(width: Defaults.two2oneWidth, height: Defaults.tileHeight, alignment: .center)
                        .shadow(color: .black,
                                radius: Defaults.twelveShadowRadius,
                                x: 1,
                                y: 1)
                        .border(.black, width: 1.0)
                        .foregroundColor(.white)
                        .font(.title2)
                        .background(tableColor)
                        .overlay {
                            Text(String(rouletteTable.getCountForNumber("2to1_1")))
                                .padding(1.0)
                                .frame(width: Defaults.two2oneWidth,
                                       height: Defaults.tileHeight+5.0,
                                       alignment: .bottomTrailing)
                                .foregroundColor(.white)
                        }
                    
                    Text("2to1")
                        .fontWeight(.bold)
                        .frame(width: Defaults.two2oneWidth, height: Defaults.tileHeight, alignment: .center)
                        .shadow(color: .black,
                                radius: Defaults.twelveShadowRadius,
                                x: 1,
                                y: 1)
                        .border(.black, width: 1.0)
                        .foregroundColor(.white)
                        .font(.title2)
                        .background(tableColor)
                        .overlay {
                            Text(String(rouletteTable.getCountForNumber("2to1_2")))
                                .padding(1.0)
                                .frame(width: Defaults.two2oneWidth,
                                       height: Defaults.tileHeight+5.0,
                                       alignment: .bottomTrailing)
                                .foregroundColor(.white)
                        }
                    
                    Text("2to1")
                        .fontWeight(.bold)
                        .frame(width: Defaults.two2oneWidth, height: Defaults.tileHeight, alignment: .center)
                        .shadow(color: .black,
                                radius: Defaults.twelveShadowRadius,
                                x: 1,
                                y: 1)
                        .border(.black, width: 1.0)
                        .foregroundColor(.white)
                        .font(.title2)
                        .background(tableColor)
                        .overlay {
                            Text(String(rouletteTable.getCountForNumber("2to1_3")))
                                .padding(1.0)
                                .frame(width: Defaults.two2oneWidth,
                                       height: Defaults.tileHeight+5.0,
                                       alignment: .bottomTrailing)
                                .foregroundColor(.white)
                        }
                    
                    Spacer()
                    Spacer()
                    
                }.frame(width: Defaults.two2oneWidth,
                        height: Defaults.sectionHeight,
                        alignment: .center)
                
                VStack(alignment: .center, spacing: 0.0) {
                    
                    HStack {
                        Spacer()
                        Spacer()
                        VStack {
                            HStack {
                                if device == .simulator(.iPhone6s)
                                    || device == .simulator(.iPhone6sPlus)
                                    || device == .simulator(.iPhone7)
                                    || device == .simulator(.iPhone7Plus)
                                    || device == .simulator(.iPhone8)
                                    || device == .simulator(.iPhone8Plus)
                                    || device == .simulator(.iPhoneX)
                                    || device == .simulator(.iPhoneXS)
                                    || device == .simulator(.iPhoneXSMax)
                                    || device == .simulator(.iPhoneSE)
                                    || device == .simulator(.iPhoneSE2)
                                    || device == .simulator(.iPhoneSE3)
                                    || device == .simulator(.iPhone12Mini)
                                    || device == .simulator(.iPhone13Mini)
                                    || device == .iPhone6s
                                    || device == .iPhone6sPlus
                                    || device == .iPhone7
                                    || device == .iPhone7Plus
                                    || device == .iPhone8
                                    || device == .iPhone8Plus
                                    || device == .iPhoneX
                                    || device == .iPhoneXS
                                    || device == .iPhoneXSMax
                                    || device == .iPhoneSE
                                    || device == .iPhoneSE2
                                    || device == .iPhoneSE3
                                    || device == .iPhone12Mini
                                    || device == .iPhone13Mini {
                                    
                                } else {
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                }
                                Spacer()
                                let vip = Image("vip")
                                    .resizable()
                                    .frame(width: 70.0, height: 40.0, alignment: .center)
                                    .aspectRatio(contentMode: .fill)
                                if !store.purchasedProducts.isEmpty {
                                    vip.shadow(color: .green, radius: 8.0, x: 5, y: 7)
                                } else {
                                    vip.shadow(color: .red, radius: 8.0, x: 5, y: 7)
                                }
                            }
                            Spacer()
                            HStack {
                                if device == .simulator(.iPhone6s)
                                    || device == .simulator(.iPhone6sPlus)
                                    || device == .simulator(.iPhone7)
                                    || device == .simulator(.iPhone7Plus)
                                    || device == .simulator(.iPhone8)
                                    || device == .simulator(.iPhone8Plus)
                                    || device == .simulator(.iPhoneX)
                                    || device == .simulator(.iPhoneXS)
                                    || device == .simulator(.iPhoneXSMax)
                                    || device == .simulator(.iPhoneSE)
                                    || device == .simulator(.iPhoneSE2)
                                    || device == .simulator(.iPhoneSE3)
                                    || device == .simulator(.iPhone12Mini)
                                    || device == .simulator(.iPhone13Mini)
                                    || device == .iPhone6s
                                    || device == .iPhone6sPlus
                                    || device == .iPhone7
                                    || device == .iPhone7Plus
                                    || device == .iPhone8
                                    || device == .iPhone8Plus
                                    || device == .iPhoneX
                                    || device == .iPhoneXS
                                    || device == .iPhoneXSMax
                                    || device == .iPhoneSE
                                    || device == .iPhoneSE2
                                    || device == .iPhoneSE3
                                    || device == .iPhone12Mini
                                    || device == .iPhone13Mini {
                                    
                                } else {
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                }
                                Spacer()
                                Spacer()
                                Spacer()
                                if !store.isPurchased {
                                    Button(action: {
                                        showingSheet.toggle()
                                        playSound(key: "magical-spell")
                                        hapticClick()
                                    }) {
                                        Text("Unlock?")
                                            .font(.caption)
                                            .bold()
                                            .lineLimit(2)
                                            .foregroundColor(.white)
                                            .frame(width: 70, height: 40)
                                            .background(tableColor)
                                            .border(.yellow, width: 5.0)
                                            .cornerRadius(10)
                                            
                                    }.sheet(isPresented: $showingSheet) {
                                        StudioView(store: store)
                                    }.shadow(color: .green, radius: 8.0, x: 5, y: 7)
                                        .onAppear {
//                                            Task {
//                                                isPurchased = (try? await store.isPurchased(product)) ?? false
//                                            }
                                        }
                                }
                                Spacer()
                                Spacer()
                            }
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
                            HStack(alignment: .center, spacing: 5.0, content: {
                                if device == .simulator(.iPhone6s)
                                    || device == .simulator(.iPhone6sPlus)
                                    || device == .simulator(.iPhone7)
                                    || device == .simulator(.iPhone7Plus)
                                    || device == .simulator(.iPhone8)
                                    || device == .simulator(.iPhone8Plus)
                                    || device == .simulator(.iPhoneX)
                                    || device == .simulator(.iPhoneXS)
                                    || device == .simulator(.iPhoneXSMax)
                                    || device == .simulator(.iPhoneSE)
                                    || device == .simulator(.iPhoneSE2)
                                    || device == .simulator(.iPhoneSE3)
                                    || device == .simulator(.iPhone12Mini)
                                    || device == .simulator(.iPhone13Mini)
                                    || device == .iPhone6s
                                    || device == .iPhone6sPlus
                                    || device == .iPhone7
                                    || device == .iPhone7Plus
                                    || device == .iPhone8
                                    || device == .iPhone8Plus
                                    || device == .iPhoneX
                                    || device == .iPhoneXS
                                    || device == .iPhoneXSMax
                                    || device == .iPhoneSE
                                    || device == .iPhoneSE2
                                    || device == .iPhoneSE3
                                    || device == .iPhone12Mini
                                    || device == .iPhone13Mini {
                                    
                                } else {
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                    Spacer()
                                }
//                                Spacer()
                                if store.isPurchased {
                                    Text(String(format: "%.2f", rouletteTable.timerValue))
                                        .fontWeight(.bold)
                                        .frame(width: 80, height: 20, alignment: .leading)
                                        .shadow(color: .black, radius: 3.0, x: 2, y: 2)
                                        .shadow(color: .red, radius: 8.0, x: 5, y: 7)
                                        .font(.title)
                                        .foregroundColor(.pink)
                                }
                                Spacer()
                                Spacer()
                            })
                            Spacer()
//                            Spacer()
                        }
                        
                    }
                    HStack(alignment: .center, spacing: 11, content: {
                        if device == .simulator(.iPhone6s)
                            || device == .simulator(.iPhone6sPlus)
                            || device == .simulator(.iPhone7)
                            || device == .simulator(.iPhone7Plus)
                            || device == .simulator(.iPhone8)
                            || device == .simulator(.iPhone8Plus)
                            || device == .simulator(.iPhoneX)
                            || device == .simulator(.iPhoneXS)
                            || device == .simulator(.iPhoneXSMax)
                            || device == .simulator(.iPhoneSE)
                            || device == .simulator(.iPhoneSE2)
                            || device == .simulator(.iPhoneSE3)
                            || device == .simulator(.iPhone12Mini)
                            || device == .simulator(.iPhone13Mini)
                            || device == .iPhone6s
                            || device == .iPhone6sPlus
                            || device == .iPhone7
                            || device == .iPhone7Plus
                            || device == .iPhone8
                            || device == .iPhone8Plus
                            || device == .iPhoneX
                            || device == .iPhoneXS
                            || device == .iPhoneXSMax
                            || device == .iPhoneSE
                            || device == .iPhoneSE2
                            || device == .iPhoneSE3
                            || device == .iPhone12Mini
                            || device == .iPhone13Mini {
                            
                        } else {
                            Spacer()
                            Spacer()
                            Spacer()
                            Spacer()
//                            Spacer()
                            Spacer()
                        }
                        if store.isPurchased {
                            Button {
                                playSound(key: "button-click")
                                hapticClick()
                                switch rouletteTable.tableState {
                                case TableState.clearTable.rawValue:
                                    rouletteTable.startSpin()
                                case TableState.started.rawValue:
                                    rouletteTable.stopSpin()
                                case TableState.stopped.rawValue:
                                    rouletteTable.clearTableState()
                                default:
                                    break
                                }
                            } label: {
                                Image("startButton")
                            }
                            .frame(width:Defaults.magicButtonWidth, height: Defaults.magicButtonHeight, alignment: .center)
                            .cornerRadius(Defaults.magicButtonWidth/2.0)
                            .clipShape(Circle())
                            .overlay {
                                Text("?")
                                    .font(.title)
                                    .bold()
                                    .padding(0)
                                    .foregroundColor(.black)
                            }
                            .shadow(color: .black, radius: 3, x: 2, y: 3)
                            .shadow(color: .green, radius: 8, x: 4, y: 7)
                        }
                        Spacer()
                        Spacer()
                    })
                    
                }.frame(width: Defaults.infoSectionWidth, height: Defaults.sectionHeight, alignment: .center)
                
            }.background(tableColor)
            
            HStack {
                Spacer()
                Button("Reset") {
                    rouletteTable.resetRouletteTable()
                    rouletteTable.clearTableState()
                    playSound(key: "crumple")
                }.frame(width: Defaults.buttonWidth, height: Defaults.buttonHeight, alignment: .center)
                    .border(.black, width: 0.5)
                    .background(.red)
                    .cornerRadius(50.0)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 1.0, x: 1.0, y: 1.0)
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                Button("Undo") {
                    rouletteTable.undo()
                    playSound(key: "torch-click")
                }.frame(width: Defaults.buttonWidth, height: Defaults.buttonHeight, alignment: .center)
                    .border(.black, width: 0.5)
                    .background(.green)
                    .cornerRadius(50.0)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 1.0, x: 1.0, y: 1.0)
                
//                Spacer()
//                Spacer()
                Spacer()
//                Spacer()
            }.background(tableColor)
            
            
            ScrollViewReader { value in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0.0) {
                        ForEach(rouletteTable.numberHistory, id: \.self) { item in
                            Text(item)
                                .fontWeight(.bold)
                                .frame(width: Defaults.historyNumWidth,
                                       height: Defaults.historyNumHeight,
                                       alignment: .center)
                                .foregroundColor(.white)
                                .background(rouletteTable.greens.contains(item) ? .green : rouletteTable.reds.contains(item) ? .red : .black)
                                .clipShape(Circle())
                                .id(rouletteTable.numberHistory.lastIndex(of: item))
                                .glow(color: rouletteTable.greens.contains(item) ? .green : rouletteTable.reds.contains(item) ? .red : .black, radius: 1.0)
                                .padding(3)
                        }
                        Spacer()
                            .id("anID")
                    }.frame(width: CGFloat(rouletteTable.numberHistory.count) * Defaults.historyNumWidth+2,
                            height: Defaults.historyNumHeight,
                            alignment: .leading)
                }
                .onChange(of: rouletteTable.numberHistory, perform: { proxy in
                    value.scrollTo("anID")
                })
                //                .onAppear(perform: {
                //
                //                })
                .frame(width: numberHistoryWidth(), height: 30.0, alignment: .leading)
                .border(.black, width: 2.0)
            }
            .shadow(color: .black,
                    radius: Defaults.sectionShadowRadius,
                    x: 1,
                    y: 1)
            Spacer()
        }.background(Image("background")
            .resizable()
            .aspectRatio(UIScreen.main.bounds.size, contentMode: .fill )
            .clipped())
        .edgesIgnoringSafeArea( .vertical )
        .onLoad {
            
        }
    }
}



struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.device)
            .environment(\.sizeCategory, .medium)
            .previewDevice("iPhone SE")
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.landscapeRight)
            .background(Image("background")
                .resizable()
                .aspectRatio(UIScreen.main.bounds.size, contentMode: .fill )
                .clipped())
            .edgesIgnoringSafeArea( .vertical )
    }
}
