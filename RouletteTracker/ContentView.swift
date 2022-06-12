//
//  ContentView.swift
//  RouletteTracker
//
//  Created by Jacob Chappelle on 2022-06-10.
//

import SwiftUI

//struct ContentView: View {
//    var body: some View {
//        Checkerboard(rows: 16, columns: 16)
//            .fill(.red)
//            .frame(width: 350, height: 350)
//    }
//}

private var symbols = ["keyboard", "hifispeaker.fill", "printer.fill", "tv.fill", "desktopcomputer", "headphones", "tv.music.note", "mic", "plus.bubble", "video"]

private var colors: [Color] = [.yellow, .purple, .green]

private var gridItemLayout = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]



struct ContentView: View {
    let data = (1...100).map { "\($0)" }
    let first12 = (1...12).map { "\($0)" }
    let second12 = (13...24).map { "\($0)" }
    let third12 = (25...36).map { "\($0)" }
    
    let columns = [
        GridItem(.adaptive(minimum: 40))
    ]
    
    
    //var rouletteCells: [Any] = [View1.self, View2.self]
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Spacer()
                    Text("0").frame(width:40, height: 40, alignment: .center)
                        .border(.black, width: 3.0)
                        .background(.green)
                        .padding([.leading])
                    Text("00").frame(width:40, height: 40, alignment: .center)
                        .border(.black, width: 3.0)
                        .background(.green)
                        .padding([.leading])
                    Spacer()
                    Spacer()
                    Spacer()
                }
                ScrollView {
                    VStack {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(first12, id: \.self) { item in
                                Button {
                                    print("Button pressed")
                                } label: {
                                    Text(item)
                                }.frame(width:40, height: 40, alignment: .center)
                                    .border(.black, width: 3.0)
                                    .background(.green)
                                    .tag(Int(item))
                            }
                        }.padding(.vertical)
                        .background(.green)
                        Text("1st 12").frame(width:200, height: 80)
                            .padding([.trailing])
                            .border(.black, width: 3.0)
                            .background(.green)
                            .font(.title)
                    }.padding([.leading, .trailing])
                }
                .frame(maxWidth: 230, maxHeight: 320)
                .border(.black, width: 3.0)
                
                
                ScrollView {
                    VStack {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(second12, id: \.self) { item in
                                Button {
                                    print("Button pressed")
                                } label: {
                                    Text(item)
                                }.frame(width:40, height: 40, alignment: .center)
                                    .border(.black, width: 3.0)
                                    .background(.green)
                                    .tag(Int(item))
                            }
                        }.padding(.vertical)
                        .background(.green)
                        Text("2nd 12").frame(width:200, height: 80)
                            .padding([.trailing])
                            .border(.black, width: 3.0)
                            .background(.green)
                            .font(.title)
                    }.padding([.leading, .trailing])
                }
                .frame(maxWidth: 230, maxHeight: 320)
                .border(.red, width: 3.0)
                
                ScrollView {
                    VStack {
                        LazyVGrid(columns: columns, spacing: 20) {
                            ForEach(third12, id: \.self) { item in
                                Button {
                                    print("Button pressed")
                                } label: {
                                    Text(item)
                                }.frame(width:40, height: 40, alignment: .center)
                                    .border(.black, width: 3.0)
                                    .background(.green)
                                    .tag(Int(item))
                            }
                        }.padding(.vertical)
                        .background(.green)
                        Text("3rd 12").frame(width:200, height: 80)
                            .padding([.trailing])
                            .border(.black, width: 3.0)
                            .background(.green)
                            .font(.title)
                    }.padding([.leading, .trailing])
                }
                .frame(maxWidth: 230, maxHeight: 320)
                .border(.red, width: 3.0)
                
                
                
                VStack {
                    
                    Text("2to1")
                        .frame(width: 50, height: 10, alignment: .center)
                        .padding(.horizontal)
                        .padding(.vertical)
                        .border(.black, width: 3.0)
                    Spacer()
                    Text("2to1")
                        .frame(width: 50, height: 10, alignment: .trailing)
                        .padding(.horizontal).padding(.vertical)
                        .border(.black, width: 3.0)
                    Spacer()
                    Text("2to1")
                        .frame(width: 50, height: 10, alignment: .trailing)
                        .padding(.horizontal).padding(.vertical)
                        .border(.black, width: 3.0)
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                    Spacer()
                }.frame(maxWidth: 100, maxHeight: 280)
                
            }.background(.green)
            
            HStack {
                Spacer()
                Spacer()
                Button("Reset") {
                    
                }.frame(width: 150.0, height: 50.0, alignment: .center)
                    .border(.black, width: 3.0)
                    .background(.red)
                    .padding(.horizontal).contentShape(Rectangle()).cornerRadius(5.0)
                    
                    
                Button("Undo") {
                    
                }.frame(width: 150.0, height: 50.0, alignment: .center)
                    .border(.black, width: 3.0).padding(.horizontal)
                    .background(.green)
                    .padding(.horizontal).contentShape(Rectangle()).cornerRadius(5.0)
                
                Button("Coloring") {
                    
                }.frame(width: 150.0, height: 50.0, alignment: .center)
                    .border(.black, width: 3.0)
                    .padding(.horizontal).contentShape(Rectangle()).cornerRadius(5.0)
                    .background(.gray)
                
                Button("Extra") {
                    
                }.frame(width: 150.0, height: 50.0, alignment: .center)
                    .border(.black, width: 3.0).padding(.horizontal).contentShape(Rectangle())
                Spacer()
                Spacer()
            }.background(.green)
            Spacer()
            
        }.background(.green)
        
        
    }
}



struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
