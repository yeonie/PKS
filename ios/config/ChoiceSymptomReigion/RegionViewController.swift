//
//  RegionViewController.swift
//  ios
//
//  Created by 이동연 on 16/11/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit
import CoreLocation

class RegionViewController: BaseViewController, CLLocationManagerDelegate {
    
    var locationManager:CLLocationManager!

    var select = false
    
    @IBOutlet weak var wherYouAtLabel: UILabel!
    
    @IBOutlet weak var selectedReg: UILabel!
    @IBOutlet weak var selectBtn: UIButton!
    @IBOutlet weak var symptomView: UIView!
    @IBOutlet weak var symptomBTN: UIView!
    @IBOutlet weak var symptomBTNBTM: UIView!
    @IBOutlet weak var lastCornerView: UIView!
    @IBOutlet weak var stv1: UIView!
    @IBOutlet weak var stv2: UIView!
    @IBOutlet weak var stv3: UIView!
    @IBOutlet weak var stv4: UIView!
    @IBOutlet weak var stv5: UIView!
    @IBOutlet weak var stv6: UIView!
    @IBOutlet weak var stv7: UIView!
    @IBOutlet weak var stv8: UIView!
    @IBOutlet weak var stv9: UIView!
    @IBOutlet weak var stv10: UIView!
    @IBOutlet weak var stv11: UIView!
    @IBOutlet weak var stv12: UIView!
    @IBOutlet weak var stv13: UIView!
    @IBOutlet weak var stv14: UIView!
    @IBOutlet weak var stv15: UIView!
    @IBOutlet weak var stv16: UIView!
    @IBOutlet weak var stv17: UIView!
    @IBOutlet weak var stv18: UIView!
    @IBOutlet weak var stv19: UIView!
    @IBOutlet weak var stv20: UIView!
    @IBOutlet weak var stv21: UIView!
    @IBOutlet weak var stv22: UIView!
    @IBOutlet weak var stv23: UIView!
    @IBOutlet weak var stv24: UIView!
    @IBOutlet weak var stv25: UIView!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectedReg.text = "선택해주세요"
        
        wherYouAtLabel.alpha = 0
        UIView.animate(withDuration: 1.0, animations: ({
            self.wherYouAtLabel.alpha  = 1;
        }))
        selectBtn.layer.cornerRadius = 16
        symptomView.layer.cornerRadius = 15
        symptomView.isHidden = true
        symptomBTN.layer.cornerRadius = 15
        symptomBTNBTM.layer.cornerRadius = 15
        stv1.layer.cornerRadius = 15
        stv2.layer.cornerRadius = 15
        stv3.layer.cornerRadius = 15
        stv4.layer.cornerRadius = 15
        stv5.layer.cornerRadius = 15
        stv6.layer.cornerRadius = 15
        stv7.layer.cornerRadius = 15
        stv8.layer.cornerRadius = 15
        stv9.layer.cornerRadius = 15
        stv10.layer.cornerRadius = 15
        stv11.layer.cornerRadius = 15
        stv12.layer.cornerRadius = 15
        stv13.layer.cornerRadius = 15
        stv14.layer.cornerRadius = 15
        stv15.layer.cornerRadius = 15
        stv16.layer.cornerRadius = 15
        stv17.layer.cornerRadius = 15
        stv18.layer.cornerRadius = 15
        stv19.layer.cornerRadius = 15
        stv20.layer.cornerRadius = 15
        stv21.layer.cornerRadius = 15
        stv22.layer.cornerRadius = 15
        stv23.layer.cornerRadius = 15
        stv24.layer.cornerRadius = 15
        stv25.layer.cornerRadius = 15
        lastCornerView.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
        
//        위치 테스트
        locationManager = CLLocationManager()
        locationManager.delegate = self
        //        포그라운드 위치 추적 권한 요청
        locationManager.requestWhenInUseAuthorization()
        //        배터리에 맞기 권장되는 최적의 정확도
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        //        위치 업데이트
        locationManager.startUpdatingLocation()

        //        위경도 가져오기
        let coor = locationManager.location?.coordinate
        let latitude = coor?.latitude
        let longitude = coor?.longitude

        
    }
    
    @IBAction func suwonSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "수원"
    }
    @IBAction func yongInSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "용인"
    }
    @IBAction func sungnamSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "성남"

    }
    @IBAction func bucheunSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "부천"

    }
    @IBAction func hwasungSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "화성"
    }
    @IBAction func ansanSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "안산"
    }
    @IBAction func anyangSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "안양"
    }
    @IBAction func pyungtaekSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "평택"
    }
    @IBAction func siheungSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "시흥"
    }
    @IBAction func kimpoeSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "김포"
    }
    @IBAction func kwanjuSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "광주"
    }
    @IBAction func kwangmyungSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "광명"
    }
    @IBAction func koonpoeSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "군포"
    }
    @IBAction func hanamSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "하남"
    }
    @IBAction func ohsanSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "오산"
    }
    @IBAction func icheonSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "이천"
    }
    @IBAction func anseungSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "안성"
    }
    @IBAction func euiwangSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "의왕"
    }
    @IBAction func yeujuSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "여주"
    }
    @IBAction func gwachunSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "과천"
    }
    @IBAction func koyangSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "고양"
    }
    @IBAction func namyangSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "남양"
    }
    @IBAction func pajooSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "파주"
    }
    @IBAction func euijeongbooSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "의정부"
    }
    @IBAction func yangjooSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "양주"
    }
    @IBAction func kooriSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "구리"
    }
    @IBAction func pocheonSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "포천"
    }
    @IBAction func dongdoochunSelected(_ sender: UIButton) {
        self.symptomView.isHidden = true
        selectedReg.text = "동두천"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.navigationBar.isHidden = true
        
    }
    
    @IBAction func mainBtnPressed(_ sender: UIButton) {
        navigationController?.pushViewController(somethingViewController(), animated: true)
    }
    
    @IBAction func symptomBtn(_ sender: UIButton) {
        
        if select{
            self.symptomView.isHidden = false
        }
        else{
            self.symptomView.isHidden = true
        }
        select = !select
    }

}
