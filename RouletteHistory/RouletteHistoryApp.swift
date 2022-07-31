//
//  RouletteTrackerApp.swift
//  RouletteTracker
//
//  Created by Jacob Chappelle on 2022-06-10.
//

import SwiftUI

@main
struct RouletteHistoryApp: App {
    @StateObject var rouletteTable = RouletteTable(reset: true)
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(rouletteTable)
        }
    }
}

struct Previews_RouletteHistoryApp_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .previewInterfaceOrientation(.landscapeRight)
        }
    }
}
