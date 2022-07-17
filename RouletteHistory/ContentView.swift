//
//  ContentView.swift
//  RouletteTracker
//
//  Created by Jacob Chappelle on 2022-06-10.
//

import SwiftUI

struct ContentView: View {
        
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
        static let historyNumWidth = 30.0
        static let historyNumHeight = 30.0
    }
    
    let columns = [
        GridItem(.adaptive(minimum: 33, maximum: 33))
    ]
   
    @StateObject var rouletteTable = RouletteTable(reset: true)
    
    var body: some View {
        
        VStack {
            Spacer()
            HStack(spacing: 0.0) {
                VStack(spacing: 0.0) {
                    Spacer()
                    Button {
                        rouletteTable.numberStats["0"] = 0
                        rouletteTable.updateCountsForNumber("0")
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
                    
                
                ScrollView {
                    VStack {
                        LazyVGrid(columns: columns, spacing: 0) {
                            ForEach(rouletteTable.first12, id: \.self) { item in
                                Button {
                                    rouletteTable.numberStats[item] = 0
                                    rouletteTable.updateCountsForNumber(item)
                                } label: {
                                    RouletteNumberTile(numberTile: "\(item)",
                                                   numberCount: String(rouletteTable.getCountForNumber(item)),
                                                   background: rouletteTable.blacks.contains(item) ? .black : .red,
                                                   tileWidth: Defaults.tileWidth,
                                                   tileHeight: Defaults.tileHeight)
                                }.frame(width:Defaults.tileWidth, height: Defaults.tileHeight, alignment: .center)
                            }
                        }
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        
                        Text("1st 12")
                            .fontWeight(.bold)
                            .frame(width:Defaults.sectionWidth, height: Defaults.section12Height)
                            .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                            .foregroundColor(.white)
                            .font(.title)
                            .overlay {
                                Text(String(rouletteTable.getCountForNumber("1st12")))
                                    .frame(width: Defaults.sectionWidth,
                                           height:Defaults.section12Height+17.0,
                                           alignment: .bottomTrailing)
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
                                } label: {
                                    RouletteNumberTile(numberTile: "\(item)",
                                                   numberCount: String(rouletteTable.getCountForNumber(item)),
                                                   background: rouletteTable.blacks.contains(item) ? .black : .red,
                                                   tileWidth: Defaults.tileWidth,
                                                   tileHeight: Defaults.tileHeight)
                                }.frame(width:Defaults.tileWidth, height: Defaults.tileHeight, alignment: .center)
                            }
                        }
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        
                        Text("2nd 12")
                            .fontWeight(.bold)
                            .frame(width:Defaults.sectionWidth, height: Defaults.section12Height)
                            .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                            .font(.title)
                            .foregroundColor(.white)
                            .overlay {
                                Text(String(rouletteTable.getCountForNumber("2nd12")))
                                    .frame(width: Defaults.sectionWidth,
                                           height:Defaults.section12Height+17.0,
                                           alignment: .bottomTrailing)
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
                                } label: {
                                    RouletteNumberTile(numberTile: "\(item)",
                                                   numberCount: String(rouletteTable.getCountForNumber(item)),
                                                   background: rouletteTable.blacks.contains(item) ? .black : .red,
                                                   tileWidth: Defaults.tileWidth,
                                                   tileHeight: Defaults.tileHeight)
                                }.frame(width:Defaults.tileWidth, height: Defaults.tileHeight, alignment: .center)
                            }
                        }
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        
                        Text("3rd 12")
                            .fontWeight(.bold)
                            .frame(width: Defaults.sectionWidth, height: Defaults.section12Height)
                            .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                            .font(.title)
                            .foregroundColor(.white)
                            .overlay {
                                Text(String(rouletteTable.getCountForNumber("3rd12")))
                                    .frame(width: Defaults.sectionWidth,
                                           height:Defaults.section12Height+17.0,
                                           alignment: .bottomTrailing)
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
                                .frame(width: Defaults.two2oneWidth,
                                       height: Defaults.tileHeight,
                                       alignment: .bottomTrailing)
                        }

                    Spacer()
                    Spacer()
                    
                }.frame(width: Defaults.two2oneWidth, height: Defaults.sectionHeight, alignment: .center)
                
            }.background(Color(red: 0.0, green: 0.556, blue: 0.326))
            
            HStack {
                Spacer()
                Button("Reset") {
                    rouletteTable.resetRouletteTable()
                }.frame(width: Defaults.buttonWidth, height: Defaults.buttonHeight, alignment: .center)
                    .border(.black, width: 0.5)
                    .background(.red)
                    .cornerRadius(50.0)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 3.0, x: 2.0, y: 2.0)
                
                Button("Undo") {
                    
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
                        }
                        Spacer()
                            .id("anID")
                    }.frame(width: CGFloat(rouletteTable.numberHistory.count) * Defaults.historyNumWidth,
                            height: Defaults.historyNumHeight,
                            alignment: .trailing)
                }
                .onChange(of: rouletteTable.numberHistory, perform: { proxy in
                    value.scrollTo("anID")
                })
                .onAppear(perform: {

                })
                .frame(width: 750.0, height: 30.0, alignment: .leading)
                    .border(.black, width: 2.0)
            }
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
