//
//  RoundShadowView.swift
//  ios
//
//  Created by 이동연 on 12/10/2020.
//

import UIKit

class RoundShadowView: UIView {
    
    let containerView = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func layoutView() {
        
        layer.backgroundColor = UIColor.clear.cgColor
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOffset = CGSize(width: 0, height: -8)
        layer.shadowOpacity = 1
        layer.shadowRadius = 10
        containerView.layer.cornerRadius = 10
        containerView.layer.masksToBounds = true
        //        layer.shadowOffset = CGSize(width: 1, height: 2)
        
        addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        containerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        containerView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        containerView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        //        self.containerView.layer.shadowColor = UIColor.black.cgColor
        //        self.containerView.layer.shadowOffset = CGSize(width: 1, height: 2)
        //        self.containerView.layer.shadowOpacity = 1
        //        self.containerView.layer.shadowRadius = 100
    }
}

