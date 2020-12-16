//
//  testForS3UploadViewController.swift
//  ios
//
//  Created by 이동연 on 09/11/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import AVKit
import AVFoundation
import AWSCognito
import AWSS3
class testForS3UploadViewController: BaseViewController {
    
//    let bucketName = "pks-with-aws"
    let bucketName = "pks-translate-input"
    

    override func viewDidLoad() {
        super.viewDidLoad()

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
    
    @IBAction func uploadBtnPressed(_ sender: UIButton) {
        uploadFile(with: "ReadMe", type: "txt")
    }
    
    @IBAction func onBulkBtnPressed(_ sender: UIButton) {
    }
    
    @IBAction func onShowBtnPressed(_ sender: UIButton) {
    }
    
}
