//
//  findHospitalViewController.swift
//  ios
//
//  Created by 이동연 on 12/10/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyXMLParser
import AVKit
import AVFoundation
import AWSCognito
import AWSS3


class findHospitalViewController: BaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
//        for S3
        let credentialsProvider = AWSCognitoCredentialsProvider(regionType:.APNortheast2, identityPoolId:"ap-northeast-2:7f72781f-e4ef-4d31-85f2-4caa2e9bbaf6")
        
        
        let configuration = AWSServiceConfiguration(region:.APNortheast2, credentialsProvider:credentialsProvider)
        
        AWSServiceManager.default().defaultServiceConfiguration = configuration
        
//          S3 done
        
    
        
        navigationController?.navigationBar.isHidden = true

        // Do any additional setup after loading the view.
    }
    @IBAction func regReset(_ sender: UIButton) {
        navigationController?.pushViewController(resetRegionViewController(), animated: true)
        
    }
    
    @IBAction func mapPressed(_ sender: UIButton) {
        navigationController?.pushViewController(pharmacyHospitalViewController(), animated: true)
    }
    
    @IBAction func gyungkiAPI(_ sender: UIButton) {
        navigationController?.pushViewController(gyungkiAPITestViewController(), animated: true)
    }
    
//     for S3
    
    let bucketName = "sam-translation-bucket"
    
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
    
    @IBAction func s3UpldatedTranslationBtnPressed(_ sender: UIButton) {
        
        let str = "Super long string here"
        let filename = getDocumentsDirectory().appendingPathComponent("somthin.txt")
        //        /Users/li_tong/Desktop/PKSgit/ios/tapbar/ReadMe.txt
        
        do {
            try str.write(to: filename, atomically: true, encoding: String.Encoding.utf8)
            uploadFile(with: "somthin", type: "txt")
            print("revision completed")
            
        } catch {
            
        }

        
    }
    

}
