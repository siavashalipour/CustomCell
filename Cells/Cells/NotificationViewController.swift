//
//  NotificationViewController.swift
//  Cells
//
//  Created by siavash abbasalipour on 27/7/17.
//  Copyright © 2017 Siavash. All rights reserved.
//

import Foundation
import SnapKit

class NotificationViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var notificationBtn: UIButton!
    @IBOutlet weak var footerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }
    func setupUI() {
        titleLabel.numberOfLines = 0
        titleLabel.attributedText = NSAttributedString.init(string: "Accept        push notifications", attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 20),NSForegroundColorAttributeName: UIColor.black])
        titleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
        subtitleLabel.attributedText = NSAttributedString.init(string: "Get notified about your      , updates to your      and when it's time to place an      ", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 16),NSForegroundColorAttributeName: UIColor.lightGray])
        subtitleLabel.textAlignment = .center
        
        footerLabel.numberOfLines = 0
        footerLabel.attributedText = NSAttributedString.init(string: "Get notified about your      , updates to your      and when it's time to place an      ", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 12),NSForegroundColorAttributeName: UIColor.lightGray])
        footerLabel.textAlignment = .center
        
        notificationBtn.setAttributedTitle(NSAttributedString.init(string: "Enable push notificataions", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: UIColor.white]), for: .normal)
        notificationBtn.layer.cornerRadius = 8
        notificationBtn.backgroundColor = UIColor.red
    }
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(40)
            make.right.equalTo(-40)
            make.top.equalTo(80)
        }
        
        subtitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        
        footerLabel.snp.makeConstraints { (make) in
            make.left.equalTo(40)
            make.right.equalTo(-40)
            make.bottom.equalTo(view).offset(-20)
        }
        
        notificationBtn.snp.makeConstraints { (make) in
            make.height.equalTo(55)
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.bottom.equalTo(-70)
        }
    }
}
