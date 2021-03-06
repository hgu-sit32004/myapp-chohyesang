//
//  CurrentWeather.swift
//  Atem2
//
//  Created by 조혜상 on 2018. 5. 29..
//  Copyright © 2018년 조혜상. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class CurrentWeather {
    private var _cityName: String!
    private var _date: String!
    private var _weatherType: String!
    private var _currentTemp: Double!
    
    var cityName: String {
        if _cityName == nil {
            _cityName=""
        }
        return _cityName
    }
    var date:String {
        if _date == nil {
            _date=""
        }
        return _date
    }
    var weatherType: String{
        if _weatherType == nil{
            _weatherType = ""
        }
        return _weatherType
    }
    var currentTemp: Double {
        if _currentTemp == nil {
            _currentTemp = 0.0
        }
        return _currentTemp
    }
    
    //데이터 가져오기
    func downloadCurrentWeather(completed: @escaping DownloadComplete){
        Alamofire.request(API_WEATHER_URL).responseJSON {(response) in
            let result = response.result
            let json = JSON(result.value)
            
            self._cityName = json["name"].stringValue
            
            let tempDate = json["dt"].double
            let convertedDate = Date(timeIntervalSince1970: tempDate!)
            let dateFormatter = DateFormatter()
            dateFormatter.dateStyle = .medium
            dateFormatter.timeStyle = .none
            let currentDate = dateFormatter.string(from: convertedDate)
            self._date = currentDate
            
            self._weatherType = json["weather"][0]["main"].stringValue
            
            let downloadedTemp = json["main"]["temp"].double
            self._currentTemp = (downloadedTemp! - 273.15).rounded(toPlaces: 0)
            completed()
        }
    }
    
}




