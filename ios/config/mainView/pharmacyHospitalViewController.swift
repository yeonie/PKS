//
//  pharmacyHospitalViewController.swift
//  ios
//
//  Created by 이동연 on 27/10/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyXMLParser

//처음엔 요청 메세지 형식을 잘못 입력
//response 메세지의 형식을 잘못 입력 (api별 형식)
//response 메세지의 타입을 잘못 입력 xml -> json

class pharmacyHospitalViewController: UIViewController {
    
    let HospitalUrl = "http://apis.data.go.kr/6260000/MedicInstitService/MedicalInstitInfo"
    let serviceKey = "s7UQTbfE28Clt5jr0WTHSjGtUUua5oeN%2Fri30zcURa5CkkAowaMBPC9Kj95RsuCytKo3jeqNTVe8EaM5PGkKTw%3D%3D"
    let numOfRows = "10"
    let PageNo = "1"
    let resultType = "json"
    
    
    func getURL(url:String, params:[String: Any]) -> URL {
        let urlParams = params.compactMap({ (serviceKey, value) -> String in
            return "\(serviceKey)=\(value)"
        }).joined(separator: "&")
        let withURL = url + "?\(urlParams)"
        let encoded = withURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!
            + "&serviceKey=" + serviceKey + "&numOfRows=" + numOfRows + "&PageNo=" + PageNo + "&resultType=" + resultType
        return URL(string:encoded)!
    }
    
    func getHospitalData(instit_nm: String) {
        let url = getURL(url: HospitalUrl, params: ["instit_nm": instit_nm])
        Alamofire.request(url, method: .get).validate()
            .responseString { response in
                print(" - API url: \(String(describing: response.request!))")
                
                //if case success
                switch response.result {
                case .success:
                    if response.result.value != nil {
                        let responseString = NSString(data: response.data!, encoding:
                            String.Encoding.utf8.rawValue )
//                        let JSON = try! JSONDecoder.parse(String(responseString!))
                        let xml = try! XML.parse(String(responseString!))
                        for element in xml["response"]["body"]["items"]["item"] {
                            if  let instit_nm = element["instit_nm"].text,
                                let instit_kind = element["instit_kind"].text,
                                let street_nm_addr = element["street_nm_addr"].text
                            {
                                print("instit_nm = \(instit_nm)")
                                print("instit_kind = \(instit_kind)")
                                print("street_nm_addr = \(street_nm_addr)")
                            }
                        }
                    }
//                case statusCode == 10:
//                    print("idiot parameter")
                default:
                    return
                }
        }
        
    }
//    let responseString = NSString(data: responds.data!, encoding: String.Encoding.utf8.rawValue )

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getHospitalData(instit_nm: "동아대학교병원")
        
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
