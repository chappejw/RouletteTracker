//
//  ContentView.swift
//  RouletteTracker
//
//  Created by Jacob Chappelle on 2022-06-10.
//

import SwiftUI


struct ContentView: View {
    let first12 = ["3","6","9","12","2","5","8","11","1","4","7","10"]
    let second12 = ["15","18","21","24","14","17","20","23","13","16","19","22"]
    let third12 = ["27","30","33","36","26","29","32","35","25","28","31","34"]
    
    let blacks: Set = ["1", "3", "5", "7", "9", "11", "13", "15", "17", "19", "21", "23", "25", "27", "29", "31", "33", "35"]
    let reds: Set = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36]
    let greens: Set = [0, 00]
    
    let columns = [
        GridItem(.adaptive(minimum: 40))
    ]
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 0.0) {
                VStack(spacing: 0.0) {
                    Spacer()
                    Text("0")
                        .fontWeight(.bold)
                        .frame(width:50, height: 40, alignment: .center)
                        .border(.black, width: 1.0)
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        .foregroundColor(.white)
                        .font(.title2)
                    Text("00")
                        .fontWeight(.bold)
                        .frame(width:50, height: 40, alignment: .center)
                        .border(.black, width: 1.0)
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        .foregroundColor(.white)
                        .font(.title2)
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }.frame(maxWidth: 50, maxHeight: 236)
                
                ScrollView {
                    VStack {
                        LazyVGrid(columns: columns, spacing: 0) {
                            ForEach(first12, id: \.self) { item in
                                Button {
                                    print("Button pressed")
                                    
                                } label: {
                                    Text(item)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .font(.title2)
                                }.frame(width:50, height: 40, alignment: .center)
                                    .border(.black, width: 1.0)
                                    .background(blacks.contains(item) ? .black : .red)
                                    .tag(Int(item))
                            }
                        }
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        
                        Text("1st 12")
                            .fontWeight(.bold)
                            .frame(width:208.0, height: 50)
                            .border(.black, width: 1.0)
                            .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                            .foregroundColor(.white)
                            .font(.title)
                        HStack {
                            Text("1to18")
                                .fontWeight(.bold)
                                .frame(width:100, height: 50, alignment: .center)
                                .border(.black, width: 1.0)
                                .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                                .font(.title2)
                                .foregroundColor(.white)
                            Text("EVEN")
                                .fontWeight(.bold)
                                .frame(width:100, height: 50, alignment: .center)
                                .border(.black, width: 1.0)
                                .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                    }
                }
                .frame(maxWidth: 208, maxHeight: 236)
                .border(.black, width: 1.0)
                
                ScrollView {
                    VStack {
                        LazyVGrid(columns: columns, spacing: 0) {
                            ForEach(second12, id: \.self) { item in
                                Button {
                                    print("Button pressed")
                                } label: {
                                    Text(item)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .font(.title2)
                                }
                                .frame(width:50, height: 40, alignment: .center)
                                    .border(.black, width: 1.0)
                                    .background(blacks.contains(item) ? .black : .red)
                                    .tag(Int(item))
                            }
                        }
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        
                        Text("2nd 12")
                            .fontWeight(.bold)
                            .frame(width:208.0, height: 50)
                            .border(.black, width: 1.0)
                            .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                            .font(.title)
                            .foregroundColor(.white)
                        HStack {
                            Text("RED")
                                .fontWeight(.bold)
                                .frame(width:100, height: 50, alignment: .center)
                                .border(.black, width: 1.0)
                                .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                                .foregroundColor(.white)
                                .font(.title2)
                            Text("BLACK")
                                .fontWeight(.bold)
                                .frame(width:100, height: 50, alignment: .center)
                                .border(.black, width: 1.0)
                                .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                                .foregroundColor(.white)
                                .font(.title2)
                        }
                    }
                }
                .frame(maxWidth: 208, maxHeight: 236)
                .border(.black, width: 1.0)
                
                ScrollView {
                    VStack {
                        LazyVGrid(columns: columns, spacing: 0) {
                            ForEach(third12, id: \.self) { item in
                                Button {
                                    print("Button pressed")
                                } label: {
                                    Text(item)
                                        .fontWeight(.bold)
                                        .foregroundColor(.white)
                                        .font(.title2)
                                }.frame(width:50, height: 40, alignment: .center)
                                    .border(.black, width: 1.0)
                                    .background(blacks.contains(item) ? .black : .red)
                                    .tag(Int(item))
                            }
                        }
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        
                        Text("3rd 12")
                            .fontWeight(.bold)
                            .frame(width:208.0, height: 50)
                            .border(.black, width: 1.0)
                            .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                            .font(.title)
                            .foregroundColor(.white)
                        HStack {
                            Text("ODD")
                                .fontWeight(.bold)
                                .frame(width:100, height: 50, alignment: .center)
                                .border(.black, width: 1.0)
                                .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                                .foregroundColor(.white)
                                .font(.title2)
                            Text("19to36")
                                .fontWeight(.bold)
                                .frame(width:100, height: 50, alignment: .center)
                                .border(.black, width: 1.0)
                                .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                                .foregroundColor(.white)
                                .font(.title2)
                        }
                    }
                }
                .frame(maxWidth: 208, maxHeight: 236)
                .border(.black, width: 1.0)
                
                
                VStack(alignment: .center, spacing: 0.0) {
                    
                    Text("2to1")
                        .fontWeight(.bold)
                        .frame(width: 80, height: 40, alignment: .center)
                        .border(.black, width: 1.0)
                        .foregroundColor(.white)
                        .font(.title2)
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                    
                    Text("2to1")
                        .fontWeight(.bold)
                        .frame(width: 80, height: 40, alignment: .center)
                        .border(.black, width: 1.0)
                        .foregroundColor(.white)
                        .font(.title2)
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                    
                    Text("2to1")
                        .fontWeight(.bold)
                        .frame(width: 80, height: 40, alignment: .center)
                        .border(.black, width: 1.0)
                        .foregroundColor(.white)
                        .font(.title2)
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))

                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }.padding(0.0).frame(maxWidth: 80, maxHeight: 236)
                
            }.padding(0.0)
                .frame(height: nil)
                .background(Color(red: 0.0, green: 0.556, blue: 0.326))
            
            HStack {
                Spacer()
                Button("Reset") {
                    
                }.frame(width: 150.0, height: 50.0, alignment: .center)
                    .border(.black, width: 1.0)
                    .background(.red)
                    
                Button("Undo") {
                    
                }.frame(width: 150.0, height: 50.0, alignment: .center)
                    .border(.black, width: 1.0)
                    .background(.green)
                
                Button("Coloring") {
                    
                }.frame(width: 150.0, height: 50.0, alignment: .center)
                    .border(.black, width: 1.0)
                    .background(.gray)
                
                Button("Extra") {
                    
                }.frame(width: 150.0, height: 50.0, alignment: .center)
                    .border(.black, width: 1.0)
                Spacer()
                Spacer()
            }.background(Color(red: 0.0, green: 0.556, blue: 0.326))
            Spacer()
            
        }.background(Color(red: 0.0, green: 0.556, blue: 0.326))
        
        
    }
}



struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewDevice("iPhone 13 Pro Max")
            .preferredColorScheme(.dark)
            .previewInterfaceOrientation(.landscapeRight)
            .background(Color(red: 0.0, green: 0.556, blue: 0.326))
    }
}
