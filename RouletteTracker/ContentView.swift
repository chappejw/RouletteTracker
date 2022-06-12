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
        GridItem(.adaptive(minimum: 50))
    ]
    
    
    //var rouletteCells: [Any] = [View1.self, View2.self]
    
    var body: some View {
        VStack {
            HStack {
                VStack {
                    Text("0").frame(width:50, height: 50, alignment: .center).border(.black, width: 3.0).background()
                    Text("00").frame(width:50, height: 50, alignment: .center).border(.black, width: 3.0).background()
                }
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 60) {
                        ForEach(first12, id: \.self) { item in
                            Text(item).frame(width:55, height: 50, alignment: .center).border(.black, width: 3.0).background()
                        }
                    }.padding(.horizontal)
                        .padding(.vertical)
                        .background(.green)
                }
                .frame(maxWidth: 300, maxHeight: 300)
                .border(.green, width: 3.0).background()
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 60) {
                        ForEach(second12, id: \.self) { item in
                            Text(item).frame(width:55, height: 50, alignment: .center).border(.black, width: 3.0).background()
                        }
                    }.padding(.horizontal)
                        .padding(.vertical)
                        .background(.green)
                }
                .frame(maxWidth: 300, maxHeight: 300)
                .border(.green, width: 3.0).background()
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 60) {
                        ForEach(third12, id: \.self) { item in
                            Text(item).frame(width:55, height: 50, alignment: .center).border(.black, width: 3.0).background()
                        }
                    }.padding(.horizontal)
                        .padding(.vertical)
                        .background(.green)
                }
                .frame(maxWidth: 300, maxHeight: 300)
                .border(.green, width: 3.0).background()
                
                Text("<== 2 to 1")
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
            
        }.background(.green)
        
        
    }
}



struct Previews_ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.landscapeRight)
    }
}
