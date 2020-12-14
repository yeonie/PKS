//
//  coronaClinicViewController.swift
//  ios
//
//  Created by 이동연 on 16/11/2020.
//  Copyright © 2020 litong. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyXMLParser
import CoreLocation

class coronaClinicViewController: BaseViewController, CLLocationManagerDelegate {
    
    
    var locationManager:CLLocationManager!
    
    var latitude : Double = 0.0
    var longitude : Double = 0.0
    
    var temp_lat1 : String!
    var temp_long1 : String!
    
    var temp_lat2 : String!
    var temp_long2 : String!
    
    var temp_lat3 : String!
    var temp_long3 : String!
    
//    distance(start_x: latitude!, start_y: longitude!, end_x: latitude1, end_y: longitude1)
    
    
    @IBOutlet weak var hospitalNM: UILabel!
    @IBOutlet weak var medType: UILabel!
    @IBOutlet weak var medReg: UILabel!
    
    
    @IBOutlet weak var hospitalNM2: UILabel!
    @IBOutlet weak var medType2: UILabel!
    @IBOutlet weak var medReg2: UILabel!
    
    @IBOutlet weak var hospitalNM3: UILabel!
    @IBOutlet weak var medType3: UILabel!
    @IBOutlet weak var medReg3: UILabel!
    
    

    let CoronaHospitalURL = "https://openapi.gg.go.kr/EmgMedInfo?KEY=005d50ab8c3c40f3866b4ffd93756f0e&pIndex=1&pSize=3"
    let serviceKey = "005d50ab8c3c40f3866b4ffd93756f0e"
    let pIndex = "10"
    let pSize = "1"
    let type = "json"
    let REFINE_WGS84_LAT = "37.4939143412"
    let REFINE_WGS84_LOGT = "127.4864820853"
    
    

//현재 위치와 가져온 위경도 비교해서 가장 가까운거 띄워주기

            
    func getURL(url:String, params:[String: Any]) -> URL {
        let urlParams = params.compactMap({ (serviceKey, value) -> String in
            return "\(serviceKey)=\(value)"
        }).joined(separator: "&")
        let withURL = url + "?\(urlParams)"
        let encoded = withURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
                    + "&Key=" + serviceKey + "&Type" + type + "&pIndex=" + pIndex + "&pSize=" + pSize + "&REFINE_WGS84_LAT" + REFINE_WGS84_LAT + "&REFINE_WGS84_LOGT" + REFINE_WGS84_LOGT
//        let encoded = withURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        return URL(string:encoded)!
    }
    
//    두 좌표간 거리
    func distance(start_x: Double, start_y: Double, end_x: String, end_y: String){
        
        let a = Double(start_x)
        let b = Double(end_x)
        
        let c = Double(start_y)
        let d = Double(end_y)!
        
        let distance = sqrt(pow((b!-a), 2) + pow((d-c),2))
        
        print(distance)
    }
    
//      좌표 비교 최대, 최소
    func consecutive(a: Double, b: Double, c: Double){
        var max : Double
        var min : Double
        
        max = 0
        min = 0
        
        if a>b {
            if(b>c){
                max = a
                min = c
            }
            else if(b<c){
                if(a>c){
                    max = a
                    min = b
                }
                else{
                    max = c
                    min = b
                }
            }
        }
        else {
            if(a>c){
                max = b
                min = c
            }
            else if(a<c){
                if(b>c){
                    max = b
                    min = a
                }
                else{
                    max = c
                    min = a
                }
            }
        }
        print("max = ", max)
        print("min = ", min)
    }
    
    func getHospitalData(SIGUN_NM: String, SIGUN_CD: String) {
        //        let url = getURL(url: HospitalUrl, params: ["instit_nm": instit_nm])
        let url = CoronaHospitalURL
        Alamofire.request(url, method: .get).validate()
            .responseString { response in
                print(" - API url: \(String(describing: response.request!))")
                
                //if case success
                switch response.result {
                case .success:
                    if response.result.value != nil {
                        if response.result.value == "300" {
                            print("제대로 불러온 거 맞니?")
                        }
                        let responseString = NSString(data: response.data!, encoding:
                            String.Encoding.utf8.rawValue )
                        let xml = try! XML.parse(String(responseString!))
                        
                        
                        
                        for element in xml["EmgMedInfo"]["row"][0] {
                            if let MEDCARE_INST_NM = element["MEDCARE_INST_NM"].text,
                                let DISTRCT_DIV_NM = element["DISTRCT_DIV_NM"].text,
                                let REFINE_ROADNM_ADDR = element["REFINE_ROADNM_ADDR"].text,
                                let REFINE_WGS84_LAT = element["REFINE_WGS84_LAT"].text,
                                let REFINE_WGS84_LOGT = element["REFINE_WGS84_LOGT"].text{
                                self.temp_lat1 = "\(REFINE_WGS84_LAT)"
                                self.temp_long1 = "\(REFINE_WGS84_LOGT)"
                                print("MEDCARE_INST_NM = \(MEDCARE_INST_NM)")
                                print("DISTRCT_DIV_NM = \(DISTRCT_DIV_NM)")
                                print("REFINE_ROADNM_ADDR = \(REFINE_ROADNM_ADDR)")
                                print("REFINE_WGS84_LAT = \(REFINE_WGS84_LAT)")
                                print("REFINE_WGS84_LOGT = \(REFINE_WGS84_LOGT)")

                                
                                
                                self.hospitalNM.text = "\(MEDCARE_INST_NM)"
                                self.medType.text = "\(DISTRCT_DIV_NM)"
                                self.medReg.text = "\(REFINE_ROADNM_ADDR)"
                                
                            }
                        }
                        for element in xml["EmgMedInfo"]["row"][1] {
                            if let MEDCARE_INST_NM = element["MEDCARE_INST_NM"].text,
                                let DISTRCT_DIV_NM = element["DISTRCT_DIV_NM"].text,
                                let REFINE_ROADNM_ADDR = element["REFINE_ROADNM_ADDR"].text,
                                let REFINE_WGS84_LAT = element["REFINE_WGS84_LAT"].text,
                                let REFINE_WGS84_LOGT = element["REFINE_WGS84_LOGT"].text{
                                self.temp_lat2 = "\(REFINE_WGS84_LAT)"
                                self.temp_long2 = "\(REFINE_WGS84_LOGT)"
                                print("MEDCARE_INST_NM = \(MEDCARE_INST_NM)")
                                print("DISTRCT_DIV_NM = \(DISTRCT_DIV_NM)")
                                print("REFINE_ROADNM_ADDR = \(REFINE_ROADNM_ADDR)")
                                print("REFINE_WGS84_LAT = \(REFINE_WGS84_LAT)")
                                print("REFINE_WGS84_LOGT = \(REFINE_WGS84_LOGT)")
                                
                                
                                
                                self.hospitalNM2.text = "\(MEDCARE_INST_NM)"
                                self.medType2.text = "\(DISTRCT_DIV_NM)"
                                self.medReg2.text = "\(REFINE_ROADNM_ADDR)"
                                
                            }
                        }
                        for element in xml["EmgMedInfo"]["row"][2] {
                            if let MEDCARE_INST_NM = element["MEDCARE_INST_NM"].text,
                                let DISTRCT_DIV_NM = element["DISTRCT_DIV_NM"].text,
                                let REFINE_ROADNM_ADDR = element["REFINE_ROADNM_ADDR"].text,
                                let REFINE_WGS84_LAT = element["REFINE_WGS84_LAT"].text,
                                let REFINE_WGS84_LOGT = element["REFINE_WGS84_LOGT"].text{
                                self.temp_lat3 = "\(REFINE_WGS84_LAT)"
                                self.temp_long3 = "\(REFINE_WGS84_LOGT)"
                                print("MEDCARE_INST_NM = \(MEDCARE_INST_NM)")
                                print("DISTRCT_DIV_NM = \(DISTRCT_DIV_NM)")
                                print("REFINE_ROADNM_ADDR = \(REFINE_ROADNM_ADDR)")
                                print("REFINE_WGS84_LAT = \(REFINE_WGS84_LAT)")
                                print("REFINE_WGS84_LOGT = \(REFINE_WGS84_LOGT)")
                                
                                
                                
                                self.hospitalNM3.text = "\(MEDCARE_INST_NM)"
                                self.medType3.text = "\(DISTRCT_DIV_NM)"
                                self.medReg3.text = "\(REFINE_ROADNM_ADDR)"
                                
                            }
                        }
                    }
                    
//                case .failure:
                default:
                    return
                }
        }
        
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = ""
    }
    
    
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
        print(longitude?.magnitude)


        getHospitalData(SIGUN_NM: "여주시", SIGUN_CD: "")
        getHospitalData(SIGUN_NM: "고양시", SIGUN_CD: "")
//        getHospitalData(SIGUN_NM: "여주시", SIGUN_CD: "")
        
    }
    
    


}
