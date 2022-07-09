//
//  ContentView.swift
//  RouletteTracker
//
//  Created by Jacob Chappelle on 2022-06-10.
//

import SwiftUI

struct ContentView: View {
    
    let columns = [
        GridItem(.adaptive(minimum: 40))
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
                                       background: .green)
                    }
                    
                    Button {
                        rouletteTable.numberStats["00"] = 0
                        rouletteTable.updateCountsForNumber("00")
                    } label: {
                        RouletteNumberTile(numberTile: "00",
                                       numberCount: String(rouletteTable.getCountForNumber("00")),
                                       background: .green)
                    }
                    
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    
                }.frame(width: 50, height: 300)
                
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
                                                   background: rouletteTable.blacks.contains(item) ? .black : .red)
                                }
                            }
                        }
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        
                        Text("1st 12")
                            .fontWeight(.bold)
                            .frame(width:208.0, height: 60)
                            .border(.black, width: 1.0)
                            .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                            .foregroundColor(.white)
                            .font(.title)
                            .overlay {
                                Text(String(rouletteTable.getCountForNumber("1st12")))
                                    .frame(width: 208, height:60, alignment: .bottomTrailing)
                            }
                        HStack {
                            Text("1 to 18")
                                .fontWeight(.bold)
                                .frame(width:100, height: 60, alignment: .center)
                                .border(.black, width: 1.0)
                                .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                                .font(.title2)
                                .foregroundColor(.white)
                                .overlay {
                                    Text(String(rouletteTable.getCountForNumber("1to18")))
                                        .frame(width: 100, height:60, alignment: .bottomTrailing)
                                }
                            Text("EVEN")
                                .fontWeight(.bold)
                                .frame(width:100, height: 60, alignment: .center)
                                .border(.black, width: 1.0)
                                .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                                .font(.title2)
                                .foregroundColor(.white)
                                .overlay {
                                    Text(String(rouletteTable.getCountForNumber("EVEN")))
                                        .frame(width: 100, height:60, alignment: .bottomTrailing)
                                }
                        }
                    }
                }
                .frame(width: 208, height: 300, alignment: .top)
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
                                                   background: rouletteTable.blacks.contains(item) ? .black : .red)
                                }
                            }
                        }
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        
                        Text("2nd 12")
                            .fontWeight(.bold)
                            .frame(width:208.0, height: 60)
                            .border(.black, width: 1.0)
                            .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                            .font(.title)
                            .foregroundColor(.white)
                            .overlay {
                                Text(String(rouletteTable.getCountForNumber("2nd12")))
                                    .frame(width: 208, height:60, alignment: .bottomTrailing)
                            }
                        HStack {
                            Text("RED")
                                .fontWeight(.bold)
                                .frame(width:100, height: 60, alignment: .center)
                                .border(.black, width: 1.0)
                                .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                                .foregroundColor(.red)
                                .font(.title2)
                                .overlay {
                                    Text(String(rouletteTable.getCountForNumber("RED")))
                                        .frame(width: 100, height:60, alignment: .bottomTrailing)
                                }
                                
                            Text("BLACK")
                                .fontWeight(.bold)
                                .frame(width:100, height: 60, alignment: .center)
                                .border(.black, width: 1.0)
                                .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                                .foregroundColor(.black)
                                .font(.title2)
                                .overlay {
                                    Text(String(rouletteTable.getCountForNumber("BLACK")))
                                        .frame(width: 100, height:60, alignment: .bottomTrailing)
                                }
                        }
                    }
                }
                .frame(width: 208, height: 300, alignment: .top)
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
                                                   background: rouletteTable.blacks.contains(item) ? .black : .red)
                                }
                            }
                        }
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        
                        Text("3rd 12")
                            .fontWeight(.bold)
                            .frame(width:208.0, height: 60)
                            .border(.black, width: 1.0)
                            .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                            .font(.title)
                            .foregroundColor(.white)
                            .overlay {
                                Text(String(rouletteTable.getCountForNumber("3rd12"))).frame(width: 208, height:60, alignment: .bottomTrailing)
                            }
                        HStack {
                            Text("ODD")
                                .fontWeight(.bold)
                                .frame(width:100, height: 60, alignment: .center)
                                .border(.black, width: 1.0)
                                .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                                .foregroundColor(.white)
                                .font(.title2)
                                .overlay {
                                    Text(String(rouletteTable.getCountForNumber("ODD"))).frame(width: 100, height:60, alignment: .bottomTrailing)
                                }
                            Text("19 to 36")
                                .fontWeight(.bold)
                                .frame(width:100, height: 60, alignment: .center)
                                .border(.black, width: 1.0)
                                .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                                .foregroundColor(.white)
                                .font(.title2)
                                .overlay {
                                    Text(String(rouletteTable.getCountForNumber("19to36"))).frame(width: 100, height:60, alignment: .bottomTrailing)
                                }
                        }
                    }
                }
                .frame(width: 208, height: 300, alignment: .top)
                .border(.black, width: 1.0)
                .scrollEnabled(false)
                
                VStack(alignment: .center, spacing: 0.0) {
                    
                    Text("2to1")
                        .fontWeight(.bold)
                        .frame(width: 80, height: 55, alignment: .center)
                        .border(.black, width: 1.0)
                        .foregroundColor(.white)
                        .font(.title2)
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        .overlay {
                            Text(String(rouletteTable.getCountForNumber("2to1_1"))).frame(width: 80, height:55, alignment: .bottomTrailing)
                        }
                    
                    Text("2to1")
                        .fontWeight(.bold)
                        .frame(width: 80, height: 55, alignment: .center)
                        .border(.black, width: 1.0)
                        .foregroundColor(.white)
                        .font(.title2)
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        .overlay {
                            Text(String(rouletteTable.getCountForNumber("2to1_2"))).frame(width: 80, height:55, alignment: .bottomTrailing)
                        }
                    
                    Text("2to1")
                        .fontWeight(.bold)
                        .frame(width: 80, height: 55, alignment: .center)
                        .border(.black, width: 1.0)
                        .foregroundColor(.white)
                        .font(.title2)
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        .overlay {
                            Text(String(rouletteTable.getCountForNumber("2to1_3"))).frame(width: 80, height:55, alignment: .bottomTrailing)
                        }

                    Spacer()
                    Spacer()
                    
                }.frame(width: 80, height: 300, alignment: .center)
                
            }.background(Color(red: 0.0, green: 0.556, blue: 0.326))
            
            HStack {
                Spacer()
                Button("Reset") {
                    rouletteTable.resetRouletteTable()
                }.frame(width: 150.0, height: 30.0, alignment: .center)
                    .border(.black, width: 0.5)
                    .background(.red)
                    .cornerRadius(50.0)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 3.0, x: 2.0, y: 2.0)
                
                Button("Undo") {
                    
                }.frame(width: 150.0, height: 30.0, alignment: .center)
                    .border(.black, width: 0.5)
                    .background(.green)
                    .cornerRadius(50.0)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 3.0, x: 2.0, y: 2.0)
                
                Button("Coloring") {
                    
                }.frame(width: 150.0, height: 30.0, alignment: .center)
                    .border(.black, width: 0.5)
                    .background(.gray)
                    .cornerRadius(50.0)
                    .foregroundColor(.black)
                    .shadow(color: .black, radius: 3.0, x: 2.0, y: 2.0)
                
                Button("Extra") {
                    
                }.frame(width: 150.0, height: 30.0, alignment: .center)
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
                                .foregroundColor(.white)
                                .background(rouletteTable.greens.contains(item) ? .green : rouletteTable.reds.contains(item) ? .red : .black)
                                .frame(width: 25, height: 45, alignment: .center)
                                .id(rouletteTable.numberHistory.lastIndex(of: item))
                        }
                        Spacer()
                            .id("anID")
                    }.frame(width: CGFloat(rouletteTable.numberHistory.count) * 25.0,
                            height: 50.0,
                            alignment: .trailing)
                }
                .onChange(of: rouletteTable.numberHistory, perform: { proxy in
                    value.scrollTo("anID")
                })
                .onAppear(perform: {

                })
                .frame(width: 750.0, height: 50.0, alignment: .leading)
                    .border(.black, width: 1.0)
                    
            }
            
        }.background(Color(red: 0.0, green: 0.556, blue: 0.326))
            .onLoad {
                
            }
    }
}



struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewLayout(.device)
            .environment(\.sizeCategory, .extraSmall)
            .previewDevice("iPhone 11")
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.landscapeRight)
            .background(Color(red: 0.0, green: 0.556, blue: 0.326))
    }
}
