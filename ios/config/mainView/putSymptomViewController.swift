//
//  putSymptomViewController.swift
//  ios
//
//  Created by 이동연 on 12/10/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyXMLParser
import CoreLocation

class putSymptomViewController: BaseViewController {
    
    
    @IBOutlet weak var hospitalNM: UILabel!
    @IBOutlet weak var medType: UILabel!
    @IBOutlet weak var medReg: UILabel!
    
    @IBOutlet weak var hospitalNM2: UILabel!
    @IBOutlet weak var medType2: UILabel!
    @IBOutlet weak var medReg2: UILabel!
    
    @IBOutlet weak var hospitalNM3: UILabel!
    @IBOutlet weak var medType3: UILabel!
    @IBOutlet weak var medReg3: UILabel!
    
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        getHospitalData(SIGUN_CD: "41110", SIGUN_NM: "수원시")
        navigationController?.navigationBar.isHidden = true
        // Do any additional setup after loading the view.
    }
    let CoronaHospitalURL = "https://openapi.gg.go.kr/DentistryPrivateHospital?KEY=bc165a0db68d4295bc4ecb2736c0ca66&pIndex=1&pSize=3"
    let serviceKey = "bc165a0db68d4295bc4ecb2736c0ca66"
    let pIndex = "10"
    let pSize = "1"
    let type = "json"
    let REFINE_WGS84_LAT = "37.4939143412"
    let REFINE_WGS84_LOGT = "127.4864820853"
    
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
    
    func getHospitalData(SIGUN_CD: String, SIGUN_NM: String) {
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
                        
                        
                        
                        for element in xml["DentistryPrivateHospital"]["row"][0] {
                            if let BIZPLC_NM = element["BIZPLC_NM"].text,
                                let BSN_STATE_NM = element["BSN_STATE_NM"].text,
                                let REFINE_ROADNM_ADDR = element["REFINE_ROADNM_ADDR"].text,
                                let REFINE_WGS84_LAT = element["REFINE_WGS84_LAT"].text,
                                let REFINE_WGS84_LOGT = element["REFINE_WGS84_LOGT"].text{
                                print("BIZPLC_NM = \(BIZPLC_NM)")
                                print("BSN_STATE_NM = \(BSN_STATE_NM)")
                                print("REFINE_ROADNM_ADDR = \(REFINE_ROADNM_ADDR)")
                                print("REFINE_WGS84_LAT = \(REFINE_WGS84_LAT)")
                                print("REFINE_WGS84_LOGT = \(REFINE_WGS84_LOGT)")
                                
                                
                                
                                self.hospitalNM.text = "\(BIZPLC_NM)"
                                self.medType.text = "\(BSN_STATE_NM)"
                                self.medReg.text = "\(REFINE_ROADNM_ADDR)"
                                
                            }
                        }
                        for element in xml["DentistryPrivateHospital"]["row"][1] {
                            if let BIZPLC_NM = element["BIZPLC_NM"].text,
                                let BSN_STATE_NM = element["BSN_STATE_NM"].text,
                                let REFINE_ROADNM_ADDR = element["REFINE_ROADNM_ADDR"].text,
                                let REFINE_WGS84_LAT = element["REFINE_WGS84_LAT"].text,
                                let REFINE_WGS84_LOGT = element["REFINE_WGS84_LOGT"].text{
//                                self.temp_lat2 = "\(REFINE_WGS84_LAT)"
//                                self.temp_long2 = "\(REFINE_WGS84_LOGT)"
                                print("BIZPLC_NM = \(BIZPLC_NM)")
                                print("BSN_STATE_NM = \(BSN_STATE_NM)")
                                print("REFINE_ROADNM_ADDR = \(REFINE_ROADNM_ADDR)")
                                print("REFINE_WGS84_LAT = \(REFINE_WGS84_LAT)")
                                print("REFINE_WGS84_LOGT = \(REFINE_WGS84_LOGT)")
                                
                                
                                
                                self.hospitalNM2.text = "\(BIZPLC_NM)"
                                self.medType2.text = "\(BSN_STATE_NM)"
                                self.medReg2.text = "\(REFINE_ROADNM_ADDR)"
                                
                            }
                        }
                        for element in xml["DentistryPrivateHospital"]["row"][2] {
                            if let BIZPLC_NM = element["BIZPLC_NM"].text,
                                let BSN_STATE_NM = element["BSN_STATE_NM"].text,
                                let REFINE_ROADNM_ADDR = element["REFINE_ROADNM_ADDR"].text,
                                let REFINE_WGS84_LAT = element["REFINE_WGS84_LAT"].text,
                                let REFINE_WGS84_LOGT = element["REFINE_WGS84_LOGT"].text{
//                                self.temp_lat3 = "\(REFINE_WGS84_LAT)"
//                                self.temp_long3 = "\(REFINE_WGS84_LOGT)"
                                print("BIZPLC_NM = \(BIZPLC_NM)")
                                print("BSN_STATE_NM = \(BSN_STATE_NM)")
                                print("REFINE_ROADNM_ADDR = \(REFINE_ROADNM_ADDR)")
                                print("REFINE_WGS84_LAT = \(REFINE_WGS84_LAT)")
                                print("REFINE_WGS84_LOGT = \(REFINE_WGS84_LOGT)")
                                
                                
                                
                                self.hospitalNM3.text = "\(BIZPLC_NM)"
                                self.medType3.text = "\(BSN_STATE_NM)"
                                self.medReg3.text = "\(REFINE_ROADNM_ADDR)"
                                
                            }
                        }
                        
                        //                        distance(start_x: temp_lat1, start_y: temp_long1, end_x: latitude, end_y: longitude)
                        
                    }
                    
                //                case .failure:
                default:
                    return
                }
        }
    }




}
