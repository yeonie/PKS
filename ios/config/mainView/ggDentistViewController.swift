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
import AVKit
import AVFoundation
import AWSCognito
import AWSS3

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
                            if let 병원이름 = element["BIZPLC_NM"].text,
                                let 상태 = element["BSN_STATE_NM"].text,
                                let 주소 = element["REFINE_ROADNM_ADDR"].text
                            {
                                self.hospitalNM.text = "\(병원이름)"
                                self.hospitalRG.text = "\(상태)"
                                self.hospitalST.text = "\(주소)"
                                print("BIZPLC_NM = \(병원이름), BSN_STATE_NM = \(상태),REFINE_ROADNM_ADDR = \(주소)")
                            }
                        }
                    }
                case .failure(_):
                    print("fail")
                }
        }
    }
    
    
//    ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ s3 Upload ㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇㅇ
    
    let bucketName = "pks-cooperative-input"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        getStationByNameList(SIGUN_CD: "", SIGUN_NM: "과천시")
        
        // Amazon Cognito 인증 공급자를 초기화합니다
        
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType:.APNortheast2, identityPoolId:"ap-northeast-2:b3173e00-d7d4-492a-9881-21501356b5ad")
        
        let configuration = AWSServiceConfiguration(region:.APNortheast2, credentialsProvider:credentialsProvider)
        
        AWSServiceManager.default().defaultServiceConfiguration = configuration
    }
    
    func uploadFile(with resource: String, type: String){
        let key = "\(resource).\(type)"
        let localPath = Bundle.main.path(forResource: resource, ofType: type)!
        let localUrl = URL(fileURLWithPath: localPath)
        
        let request = AWSS3TransferManagerUploadRequest()!
        request.bucket = bucketName
        request.key = key
        request.body = localUrl
        request.acl = .publicReadWrite
        
        let transferManager = AWSS3TransferManager.default()
        transferManager.upload(request).continueWith(executor: AWSExecutor.mainThread()){
            (task) -> Any?
            in
            if let error = task.error{
                print(error)
            }
            if task.result != nil{
                print("Uploaded \(key)")
            }
            return nil
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    
    @IBAction func inEnglishBtn(_ sender: UIButton) {
        let str = "Super long string here"
        let filename = getDocumentsDirectory().appendingPathComponent("ReadMe.txt")
//        /Users/li_tong/Desktop/PKSgit/ios/tapbar/ReadMe.txt
        
        do {
            try str.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
            uploadFile(with: "dentistData", type: "txt")
            print("revision completed")
            
        } catch {
            // failed to write file – bad permissions, bad filename, missing permissions, or more likely it can't be converted to the encoding
        }
    }
    
    


}
