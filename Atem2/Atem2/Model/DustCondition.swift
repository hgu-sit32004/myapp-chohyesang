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
    private var _valueOfDust: String!
    
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
    var valueOfDust: String{
        if _valueOfDust == nil{
            _valueOfDust = ""
        }
        return _valueOfDust
    }
    func downloadCurrentDust(completed: @escaping DownloadComplete){
        Alamofire.request(API_DUST_URL).responseJSON {(response) in
            let result = response.result
            let json = JSON(result.value)
            
            let downloadedgrade = json["list"][0]["pm25Grade1h"].stringValue
            self._grade = downloadedgrade
            //self._valueOfDust = json["List"][0]["pm25Value"].stringValue
            print(response)
            print(self._grade)
        completed()
        }
    }
    
}
