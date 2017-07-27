//
//  TextEntryVC.swift
//  Cells
//
//  Created by siavash abbasalipour on 27/7/17.
//  Copyright © 2017 Siavash. All rights reserved.
//

import Foundation
import SnapKit


class TextEntryVC: UIViewController {
    
    let csEntry = CustomTextViewEntry()
    let titleLabel = UILabel()
    let entryField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        view.addSubview(csEntry)
        csEntry.snp.makeConstraints { (make) in
            make.left.equalTo(view)
            make.right.equalTo(view)
            make.top.equalTo(40)
            make.height.equalTo(90)
        }
        csEntry.layout(titleLabel: titleLabel, titleText: "First Name*", entryTextField: entryField, entryText: "Roy")
    }
}

class BaseEditViewController: UIViewController {
    
    let scrollView: UIScrollView = UIScrollView()
    let contentView: UIView = UIView()
    let saveButton = UIButton()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cleanup()
        scrollView.tag = 123
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        scrollView.showsVerticalScrollIndicator = false
        
        contentView.tag = 456
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(scrollView).priority(250)
        }
        // add save button
        saveButton.setAttributedTitle(NSAttributedString.init(string: "Save", attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: UIColor.white]), for: .normal)
        saveButton.backgroundColor = UIColor.red
        saveButton.layer.cornerRadius = 8
        contentView.addSubview(saveButton)
        saveButton.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(55)
            make.bottom.equalTo(-20)
        }
        
        // add name label 
        
        // add subtitle label 
        
        
    }
    func cleanup() {
        for aView in view.subviews {
            if aView.tag == 123 {
                aView.removeFromSuperview()
            }
            if aView.tag == 456 {
                aView.removeFromSuperview()
            }
        }
    }
}
