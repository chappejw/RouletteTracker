//
//  RouletteTable.swift
//  RouletteTracker
//
//  Created by Jacob Chappelle on 2022-07-05.
//

import Foundation

class RouletteTable: ObservableObject {
    @Published var numberStats = [String: Int]()
    @Published var numberHistory = [String]()
    
    let first12 = ["3","6","9","12","2","5","8","11","1","4","7","10"]
    let second12 = ["15","18","21","24","14","17","20","23","13","16","19","22"]
    let third12 = ["27","30","33","36","26","29","32","35","25","28","31","34"]
    let twoToOne_1 = ["3","6","9","12","15","18","21","24","27","30","33","36"]
    let twoToOne_2 = ["2","5","8","11","14","17","20","23","26","29","32","35"]
    let twoToOne_3 = ["1","4","7","10","13","16","19","22","25","28","31","34"]
        
    let blacks: Set = ["1", "3", "5", "7", "9", "11", "13", "15", "17", "19", "21", "23", "25", "27", "29", "31", "33", "35"]
    let reds: Set = ["2", "4", "6", "8", "10", "12", "14", "16", "18", "20", "22", "24", "26", "28", "30", "32", "34", "36"]
    let greens: Set = ["0", "00"]
    
    init(reset: Bool) {
        if reset {
            setupRouletteTable()
        }
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
        numberHistory.removeLast()
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
        setupRouletteTable()
    }
    
    func addNumber(_ rouletteNumber: String, count: Int = 0) {
        numberStats[rouletteNumber] = count
    }
    
    func getCountForNumber(_ rouletteNumber: String) -> Int {
        if let n = numberStats[rouletteNumber] {
            return n
        }
        return 0
    }
    
    func updateCountsForNumber(_ hitNumber: String) {
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
