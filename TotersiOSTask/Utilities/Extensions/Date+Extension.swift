//
//  Date+Extension.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 27/09/2022.
//

import Foundation

extension Date {
    func isBefore(date: Date)-> Bool {
        return date.timeIntervalSince(self) > 0
    }
}
