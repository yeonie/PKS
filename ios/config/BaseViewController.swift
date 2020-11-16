//
//  BaseViewController.swift
//  ios
//
//  Created by Jerry Jung on 06/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import UIKit
import SnapKit
import CoreLocation

class BaseViewController: UIViewController, CLLocationManagerDelegate {
    
    var locationManager:CLLocationManager!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        locationManager = CLLocationManager()
        locationManager.delegate = self
//        포그라운드 위치 추적 권한 요청
        locationManager.requestWhenInUseAuthorization()
//        배터리에 맞기 권장되는 최적의 정확도
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
//        위치 업데이트
        locationManager.startUpdatingLocation()
        
//        위경도 가져오기
        let coor = locationManager.location?.coordinate
        let latitude = coor?.latitude
        let longitude = coor?.longitude
        
        print(latitude)
        print(longitude)
        
        hideKeyboardWhenTappedAround()
    }
    
    // MARK: 인디케이터 표시
    func showIndicator() {
        CustomIndicatorView.shared.show()
    }
    
    // MARK: 인디케이터 숨김
    func dismissIndicator() {
        CustomIndicatorView.shared.dismiss()
    }
}
