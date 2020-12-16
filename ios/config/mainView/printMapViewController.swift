//
//  printMapViewController.swift
//  ios
//
//  Created by 이동연 on 12/10/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyXMLParser

class printMapViewController: BaseViewController {
    
    let SeoulStationURL = "http://ws.bus.go.kr/api/rest/stationinfo/getStationByName"
    let key = "s7UQTbfE28Clt5jr0WTHSjGtUUua5oeN%2Fri30zcURa5CkkAowaMBPC9Kj95RsuCytKo3jeqNTVe8EaM5PGkKTw%3D%3D"
    func getURL(url:String, params:[String: Any]) -> URL {
        let urlParams = params.compactMap({ (key, value) -> String in
            return "\(key)=\(value)"
        }).joined(separator: "&")
        let withURL = url + "?\(urlParams)"
        let encoded = withURL.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)! + "&serviceKey=" + key
        return URL(string:encoded)!
    }
    func getStationByNameList(stSrch: String) {
        let url = getURL(url: SeoulStationURL, params: ["stSrch": stSrch])
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
                        for element in xml["ServiceResult"]["msgBody"]["itemList"] {
                            if let stNm = element["stNm"].text, let stId = element["stId"].text, let arsId =
                                element["arsId"].text {
                                print("stNm = \(stNm), stId = \(stId), arsId = \(arsId)")
                            }
                        }
                    }
                case .failure(_):
                    print("fail")
                }
        }
    }

    override func viewDidLoad() {
        getStationByNameList(stSrch: "가곡초교")
    }


    

}
