//
//  somethingViewController.swift
//  ios
//
//  Created by 이동연 on 12/10/2020.
//  Copyright © 2020 Jerry Jung. All rights reserved.
//

import UIKit

class somethingViewController: BaseViewController {
    
    var select = false

    @IBOutlet weak var selectBtn: UIButton!
    @IBOutlet weak var symptomView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        selectBtn.layer.cornerRadius = 16
        symptomView.layer.cornerRadius = 15
        symptomView.isHidden = true
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        navigationController?.navigationBar.isHidden = true
        
    }

    @IBAction func mainBtnPressed(_ sender: UIButton) {
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        window?.rootViewController = MainTabbarViewController()
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
