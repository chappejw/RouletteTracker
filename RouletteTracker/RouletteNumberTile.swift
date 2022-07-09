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

