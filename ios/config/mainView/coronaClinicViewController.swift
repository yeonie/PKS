//
//  coronaClinicViewController.swift
//  ios
//
//  Created by 이동연 on 16/11/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyXMLParser

class coronaClinicViewController: UIViewController {

    let CoronaHospitalURL = "https://openapi.gg.go.kr/EmgMedInfo"
    let serviceKey = "005d50ab8c3c40f3866b4ffd93756f0e"
    let pIndex = "10"
    let pSize = "100"
    let type = "json"
    
    
    func getURL(url:String, params:[String: Any]) -> URL {
        let urlParams = params.compactMap({ (serviceKey, value) -> String in
            return "\(serviceKey)=\(value)"
        }).joined(separator: "&")
        let withURL = url + "?\(urlParams)"
                let encoded = withURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
                    + "&Key=" + serviceKey + "&Type" + type + "&pIndex=" + pIndex + "&pSize=" + pSize
//        let encoded = withURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        
        return URL(string:encoded)!
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
                        let responseString = NSString(data: response.data!, encoding:
                            String.Encoding.utf8.rawValue )
                        let xml = try! XML.parse(String(responseString!))
                        for element in xml["row"] {
                            if let MEDCARE_INST_NM = element["MEDCARE_INST_NM"].text,
                                let DISTRCT_DIV_NM = element["DISTRCT_DIV_NM"].text,
                                let REFINE_ROADNM_ADDR = element["REFINE_ROADNM_ADDR"].text {
                                print("MEDCARE_INST_NM = \(MEDCARE_INST_NM)")
                                print("DISTRCT_DIV_NM = \(DISTRCT_DIV_NM)")
                                print("REFINE_ROADNM_ADDR = \(REFINE_ROADNM_ADDR)")
                            }
                        }
                    }
                default:
                    return
                }
        }
        
    }
    //    let responseString = NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue )
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        getHospitalData(instit_nm: "동아대학교병원")
        getHospitalData(SIGUN_NM: "양평군", SIGUN_CD: "41830")
        
    }

}
