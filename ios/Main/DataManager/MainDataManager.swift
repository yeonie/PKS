//
//  MainDataManager.swift
//  ios
//
//  Created by Jerry Jung on 13/08/2019.
//  Copyright © 2019 Jerry Jung. All rights reserved.
//

import Alamofire
import AlamofireObjectMapper

@available(iOS 13.0, *)
class MainDataManager {
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    
    func getTutorials(_ mainViewController: MainViewController) {        
        Alamofire
            //.request("\(self.appDelegate.baseUrl)/tutorials", method: .get)
            .request("\(self.appDelegate.baseUrl)/ads", method: .get)
            .validate()
            .responseObject(completionHandler: { (response: DataResponse<TutorialResponse>) in
                switch response.result {
                case .success(let tutorialResponse):
                    if tutorialResponse.code == 100 {
                        mainViewController.titleLabel.text = tutorialResponse.message
                    } else {
                        mainViewController.titleLabel.text = "튜토리얼 정보를 불러오는데 실패하였습니다."
                    }
                case .failure:
                    mainViewController.titleLabel.text = "서버와의 연결이 원활하지 않습니다."
                }
            })
    }
    
    func getLogin(_ loginViewController: findHospitalViewController){
        let username = loginViewController.englishReg.text!
        Alamofire.request("https://c4n5mfj1ta.execute-api.ap-northeast-2.amazonaws.com/hospital_api/en%2Fhospital1.txt/hospital1.txt", method:
            .get,encoding: JSONEncoding.default, headers: nil)
            .validate(statusCode: 200..<600).response { response in
                loginViewController.englishReg.text = username
                
                
                    
                }
        }
}
