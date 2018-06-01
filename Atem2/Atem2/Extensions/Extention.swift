//
//  Extention.swift
//  Atem2
//
//  Created by 조혜상 on 2018. 5. 29..
//  Copyright © 2018년 조혜상. All rights reserved.
//

import Foundation

extension Double {
    // 값을 반올림하는 함수
    func rounded(toPlaces places: Int) -> Double {
        let divisor = pow(10.0, Double(places))
        return (self * divisor).rounded() / divisor
    }
}

extension Date {
    func dayOfTheWeek() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE"
        return dateFormatter.string(from: self)
    }
}
