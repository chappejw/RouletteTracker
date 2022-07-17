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
    
    var body: some View {
        HStack {
            Text(numberTile)
                .fontWeight(.bold)
                .frame(width:tileWidth, height: tileHeight, alignment: .center)
                .background(background)
                .foregroundColor(.white)
                .font(.title2)
                .rotationEffect(Angle(degrees: -90))
                //.allowsTightening(true)
                .clipShape(Circle())
                .overlay {
                    Circle().stroke(.black, lineWidth: 1)
                }
                .overlay {
                    Rectangle().stroke(.black, lineWidth: 1)
                }
                .overlay {
                    Text(numberCount)
                        .frame(width: tileWidth, height:tileHeight, alignment: .bottomTrailing)
                        .padding(0.0)
                        .foregroundColor(.white)
                        
                }
        }
    }
}

