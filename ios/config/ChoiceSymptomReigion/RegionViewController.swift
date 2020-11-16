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
    
    @IBOutlet weak var selectBtn: UIButton!
    @IBOutlet weak var symptomView: UIView!
    @IBOutlet weak var symptomBTN: UIView!
    @IBOutlet weak var symptomBTNBTM: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectBtn.layer.cornerRadius = 16
        symptomView.layer.cornerRadius = 15
        symptomView.isHidden = true
        symptomBTN.layer.cornerRadius = 15
        symptomBTNBTM.layer.cornerRadius = 15
        // Do any additional setup after loading the view.
        
//        위치 테스트
        
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
