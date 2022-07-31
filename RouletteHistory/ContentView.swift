//
//  ContentView.swift
//  RouletteTracker
//
//  Created by Jacob Chappelle on 2022-06-10.
//

import SwiftUI

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

    @EnvironmentObject var rouletteTable: RouletteTable

    struct Defaults {
        static let tileWidth = 40.0
        static let tileHeight = 45.0
        static let sectionWidth = 166.0
        static let sectionHeight = 250.0
        static let two2oneWidth = 80.0
        static let two2oneHeight = 55.0
        static let section12Height = 50.0
        static let fifty50Width = sectionWidth/2.0-4.0
        static let buttonWidth = 150.0
        static let buttonHeight = 20.0
        static let historyNumWidth = 25.0
        static let historyNumHeight = 25.0
        static let sectionShadowRadius = 2.0
        static let tileShadowRadius = 2.0
    }
    
    let columns = [
        GridItem(.adaptive(minimum: 33, maximum: 33))
    ]
   
    
    var body: some View {
        
        VStack {
            Spacer()
            HStack(spacing: 0.0) {
                VStack(spacing: 0.0) {
                    Spacer()
                    Button {
                        rouletteTable.numberStats["0"] = 0
                        rouletteTable.updateCountsForNumber("0")
                        playSound(key: "torch-click")
                    } label: {
                        RouletteNumberTile(numberTile: "0",
                                       numberCount: String(rouletteTable.getCountForNumber("0")),
                                           background: .green,
                                           tileWidth: Defaults.tileWidth,
                                           tileHeight: Defaults.tileHeight)
                    }.frame(width:Defaults.tileWidth,
                            height: Defaults.tileHeight,
                            alignment: .center)
                    
                    Button {
                        rouletteTable.numberStats["00"] = 0
                        rouletteTable.updateCountsForNumber("00")
                        playSound(key: "torch-click")
                    } label: {
                        RouletteNumberTile(numberTile: "00",
                                       numberCount: String(rouletteTable.getCountForNumber("00")),
                                       background: .green,
                                       tileWidth: Defaults.tileWidth,
                                       tileHeight: Defaults.tileHeight)
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
                    .shadow(color: .black,
                            radius: Defaults.tileShadowRadius,
                            x: 1,
                            y: 1)
                
                
                ScrollView {
                    VStack {
                        LazyVGrid(columns: columns, spacing: 0) {
                            ForEach(rouletteTable.first12, id: \.self) { item in
                                Button {
                                    rouletteTable.numberStats[item] = 0
                                    rouletteTable.updateCountsForNumber(item)
                                    playSound(key: "torch-click")
                                } label: {
                                    RouletteNumberTile(numberTile: "\(item)",
                                                   numberCount: String(rouletteTable.getCountForNumber(item)),
                                                   background: rouletteTable.blacks.contains(item) ? .black : .red,
                                                   tileWidth: Defaults.tileWidth,
                                                   tileHeight: Defaults.tileHeight)
                                }.frame(width:Defaults.tileWidth, height: Defaults.tileHeight, alignment: .center)
                                    .shadow(color: .black,
                                            radius: Defaults.tileShadowRadius,
                                            x: 1,
                                            y: 1)
                            }
                        }
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        
                        Text("1st 12")
                            .fontWeight(.bold)
                            .frame(width:Defaults.sectionWidth, height: Defaults.section12Height)
                            .shadow(color: .black,
                                    radius: Defaults.tileShadowRadius,
                                    x: 1,
                                    y: 1)
                            .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                            .foregroundColor(.white)
                            .font(.title)
                            .overlay {
                                Text(String(rouletteTable.getCountForNumber("1st12")))
                                    .frame(width: Defaults.sectionWidth,
                                           height:Defaults.section12Height+17.0,
                                           alignment: .bottomTrailing)
                                    .shadow(color: .black,
                                            radius: Defaults.tileShadowRadius,
                                            x: 1,
                                            y: 1)
                            }
                            
                        HStack {
                            Text("1 to 18")
                                .fontWeight(.bold)
                                .frame(width: Defaults.fifty50Width,
                                       height: Defaults.section12Height,
                                       alignment: .center)
                                .border(.black, width: 1.0)
                                .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                                .font(.title3)
                                .foregroundColor(.white)
                                .overlay {
                                    Text(String(rouletteTable.getCountForNumber("1to18")))
                                        .padding(1.0)
                                        .frame(width: Defaults.fifty50Width,
                                               height:Defaults.section12Height,
                                               alignment: .bottomTrailing)
                                }
                                .shadow(color: .black,
                                        radius: Defaults.sectionShadowRadius,
                                        x: 1,
                                        y: 1)
                            Text("EVEN")
                                .fontWeight(.bold)
                                .frame(width: Defaults.fifty50Width,
                                       height: Defaults.section12Height,
                                       alignment: .center)
                                .border(.black, width: 1.0)
                                .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                                .font(.title2)
                                .foregroundColor(.white)
                                .overlay {
                                    Text(String(rouletteTable.getCountForNumber("EVEN")))
                                        .padding(1.0)
                                        .frame(width: Defaults.fifty50Width,
                                               height:Defaults.section12Height,
                                               alignment: .bottomTrailing)
                                }
                                .shadow(color: .black,
                                        radius: Defaults.sectionShadowRadius,
                                        x: 1,
                                        y: 1)
                        }
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
                                    rouletteTable.numberStats[item] = 0
                                    rouletteTable.updateCountsForNumber(item)
                                    playSound(key: "torch-click")
                                } label: {
                                    RouletteNumberTile(numberTile: "\(item)",
                                                   numberCount: String(rouletteTable.getCountForNumber(item)),
                                                   background: rouletteTable.blacks.contains(item) ? .black : .red,
                                                   tileWidth: Defaults.tileWidth,
                                                   tileHeight: Defaults.tileHeight)
                                }.frame(width:Defaults.tileWidth, height: Defaults.tileHeight, alignment: .center)
                                    .shadow(color: .black,
                                            radius: Defaults.tileShadowRadius,
                                            x: 1,
                                            y: 1)
                            }
                        }
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        
                        Text("2nd 12")
                            .fontWeight(.bold)
                            .frame(width:Defaults.sectionWidth, height: Defaults.section12Height)
                            .shadow(color: .black,
                                    radius: Defaults.tileShadowRadius,
                                    x: 1,
                                    y: 1)
                            .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                            .font(.title)
                            .foregroundColor(.white)
                            .overlay {
                                Text(String(rouletteTable.getCountForNumber("2nd12")))
                                    .padding(1.0)
                                    .frame(width: Defaults.sectionWidth,
                                           height:Defaults.section12Height+17.0,
                                           alignment: .bottomTrailing)
                                    .shadow(color: .black,
                                            radius: Defaults.tileShadowRadius,
                                            x: 1,
                                            y: 1)
                            }
                        HStack {
                            Text("RED")
                                .fontWeight(.bold)
                                .frame(width: Defaults.fifty50Width, height: Defaults.section12Height, alignment: .center)
                                .border(.black, width: 1.0)
                                .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                                .foregroundColor(.red)
                                .font(.title2)
                                .overlay {
                                    Text(String(rouletteTable.getCountForNumber("RED")))
                                        .padding(1.0)
                                        .frame(width: Defaults.fifty50Width,
                                               height:Defaults.section12Height,
                                               alignment: .bottomTrailing)
                                }
                                .shadow(color: .black,
                                        radius: Defaults.sectionShadowRadius,
                                        x: 1,
                                        y: 1)
                                
                            Text("BLACK")
                                .fontWeight(.bold)
                                .frame(width: Defaults.fifty50Width, height: Defaults.section12Height, alignment: .center)
                                .border(.black, width: 1.0)
                                .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                                .foregroundColor(.black)
                                .font(.title2)
                                .overlay {
                                    Text(String(rouletteTable.getCountForNumber("BLACK")))
                                        .padding(1.0)
                                        .frame(width: Defaults.fifty50Width,
                                               height:Defaults.section12Height,
                                               alignment: .bottomTrailing)
                                }
                                .shadow(color: .black,
                                        radius: Defaults.sectionShadowRadius,
                                        x: 1,
                                        y: 1)
                        }
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
                                    rouletteTable.numberStats[item] = 0
                                    rouletteTable.updateCountsForNumber(item)
                                    playSound(key: "torch-click")
                                } label: {
                                    RouletteNumberTile(numberTile: "\(item)",
                                                   numberCount: String(rouletteTable.getCountForNumber(item)),
                                                   background: rouletteTable.blacks.contains(item) ? .black : .red,
                                                   tileWidth: Defaults.tileWidth,
                                                   tileHeight: Defaults.tileHeight)
                                }.frame(width:Defaults.tileWidth, height: Defaults.tileHeight, alignment: .center)
                                    .shadow(color: .black,
                                            radius: Defaults.tileShadowRadius,
                                            x: 1,
                                            y: 1)
                            }
                        }
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        
                        Text("3rd 12")
                            .fontWeight(.bold)
                            .frame(width: Defaults.sectionWidth, height: Defaults.section12Height)
                            .shadow(color: .black,
                                    radius: Defaults.tileShadowRadius,
                                    x: 1,
                                    y: 1)
                            .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                            .font(.title)
                            .foregroundColor(.white)
                            .overlay {
                                Text(String(rouletteTable.getCountForNumber("3rd12")))
                                    .padding(1.0)
                                    .frame(width: Defaults.sectionWidth,
                                           height:Defaults.section12Height+17.0,
                                           alignment: .bottomTrailing)
                                    .shadow(color: .black,
                                            radius: Defaults.tileShadowRadius,
                                            x: 1,
                                            y: 1)
                            }
                        HStack {
                            Text("ODD")
                                .fontWeight(.bold)
                                .frame(width: Defaults.fifty50Width, height: 50, alignment: .center)
                                .border(.black, width: 1.0)
                                .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                                .foregroundColor(.white)
                                .font(.title2)
                                .overlay {
                                    Text(String(rouletteTable.getCountForNumber("ODD")))
                                        .padding(1.0)
                                        .frame(width: Defaults.fifty50Width,
                                               height:Defaults.section12Height,
                                               alignment: .bottomTrailing)
                                }
                                .shadow(color: .black,
                                        radius: Defaults.sectionShadowRadius,
                                        x: 1,
                                        y: 1)
                            Text("19 to 36")
                                .fontWeight(.bold)
                                .frame(width:Defaults.fifty50Width, height: 50, alignment: .center)
                                .border(.black, width: 1.0)
                                .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                                .foregroundColor(.white)
                                .font(.title3)
                                .overlay {
                                    Text(String(rouletteTable.getCountForNumber("19to36")))
                                        .padding(1.0)
                                        .frame(width: Defaults.fifty50Width,
                                               height: Defaults.section12Height,
                                               alignment: .bottomTrailing)
                                }
                                .shadow(color: .black,
                                        radius: Defaults.sectionShadowRadius,
                                        x: 1,
                                        y: 1)
                        }
                    }
                }
                .frame(width: Defaults.sectionWidth, height: Defaults.sectionHeight, alignment: .top)
                .border(.black, width: 1.0)
                .scrollEnabled(false)
                
                
                VStack(alignment: .center, spacing: 0.0) {
                    
                    Text("2to1")
                        .fontWeight(.bold)
                        .frame(width: Defaults.two2oneWidth, height: Defaults.tileHeight, alignment: .center)
                        .border(.black, width: 1.0)
                        .foregroundColor(.white)
                        .font(.title2)
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        .overlay {
                            Text(String(rouletteTable.getCountForNumber("2to1_1")))
                                .padding(1.0)
                                .frame(width: Defaults.two2oneWidth,
                                       height: Defaults.tileHeight,
                                       alignment: .bottomTrailing)
                        }
                    
                    Text("2to1")
                        .fontWeight(.bold)
                        .frame(width: Defaults.two2oneWidth, height: Defaults.tileHeight, alignment: .center)
                        .border(.black, width: 1.0)
                        .foregroundColor(.white)
                        .font(.title2)
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        .overlay {
                            Text(String(rouletteTable.getCountForNumber("2to1_2")))
                                .padding(1.0)
                                .frame(width: Defaults.two2oneWidth,
                                       height: Defaults.tileHeight,
                                       alignment: .bottomTrailing)
                        }
                    
                    Text("2to1")
                        .fontWeight(.bold)
                        .frame(width: Defaults.two2oneWidth, height: Defaults.tileHeight, alignment: .center)
                        .border(.black, width: 1.0)
                        .foregroundColor(.white)
                        .font(.title2)
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        .overlay {
                            Text(String(rouletteTable.getCountForNumber("2to1_3")))
                                .padding(1.0)
                                .frame(width: Defaults.two2oneWidth,
                                       height: Defaults.tileHeight,
                                       alignment: .bottomTrailing)
                        }

                    Spacer()
                    Spacer()
                    
                }.frame(width: Defaults.two2oneWidth,
                        height: Defaults.sectionHeight,
                        alignment: .center)
                .shadow(color: .black,
                        radius: Defaults.tileShadowRadius,
                        x: 1,
                        y: 1)
                
                VStack(alignment: .center, spacing: 0.0) {
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                    
                    Button {
                        playSound(key: "torch-click")
                    } label: {
                        Image("startButton")
                    }
                    .frame(width:Defaults.two2oneWidth/2, height: Defaults.two2oneWidth, alignment: .center)
                        .cornerRadius(Defaults.two2oneWidth/2.0)
                        .clipShape(Circle())
                        .overlay {
                            Text("?")
                                .font(.title)
                                .bold()
                                .padding(0)
                                .foregroundColor(.black)
                        }.shadow(color: .black, radius: 5, x: 2, y: 4)
                        
                        

                    
                    
                }.frame(width: Defaults.two2oneWidth, height: Defaults.sectionHeight, alignment: .center)
                
            }.background(Color(red: 0.0, green: 0.556, blue: 0.326))
            
            
            HStack {
                Spacer()
                Button("Reset") {
                    rouletteTable.resetRouletteTable()
                    playSound(key: "crumple")
                }.frame(width: Defaults.buttonWidth, height: Defaults.buttonHeight, alignment: .center)
                    .border(.black, width: 0.5)
                    .background(.red)
                    .cornerRadius(50.0)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 3.0, x: 2.0, y: 2.0)
                
                Button("Undo") {
                    rouletteTable.undo()
                    playSound(key: "torch-click")
                }.frame(width: Defaults.buttonWidth, height: Defaults.buttonHeight, alignment: .center)
                    .border(.black, width: 0.5)
                    .background(.green)
                    .cornerRadius(50.0)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 3.0, x: 2.0, y: 2.0)
                
                Button("Coloring") {
                    
                }.frame(width: Defaults.buttonWidth, height: Defaults.buttonHeight, alignment: .center)
                    .border(.black, width: 0.5)
                    .background(.gray)
                    .cornerRadius(50.0)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 3.0, x: 2.0, y: 2.0)
                
                Button("Extra") {
                    
                }.frame(width: Defaults.buttonWidth, height: Defaults.buttonHeight, alignment: .center)
                    .border(.black, width: 0.5)
                    .background(.blue)
                    .cornerRadius(50.0)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 3.0, x: 2.0, y: 2.0)
                    
                Spacer()
                Spacer()
                Spacer()
                Spacer()
            }.background(Color(red: 0.0, green: 0.556, blue: 0.326))
            
            
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
                                .padding(2)
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
                .onAppear(perform: {

                })
                .frame(width: 750.0, height: 30.0, alignment: .leading)
                    .border(.black, width: 2.0)
            }
            .shadow(color: .black,
                    radius: Defaults.sectionShadowRadius,
                    x: 1,
                    y: 1)
            Spacer()
        }.background(Color(red: 0.0, green: 0.556, blue: 0.326))
            .onLoad {
                
            }
    }
}



struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.device)
            .environment(\.sizeCategory, .medium)
            .previewDevice("iPhone 13 Pro Max")
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.landscapeRight)
            .background(Color(red: 0.0, green: 0.556, blue: 0.326))
    }
}
