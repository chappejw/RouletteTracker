//
//  ContentView.swift
//  RouletteTracker
//
//  Created by Jacob Chappelle on 2022-06-10.
//

import SwiftUI


struct RouletteNumber: View {
    var numberTile: String
    var numberCount: String
    var background: Color
    var body: some View {
        HStack {
            Text(self.numberTile)
                .fontWeight(.bold)
                .frame(width:50, height: 55, alignment: .center)
                .background(self.background)
                .foregroundColor(.white)
                .font(.title2)
                .rotationEffect(Angle(degrees: -90))
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.black, lineWidth: 1)
                }
                .overlay {
                    Rectangle().stroke(.black, lineWidth: 1)
                }
                .overlay {
                    Text(self.numberCount)
                        .frame(width: 48, height:58, alignment: .bottomTrailing)
                        .padding(0.0)
                        .foregroundColor(.white)
                        
                }
        }
    }
}



struct ContentView: View {
    let first12 = ["3","6","9","12","2","5","8","11","1","4","7","10"]
    let second12 = ["15","18","21","24","14","17","20","23","13","16","19","22"]
    let third12 = ["27","30","33","36","26","29","32","35","25","28","31","34"]
    
    let blacks: Set = ["1", "3", "5", "7", "9", "11", "13", "15", "17", "19", "21", "23", "25", "27", "29", "31", "33", "35"]
    let reds: Set = ["2", "4", "6", "8", "10", "12", "14", "16", "18", "20", "22", "24", "26", "28", "30", "32", "34", "36"]
    let greens: Set = ["0", "00"]
    
    let columns = [
        GridItem(.adaptive(minimum: 40))
    ]
    
    var body: some View {
        VStack {
            Spacer()
            HStack(spacing: 0.0) {
                VStack(spacing: 0.0) {
                    Spacer()
                    Button {
                        print("Button pressed")
                    } label: {
                        RouletteNumber(numberTile: "0", numberCount: "0", background: .green)
                    }
                    Button {
                        print("Button pressed")
                    } label: {
                        RouletteNumber(numberTile: "00", numberCount: "0", background: .green)
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
                            ForEach(first12, id: \.self) { item in
                                Button {
                                    print("Button pressed")
                                } label: {
                                    RouletteNumber(numberTile: "\(item)", numberCount: "0", background: blacks.contains(item) ? .black : .red)
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
                                Text("0").frame(width: 208, height:60, alignment: .bottomTrailing)
                            }
                        HStack {
                            Text("1to18")
                                .fontWeight(.bold)
                                .frame(width:100, height: 60, alignment: .center)
                                .border(.black, width: 1.0)
                                .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                                .font(.title2)
                                .foregroundColor(.white)
                                .overlay {
                                    Text("0").frame(width: 100, height:60, alignment: .bottomTrailing)
                                }
                            Text("EVEN")
                                .fontWeight(.bold)
                                .frame(width:100, height: 60, alignment: .center)
                                .border(.black, width: 1.0)
                                .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                                .font(.title2)
                                .foregroundColor(.white)
                                .overlay {
                                    Text("0").frame(width: 100, height:60, alignment: .bottomTrailing)
                                }
                        }
                    }
                }
                .frame(width: 208, height: 300, alignment: .top)
                .border(.black, width: 1.0)
                
                ScrollView {
                    VStack {
                        LazyVGrid(columns: columns, spacing: 0) {
                            ForEach(second12, id: \.self) { item in
                                Button {
                                    print("Button pressed")
                                } label: {
                                    RouletteNumber(numberTile: "\(item)", numberCount: "0", background: blacks.contains(item) ? .black : .red)
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
                                Text("0").frame(width: 208, height:60, alignment: .bottomTrailing)
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
                                    Text("0").frame(width: 100, height:60, alignment: .bottomTrailing)
                                }
                                
                            Text("BLACK")
                                .fontWeight(.bold)
                                .frame(width:100, height: 60, alignment: .center)
                                .border(.black, width: 1.0)
                                .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                                .foregroundColor(.black)
                                .font(.title2)
                                .overlay {
                                    Text("0").frame(width: 100, height:60, alignment: .bottomTrailing)
                                }
                        }
                    }
                }
                .frame(width: 208, height: 300, alignment: .top)
                .border(.black, width: 1.0)
                
                ScrollView {
                    VStack {
                        LazyVGrid(columns: columns, spacing: 0) {
                            ForEach(third12, id: \.self) { item in
                                Button {
                                    print("Button pressed")
                                } label: {
                                    RouletteNumber(numberTile: "\(item)", numberCount: "0", background: blacks.contains(item) ? .black : .red)
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
                                Text("0").frame(width: 208, height:60, alignment: .bottomTrailing)
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
                                    Text("0").frame(width: 100, height:60, alignment: .bottomTrailing)
                                }
                            Text("19to36")
                                .fontWeight(.bold)
                                .frame(width:100, height: 60, alignment: .center)
                                .border(.black, width: 1.0)
                                .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                                .foregroundColor(.white)
                                .font(.title2)
                                .overlay {
                                    Text("0").frame(width: 100, height:60, alignment: .bottomTrailing)
                                }
                        }
                    }
                }
                .frame(width: 208, height: 300, alignment: .top)
                .border(.black, width: 1.0)
                
                
                VStack(alignment: .center, spacing: 0.0) {
                    
                    Text("2to1")
                        .fontWeight(.bold)
                        .frame(width: 80, height: 55, alignment: .center)
                        .border(.black, width: 1.0)
                        .foregroundColor(.white)
                        .font(.title2)
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        .overlay {
                            Text("0").frame(width: 80, height:55, alignment: .bottomTrailing)
                        }
                    
                    Text("2to1")
                        .fontWeight(.bold)
                        .frame(width: 80, height: 55, alignment: .center)
                        .border(.black, width: 1.0)
                        .foregroundColor(.white)
                        .font(.title2)
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        .overlay {
                            Text("0").frame(width: 80, height:55, alignment: .bottomTrailing)
                        }
                    
                    Text("2to1")
                        .fontWeight(.bold)
                        .frame(width: 80, height: 55, alignment: .center)
                        .border(.black, width: 1.0)
                        .foregroundColor(.white)
                        .font(.title2)
                        .background(Color(red: 0.0, green: 0.556, blue: 0.326))
                        .overlay {
                            Text("0").frame(width: 80, height:55, alignment: .bottomTrailing)
                        }

                    Spacer()
                    Spacer()
                    
                }.frame(width: 80, height: 300, alignment: .center)
                
            }.background(Color(red: 0.0, green: 0.556, blue: 0.326))
            
            HStack {
                Spacer()
                Button("Reset") {
                    
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
            
            HStack {
                ForEach(second12, id: \.self) { item in
                    Text(item)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .background(reds.contains(item) ? .red : .black)
                        .frame(width: 35, height: 35, alignment: .center)
                        .clipShape(Circle())
                        .cornerRadius(100.0)
                }
            }.frame(width: 750.0, height: 35.0, alignment: .leading)
                    .border(.black, width: 1.0)
            
        }.background(Color(red: 0.0, green: 0.556, blue: 0.326))
        
        
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
