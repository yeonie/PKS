//
//  ggDentistViewController.swift
//  ios
//
//  Created by 이동연 on 02/11/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyXMLParser

class ggDentistViewController: BaseViewController {

    @IBOutlet weak var hospitalNM: UILabel!
    
    @IBOutlet weak var hospitalST: UILabel!
    
    @IBOutlet weak var hospitalRG: UILabel!
    
    
    let ggHospitalURL = "https://openapi.gg.go.kr/DentistryHospital?"
    //    let key = "s7UQTbfE28Clt5jr0WTHSjGtUUua5oeN%2Fri30zcURa5CkkAowaMBPC9Kj95RsuCytKo3jeqNTVe8EaM5PGkKTw%3D%3D"
    func getURL(url:String, params:[String: Any]) -> URL {
        let urlParams = params.compactMap({ (key, value) -> String in
            return "\(key)=\(value)"
        }).joined(separator: "&")
        let withURL = url + "?\(urlParams)"
        let encoded = withURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
        //            + "&Key=" + key +"&Type" + +"&pIndex"++"&pSize"
        return URL(string:encoded)!
    }
    func getStationByNameList(SIGUN_CD: String, SIGUN_NM: String) {
        let url = getURL(url: ggHospitalURL, params: ["SIGUN_CD": SIGUN_CD, "SIGUN_NM": SIGUN_NM])
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
                        for element in xml["DentistryHospital"]["row"] {
                            if let BIZPLC_NM = element["BIZPLC_NM"].text,
                                let BSN_STATE_NM = element["BSN_STATE_NM"].text,
                                let REFINE_ROADNM_ADDR = element["REFINE_ROADNM_ADDR"].text
                            {
                                self.hospitalNM.text = "\(BIZPLC_NM)"
                                self.hospitalRG.text = "\(REFINE_ROADNM_ADDR)"
                                self.hospitalST.text = "\(BSN_STATE_NM)"
                                print("BIZPLC_NM = \(BIZPLC_NM), BSN_STATE_NM = \(BSN_STATE_NM),REFINE_ROADNM_ADDR = \(REFINE_ROADNM_ADDR)")
                            }
                        }
                    }
                case .failure(_):
                    print("fail")
                }
        }
    }
    
    override func viewDidLoad() {
        
//        getStationByNameList(SIGUN_CD: String, SIGUN_NM: String)
        
        
        
        getStationByNameList(SIGUN_CD: "", SIGUN_NM: "과천시")
    }

}
