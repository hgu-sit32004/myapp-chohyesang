//: Playground - noun: a place where people can play

import UIKit
//
//  DustCondition.swift
//  Atem2
//
//  Created by 조혜상 on 2018. 5. 31..
//  Copyright © 2018년 조혜상. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class DustCondition {
    private var _cityName: String!
    private var _grade: String!
    private var _valueOfDust: Int!
    
    var cityName: String {
        if _cityName == nil {
            _cityName=""
        }
        return _cityName
    }
    var gradeOfDust:String {
        if _grade == nil {
            _grade=""
        }
        return _grade
    }
    var valueOfDust: Int{
        if _valueOfDust == nil{
            _valueOfDust = 0
        }
        return _valueOfDust
    }
    func downloadCurrentDust(completed: @escaping DownloadComplete){
        self._cityName = "a"
        self._valueOfDust = 2
        self._grade = "1"
        /*
         Alamofire.request(API_DUST_URL).responseJSON {(response) in
         let result = response.result
         let json = JSON(result.value)
         self._cityName = "a"
         self._valueOfDust = 1.02
         self._grade = "1"
         self._grade = json[0]["khaiGrade"].stringValue */
        completed()
        
    }
}
