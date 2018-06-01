//
//  Extras.swift
//  Atem2
//
//  Created by 조혜상 on 2018. 5. 29..
//  Copyright © 2018년 조혜상. All rights reserved.
//

import Foundation

let API_WEATHER_URL = "http://api.openweathermap.org/data/2.5/weather?lat=\(Location.sharedInstance.latitude!)&lon=\(Location.sharedInstance.longitude!)&appid=3a17069d032be65dc17e56430dfb8c0b"


let API_DUST_URL = "http://openapi.airkorea.or.kr/openapi/services/rest/ArpltnInforInqireSvc/getMsrstnAcctoRltmMesureDnsty?stationName=%EC%A2%85%EB%A1%9C%EA%B5%AC&dataTerm=month&pageNo=1&numOfRows=10&ServiceKey=bR9qA3WdiN5jlS8bUlP8R0kOYOu8yqOhPu6Bh78M3ExrfthGj0jHfUzr2NwPPSkkgoz30Aw%2B%2FapcC98W8fc6fg%3D%3D&ver=1.3&_returnType=json"


let ARI_DUST_CENTER_URL = "http://openapi.airkorea.or.kr/openapi/services/rest/MsrstnInfoInqireSvc/getNearbyMsrstnList?tmX=&tmY=412423.75772&pageNo=1&numOfRows=10&ServiceKey=bR9qA3WdiN5jlS8bUlP8R0kOYOu8yqOhPu6Bh78M3ExrfthGj0jHfUzr2NwPPSkkgoz30Aw%2B%2FapcC98W8fc6fg%3D%3D"

typealias DownloadComplete = () -> ()
