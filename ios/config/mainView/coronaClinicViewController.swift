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

class coronaClinicViewController: BaseViewController {
    
    
    @IBOutlet weak var hospitalNM: UILabel!
    @IBOutlet weak var medType: UILabel!
    @IBOutlet weak var medReg: UILabel!
    
    
    @IBOutlet weak var hospitalNM2: UILabel!
    @IBOutlet weak var medType2: UILabel!
    @IBOutlet weak var medReg2: UILabel!
    
    @IBOutlet weak var hospitalNM3: UILabel!
    @IBOutlet weak var medType3: UILabel!
    @IBOutlet weak var medReg3: UILabel!
    
    

    let CoronaHospitalURL = "https://openapi.gg.go.kr/EmgMedInfo?KEY=005d50ab8c3c40f3866b4ffd93756f0e&pIndex=10&pSize=3"
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
                        for element in xml["EmgMedInfo"]["row"] {
                            if let MEDCARE_INST_NM = element["MEDCARE_INST_NM"].text,
                                let DISTRCT_DIV_NM = element["DISTRCT_DIV_NM"].text,
                                let REFINE_ROADNM_ADDR = element["REFINE_ROADNM_ADDR"].text {
                                print("MEDCARE_INST_NM = \(MEDCARE_INST_NM)")
                                print("DISTRCT_DIV_NM = \(DISTRCT_DIV_NM)")
                                print("REFINE_ROADNM_ADDR = \(REFINE_ROADNM_ADDR)")
                                self.hospitalNM.text = "\(MEDCARE_INST_NM)"
                                self.medType.text = "\(DISTRCT_DIV_NM)"
                                self.medReg.text = "\(REFINE_ROADNM_ADDR)"


                            }
                            if let MEDCARE_INST_NM2 = element["MEDCARE_INST_NM"].text,
                                let DISTRCT_DIV_NM2 = element["DISTRCT_DIV_NM"].text,
                                let REFINE_ROADNM_ADDR2 = element["REFINE_ROADNM_ADDR"].text {
                                self.hospitalNM2.text = "\(MEDCARE_INST_NM2)"
                                self.medType2.text = "\(DISTRCT_DIV_NM2)"
                                self.medReg2.text = "\(REFINE_ROADNM_ADDR2)"
                            }
                        }
                    }
                    
//                case .failure:
                default:
                    return
                }
        }
        
    }
    //    let responseString = NSString(data: response.data!, encoding: String.Encoding.utf8.rawValue )
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.topItem?.title = ""
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        hospitalNM.text = MEDCARE_INST_NM.
        
        //        getHospitalData(instit_nm: "동아대학교병원")
        getHospitalData(SIGUN_NM: "여주시", SIGUN_CD: "")
        
    }


}
