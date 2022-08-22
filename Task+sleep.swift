//
//  Task+sleep.swift
//  RouletteHistory
//
//  Created by Jacob Chappelle on 2022-08-06.
//

import Foundation

extension Task where Success == Never, Failure == Never {
    static func sleep(seconds: Double) async throws {
        let duration = UInt64(seconds * 1_000_000_000)
        try await Task.sleep(nanoseconds: duration)
    }
}
