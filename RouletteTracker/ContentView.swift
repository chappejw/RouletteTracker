//
//  ContentView.swift
//  RouletteTracker
//
//  Created by Jacob Chappelle on 2022-06-10.
//

import SwiftUI


struct ContentView: View {
    let first12 = (1...12).map { "\($0)" }
    let second12 = (13...24).map { "\($0)" }
    let third12 = (25...36).map { "\($0)" }
    
    let columns = [
        GridItem(.adaptive(minimum: 40))
    ]
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 0.0) {
                VStack(spacing: 0.0) {
                    Spacer()
                    Text("0").frame(width:50, height: 40, alignment: .center)
                        .border(.black, width: 3.0)
                        .background(.green)
                        .foregroundColor(.white)
                        .font(.title2)
                    Text("00").frame(width:50, height: 40, alignment: .center)
                        .border(.black, width: 3.0)
                        .background(.green)
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
                                        .fontWeight(.light)
                                        .foregroundColor(.white)
                                        .font(.title2)
                                }.frame(width:50, height: 40, alignment: .center)
                                    .border(.black, width: 3.0)
                                    .background(.green)
                                    .tag(Int(item))
                            }
                        }
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        
                        Text("1st 12")
                            .frame(width:208.0, height: 50)
                            .border(.black, width: 3.0)
                            .background(.green)
                            .foregroundColor(.white)
                            .font(.title)
                        HStack {
                            Text("1to18")
                                .frame(width:100, height: 50, alignment: .center)
                                .border(.black, width: 3.0)
                                .background(.green)
                                .font(.title2)
                                .foregroundColor(.white)
                            Text("EVEN")
                                .frame(width:100, height: 50, alignment: .center)
                                .border(.black, width: 3.0)
                                .background(.green)
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                    }
                }
                .frame(maxWidth: 208, maxHeight: 236)
                .border(.black, width: 3.0)
                
                
                ScrollView {
                    VStack {
                        LazyVGrid(columns: columns, spacing: 0) {
                            ForEach(first12, id: \.self) { item in
                                Button {
                                    print("Button pressed")
                                } label: {
                                    Text(item)
                                        .foregroundColor(.white)
                                        .font(.title2)
                                }
                                .frame(width:50, height: 40, alignment: .center)
                                    .border(.black, width: 3.0)
                                    .background(.green)
                                    .tag(Int(item))
                            }
                        }
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        
                        Text("2nd 12")
                            .frame(width:208.0, height: 50)
                            .border(.black, width: 3.0)
                            .background(.green)
                            .font(.title)
                            .foregroundColor(.white)
                        HStack {
                            Text("RED")
                                .frame(width:100, height: 50, alignment: .center)
                                .border(.black, width: 3.0)
                                .background(.green)
                                .foregroundColor(.white)
                                .font(.title2)
                            Text("BLACK")
                                .frame(width:100, height: 50, alignment: .center)
                                .border(.black, width: 3.0)
                                .background(.green)
                                .foregroundColor(.white)
                                .font(.title2)
                        }
                    }
                }
                .frame(maxWidth: 208, maxHeight: 236)
                .border(.black, width: 3.0)
                
                ScrollView {
                    VStack {
                        LazyVGrid(columns: columns, spacing: 0) {
                            ForEach(third12, id: \.self) { item in
                                Button {
                                    print("Button pressed")
                                } label: {
                                    Text(item)
                                        .foregroundColor(.white)
                                        .font(.title2)
                                }.frame(width:50, height: 40, alignment: .center)
                                    .border(.black, width: 3.0)
                                    .background(.green)
                                    .tag(Int(item))
                            }
                        }
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        
                        Text("3rd 12")
                            .frame(width:208.0, height: 50)
                            .border(.black, width: 3.0)
                            .background(.green)
                            .font(.title)
                            .foregroundColor(.white)
                        HStack {
                            Text("ODD")
                                .frame(width:100, height: 50, alignment: .center)
                                .border(.black, width: 3.0)
                                .background(.green)
                                .foregroundColor(.white)
                                .font(.title2)
                            Text("19to36")
                                .frame(width:100, height: 50, alignment: .center)
                                .border(.black, width: 3.0)
                                .background(.green)
                                .foregroundColor(.white)
                                .font(.title2)
                        }
                    }
                }
                .frame(maxWidth: 208, maxHeight: 236)
                .border(.black, width: 3.0)
                
                
                VStack(alignment: .center, spacing: 0.0) {
                    
                    Text("2to1")
                        .frame(width: 80, height: 40, alignment: .center)
                        .border(.black, width: 3.0)
                        .foregroundColor(.white)
                        .font(.title2)
                        .background(.green)
                    
                    Text("2to1")
                        .frame(width: 80, height: 40, alignment: .center)
                        .border(.black, width: 3.0)
                        .foregroundColor(.white)
                        .font(.title2)
                        .background(.green)
                    
                    Text("2to1")
                        .frame(width: 80, height: 40, alignment: .center)
                        .border(.black, width: 3.0)
                        .foregroundColor(.white)
                        .font(.title2)
                        .background(.green)

                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }.padding(0.0).frame(maxWidth: 80, maxHeight: 236)
                
            }.padding(0.0).frame(height: nil).background(Color(red: 0.0, green: 0.556, blue: 0.326))
            
            HStack {
                Spacer()
                Button("Reset") {
                    
                }.frame(width: 150.0, height: 50.0, alignment: .center)
                    .border(.black, width: 3.0)
                    .background(.red)
                    
                Button("Undo") {
                    
                }.frame(width: 150.0, height: 50.0, alignment: .center)
                    .border(.black, width: 3.0)
                    .background(.green)
                
                Button("Coloring") {
                    
                }.frame(width: 150.0, height: 50.0, alignment: .center)
                    .border(.black, width: 3.0)
                    .background(.gray)
                
                Button("Extra") {
                    
                }.frame(width: 150.0, height: 50.0, alignment: .center)
                    .border(.black, width: 3.0)
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
