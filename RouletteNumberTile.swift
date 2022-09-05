//
//  RouletteNumber.swift
//  RouletteTracker
//
//  Created by Jacob Chappelle on 2022-07-03.
//

import SwiftUI

struct RouletteNumberTile: View, Hashable {
    var numberTile: String
    var numberCount: String
    var background: Color
    var tileWidth: CGFloat
    var tileHeight: CGFloat
    var magicNumber: String {
        didSet {
            if magicNumber == numberTile {
                print("glow number")
            }
        }
    }
    
    let counterColor = Color(red: 255.0, green: 191.0, blue: 0.0)
    
    var body: some View {
        HStack {
            
            Text(numberTile)
                .fontWeight(.medium)
                .frame(width:tileWidth, height: tileHeight, alignment: .center)
                .background(background)
                .foregroundColor(.white)
//                .font(.title3)
                .rotationEffect(Angle(degrees: -90))
                .clipShape(Circle())
                .overlay {
                    ZStack {
                        Circle().stroke(.black, lineWidth: 1)
                        if magicNumber == numberTile {
                            Circle().fill(Color.yellow.opacity(0.45)).frame(width: tileWidth+25.0, height: tileHeight+25.0).scaleEffect(magicNumber == numberTile ? 1 : 0)
                            Circle().fill(Color.yellow.opacity(0.35)).frame(width: tileWidth+15.0, height: tileHeight+15.0).scaleEffect(magicNumber == numberTile ? 1 : 0)
                            Circle().fill(Color.yellow.opacity(0.25)).frame(width: tileWidth+10.0, height: tileHeight+10.0).scaleEffect(magicNumber == numberTile ? 1 : 0)
                            Circle().fill(background).frame(width: tileWidth, height: tileHeight).scaleEffect(magicNumber == numberTile ? 1 : 0)
                            Text(numberTile)
                                .fontWeight(.bold)
                                .frame(width:tileWidth,
                                       height: tileHeight,
                                       alignment: .center)
                                .background(background)
                                .foregroundColor(.white)
//                                .font(.title3)
                                .rotationEffect(Angle(degrees: -90))
                                .clipShape(Circle())
                            
                        }
                    }.animation(Animation.linear(duration: 0.7).repeatCount(2, autoreverses: false))
                }
                .overlay {
                    Rectangle().stroke(.black, lineWidth: 1)
                }
                .overlay {
                    Text(numberCount)
//                        .fontWeight(.medium)
                        .frame(width: tileWidth, height:tileHeight+5.0, alignment: .bottomTrailing)
                        .padding(0.0)
                        .foregroundColor(.white)
                }
        }
    }
}

