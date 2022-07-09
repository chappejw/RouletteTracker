//
//  View+OnLoad.swift
//  RouletteTracker
//
//  Created by Jacob Chappelle on 2022-07-05.
//

import SwiftUI

extension View {
    func onLoad(perform action: (() -> Void)? = nil) -> some View {
        modifier(ViewDidLoadModifier(perform: action))
    }
}
