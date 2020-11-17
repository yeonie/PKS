//
//  RegionViewController.swift
//  ios
//
//  Created by 이동연 on 16/11/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class RegionViewController: BaseViewController {

    var select = false
    
    @IBOutlet weak var wherYouAtLabel: UILabel!
    
    @IBOutlet weak var selectedReg: UILabel!
    @IBOutlet weak var selectBtn: UIButton!
    @IBOutlet weak var symptomView: UIView!
    @IBOutlet weak var symptomBTN: UIView!
    @IBOutlet weak var symptomBTNBTM: UIView!
    @IBOutlet weak var lastCornerView: UIView!
    
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
        lastCornerView.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
        
//        위치 테스트
        
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
