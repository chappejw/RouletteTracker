//
//  RouletteTable.swift
//  RouletteTracker
//
//  Created by Jacob Chappelle on 2022-07-05.
//

import Foundation
import SwiftUI

enum TableState: Int {
    typealias RawValue = Int
    
    case started, stopped, clearTable
}

class RouletteTable: ObservableObject {
    @Published var numberStats = [String: Int]()
    @Published var numberHistory = [String]()
    @Published var magicNumber = ""
    
    let first12 = ["3","6","9","12","2","5","8","11","1","4","7","10"]
    let second12 = ["15","18","21","24","14","17","20","23","13","16","19","22"]
    let third12 = ["27","30","33","36","26","29","32","35","25","28","31","34"]
    let twoToOne_1 = ["3","6","9","12","15","18","21","24","27","30","33","36"]
    let twoToOne_2 = ["2","5","8","11","14","17","20","23","26","29","32","35"]
    let twoToOne_3 = ["1","4","7","10","13","16","19","22","25","28","31","34"]
        
    let blacks: Set = ["1", "3", "5", "7", "9", "11", "13", "15", "17", "19", "21", "23", "25", "27", "29", "31", "33", "35"]
    let reds: Set = ["2", "4", "6", "8", "10", "12", "14", "16", "18", "20", "22", "24", "26", "28", "30", "32", "34", "36"]
    let greens: Set = ["0", "00"]
    
    var trackNumbers = ["00","27","10","25","29","12","8","19","31","18","6","21","33","16","4","23","35","14","2","0","28","9","26","30","11","7","20","32","17","5","22","34","15","3","24","36","13","1"]
    
    var numberSelected: String?
    var tableState: Int = TableState.clearTable.rawValue
   
    private var timer: Timer?
    private let timerInterval = 0.01
    
    @Published var timerValue: Double = 0.0
    
    init(reset: Bool) {
        if reset {
            setupRouletteTable()
        }
    }
    
    private var timerActive = false //{
    
    private func startTimer() {
        if timer != nil { return }
        
        timer = Timer.scheduledTimer(timeInterval: timerInterval,
                                     target: self,
                                     selector: #selector(updateTimer),
                                     userInfo: nil,
                                     repeats: true)
        timer?.tolerance = 0.01
        timerActive = true
    }
    
    private func stopTimer( resetValue: Bool = false ) {
        timer?.invalidate()
        timer = nil
        
        if resetValue {
            timerValue = 0
        }
        timerActive = false
    }
    
    @objc private func updateTimer() {
        timerValue += timerInterval
    }
    
    func isStopped() -> Bool {
        tableState == TableState.stopped.rawValue
    }
    
    fileprivate func hapticClick() {
        let impactMed = UIImpactFeedbackGenerator(style: .heavy)
        impactMed.impactOccurred()
    }
    
    func startSpin() {
        startTimer()
        tableState = TableState.started.rawValue
        hapticClick()
    }
    
    func stopSpin() {
        stopTimer()
        tableState = TableState.stopped.rawValue
        hapticClick()
    }
    
    func clearTableState() {
        stopTimer(resetValue: true)
        numberSelected = nil
        tableState = TableState.clearTable.rawValue
        magicNumber = ""
        hapticClick()
    }
    
    func nextNumber(number: String) -> String {
        guard let index = trackNumbers.firstIndex(of: number) else { return "" }
        
        if index < trackNumbers.endIndex {
            let nextIndex = trackNumbers.index(after: index)
            return trackNumbers[nextIndex]
        } else if index == trackNumbers.endIndex {
            return trackNumbers[0] // After the last number is the first number
        } else {
            return ""
        }
    }
    
    func previousNumber(number: String) -> String {
        guard let index = trackNumbers.firstIndex(of: number) else { return "" }
        
        if index > trackNumbers.startIndex {
            let prevIndex = trackNumbers.index(before: index)
            return trackNumbers[prevIndex]
        } else if index == trackNumbers.startIndex {
            return trackNumbers[trackNumbers.endIndex] // Before the first number is the last number
        } else {
            return ""
        }
    }
    
    func startNumber(number: String) {
        
        numberSelected = number
        guard let index = trackNumbers.firstIndex(of: number) else { return }
        //print("startNumber: \(number) at index: \(index)")
        
        //print("trackNumbers.count: \(trackNumbers.count)")
        let epochTime = timerValue / Double(trackNumbers.count)
        //print("epochTime: \(epochTime)")
        
        var oneSecondDstance = 0.0
        var tilesPerSecond = 0.0
        while oneSecondDstance < 100.0 {
            oneSecondDstance += epochTime
            tilesPerSecond += 1.0
        }
        tilesPerSecond = tilesPerSecond / 100.0
        print("tilesPerSecond: \(tilesPerSecond)")
        if let _ = Double(String(format: "%.2f", timerValue)) {
            //print("elapsedTime: \(timerValue)")
            
            let numberTilesPerSecond = (100.0 / epochTime) / 100
            //print("numberTilesPerSecond: \(numberTilesPerSecond)")
            let numberOfBallSpins = Double(arc4random_uniform(10)+6)
            //print("numberOfBallSpins: \(numberOfBallSpins)")
            let tileDistance = oneSecondDstance * timerValue
            //print("tilesPerSecond: \(tilesPerSecond), oneSecondDstance: \(oneSecondDstance) hundredth's of seconds")
            //print("tileDistance: \(tileDistance)")
            let rouletteDistance = numberOfBallSpins * tileDistance * 0.9
            //print("with decelerationRate - rouletteDistance: \(rouletteDistance) = numberOfBallSpins(\(numberOfBallSpins)) * tileDistance(\(tileDistance)) * decelerationRate(\(0.9)")
            
            // Ball is spun from index
            let targetIndex = ((index + Int(rouletteDistance)) % trackNumbers.count)
            
            magicNumber = trackNumbers[targetIndex]
            print("magicNumber: \(magicNumber)")
        }
        hapticClick()
    }
    
    func calculateBallPath() {
        
    }
    
    func highlightNumber(highlightNumber: Int) {
        
    }
    
    func setupRouletteTable() {
        addNumber("0")
        addNumber("00")
        for (_, numberStr) in first12.enumerated() {
            addNumber(numberStr)
        }
        for (_, numberStr) in second12.enumerated() {
            addNumber(numberStr)
        }
        for (_, numberStr) in third12.enumerated() {
            addNumber(numberStr)
        }
        addNumber("1st12")
        addNumber("2nd12")
        addNumber("3rd12")
        addNumber("ODD")
        addNumber("EVEN")
        addNumber("1to18")
        addNumber("19to36")
        addNumber("RED")
        addNumber("BLACK")
        addNumber("2to1_1")
        addNumber("2to1_2")
        addNumber("2to1_3")
    }
    
    func undo() {
        if !numberHistory.isEmpty {
            numberHistory.removeLast()
        }
        numberStats.removeAll()
        let undoHistory = Array(numberHistory)
        numberHistory.removeAll()
        for number in undoHistory.enumerated() {
            self.updateCountsForNumber(number.element)
        }
    }
    
    func resetRouletteTable() {
        numberStats.removeAll()
        numberHistory.removeAll()
        magicNumber = ""
        setupRouletteTable()
    }
    
    func addNumber(_ rouletteNumber: String, count: Int = 0) {
        numberStats[rouletteNumber] = count
    }
    
    func getCountForNumber(_ rouletteNumber: String) -> Int {
        numberStats[rouletteNumber] ?? 0
    }
    
    @objc private func resetMagicNumber() async {
        // Delay of 0.7 seconds (1 second = 1_000_000_000 nanoseconds)
        try? await Task.sleep(nanoseconds: 700_000_000)
        DispatchQueue.main.async {
            self.magicNumber = ""
        }
    }
    
    func updateCountsForNumber(_ hitNumber: String) {
        
        if isStopped() {
            startNumber(number: hitNumber)
            Task {
                await resetMagicNumber()
                print("Reset Magic Number")
            }
        } else {
            numberStats[hitNumber] = 0
            numberHistory.append(hitNumber)
            
            if hitNumber != "0" {
                numberStats["0"] = getCountForNumber("0") + 1
            }
            if hitNumber != "00" {
                numberStats["00"] = getCountForNumber("00") + 1
            }
            for (_, numberStr) in first12.enumerated() {
                if hitNumber != numberStr {
                    numberStats[numberStr] = getCountForNumber(numberStr) + 1
                }
            }
            for (_, numberStr) in second12.enumerated() {
                if hitNumber != numberStr {
                    numberStats[numberStr] = getCountForNumber(numberStr) + 1
                }
            }
            for (_, numberStr) in third12.enumerated() {
                if hitNumber != numberStr {
                    numberStats[numberStr] = getCountForNumber(numberStr) + 1
                }
            }
            
            if first12.contains(hitNumber) {
                numberStats["1st12"] = 0
            } else {
                numberStats["1st12"] = getCountForNumber("1st12") + 1
            }
            
            if second12.contains(hitNumber) {
                numberStats["2nd12"] = 0
            } else {
                numberStats["2nd12"] = getCountForNumber("2nd12") + 1
            }
            
            if third12.contains(hitNumber) {
                numberStats["3rd12"] = 0
            } else {
                numberStats["3rd12"] = getCountForNumber("3rd12") + 1
            }
            
            if reds.contains(hitNumber) {
                numberStats["RED"] = 0
                numberStats["BLACK"] = getCountForNumber("BLACK") + 1
            } else if blacks.contains(hitNumber) {
                numberStats["BLACK"] = 0
                numberStats["RED"] = getCountForNumber("RED") + 1
            } else if greens.contains(hitNumber) {
                numberStats["BLACK"] = getCountForNumber("BLACK") + 1
                numberStats["RED"] = getCountForNumber("RED") + 1
            }
            
            if twoToOne_1.contains(hitNumber) {
                numberStats["2to1_1"] = 0
                numberStats["2to1_2"] = getCountForNumber("2to1_2") + 1
                numberStats["2to1_3"] = getCountForNumber("2to1_3") + 1
            } else if twoToOne_2.contains(hitNumber) {
                numberStats["2to1_2"] = 0
                numberStats["2to1_1"] = getCountForNumber("2to1_1") + 1
                numberStats["2to1_3"] = getCountForNumber("2to1_3") + 1
            } else if twoToOne_3.contains(hitNumber) {
                numberStats["2to1_3"] = 0
                numberStats["2to1_2"] = getCountForNumber("2to1_2") + 1
                numberStats["2to1_1"] = getCountForNumber("2to1_1") + 1
            } else if hitNumber == "0" || hitNumber == "00" {
                numberStats["2to1_1"] = getCountForNumber("2to1_1") + 1
                numberStats["2to1_2"] = getCountForNumber("2to1_2") + 1
                numberStats["2to1_3"] = getCountForNumber("2to1_3") + 1
            }
            
            guard let hitNumber = Int(hitNumber) else { return }
            if hitNumber % 2 == 0 {
                numberStats["EVEN"] = 0
                numberStats["ODD"] = getCountForNumber("ODD") + 1
            } else {
                numberStats["ODD"] = 0
                numberStats["EVEN"] = getCountForNumber("EVEN") + 1
            }
            
            if hitNumber >= 1 && hitNumber <= 18 {
                numberStats["1to18"] = 0
                numberStats["19to36"] = getCountForNumber("19to36") + 1
            } else if hitNumber >= 19 && hitNumber <= 36 {
                numberStats["19to36"] = 0
                numberStats["1to18"] = getCountForNumber("1to18") + 1
            } else if String(hitNumber) == "0" || String(hitNumber) == "00" {
                numberStats["19to36"] = getCountForNumber("19to36") + 1
                numberStats["1to18"] = getCountForNumber("1to18") + 1
            }
        }
    }
}
