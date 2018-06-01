//
//  ViewController.swift
//  Atem2
//
//  Created by 조혜상 on 2018. 5. 28..
//  Copyright © 2018년 조혜상. All rights reserved.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, CLLocationManagerDelegate {
    // Outlets
    @IBOutlet var cityName: UILabel!
    @IBOutlet var weatherType: UILabel!
    @IBOutlet var weatherImg: UIImageView!
    @IBOutlet var currentTemp: UILabel!
    @IBOutlet var currentDate: UILabel!
    @IBOutlet var backgroudImg: UIImageView!
    
    @IBOutlet var dustImg: UIImageView!
    @IBOutlet var dustGrade: UILabel!
    @IBOutlet var dustValue: UILabel!
    
    // Contents
    let locationManager = CLLocationManager()

    
    // Variables
    var currentWeather: CurrentWeather!
    var currentLocation: CLLocation!
    var currentDust: DustCondition! //
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        applyEffect()
        currentWeather = CurrentWeather()
        currentDust = DustCondition()
        setupLocation()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        locationAuthChek()
    }

    func locationAuthChek(){
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse{
            currentLocation = locationManager.location
            Location.sharedInstance.latitude = currentLocation.coordinate.latitude
            Location.sharedInstance.longitude = currentLocation.coordinate.longitude // 좌표값 입력
            currentWeather.downloadCurrentWeather {
                self.updateUI()
            }
            currentDust.downloadCurrentDust{
                
            }
            

        } else {
            locationManager.requestWhenInUseAuthorization()
            locationAuthChek()
        }
    }
    
    func callDelegate() {
        locationManager.delegate = self
    }
    func setupLocation() {
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestWhenInUseAuthorization()
        locationManager.startMonitoringSignificantLocationChanges()
    }
    
    func applyEffect() {
        movingEffect(view: backgroudImg, intensity: 45)
    }
    
    func movingEffect(view: UIView, intensity: Double){
        let horizantalMotion = UIInterpolatingMotionEffect(keyPath: "conter.x", type: .tiltAlongHorizontalAxis)
        horizantalMotion.minimumRelativeValue = -intensity
        horizantalMotion.maximumRelativeValue = intensity
        
        let verticalMotion = UIInterpolatingMotionEffect(keyPath: "conter.y", type: .tiltAlongVerticalAxis)
        verticalMotion.minimumRelativeValue = -intensity
        verticalMotion.maximumRelativeValue = intensity
        
        let movement = UIMotionEffectGroup()
        movement.motionEffects = [horizantalMotion, verticalMotion]
        
        view.addMotionEffect(movement)
    }

    func updateUI() {
        cityName.text = currentWeather.cityName
        currentTemp.text = "\(Int(currentWeather.currentTemp))"
        weatherType.text = currentWeather.weatherType
        currentDate.text = currentWeather.date
        
        //dustGrade.text
    }

    func iconOfWheather() {
        switch weatherType.text {
        case "sunny":
            weatherImg.image = #imageLiteral(resourceName: "weatherIcon")//"weatherIcon" 날씨 아이콘
        default:
            weatherImg.image = #imageLiteral(resourceName: "weatherIcon")//"weatherIcon"
        }
    }
}
