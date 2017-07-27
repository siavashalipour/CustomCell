//
//  CustomTextViewEntry.swift
//  Cells
//
//  Created by siavash abbasalipour on 27/7/17.
//  Copyright © 2017 Siavash. All rights reserved.
//

import Foundation
import SnapKit


class CustomTextViewEntry: UIView {
    
    fileprivate let errorLabel = UILabel()
    fileprivate let separator = UIView()
    
    func layout(titleLabel: UILabel, titleText: String, entryTextField: UITextField, entryText: String) {
        cleanUp()
        
        titleLabel.attributedText = NSAttributedString.init(string: NSLocalizedString(titleText, comment: ""), attributes: nil)
        addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(0)
            make.height.equalTo(16)
        }
        
        entryTextField.attributedText = NSAttributedString.init(string: NSLocalizedString(entryText, comment: ""), attributes: nil)
        addSubview(entryTextField)
        entryTextField.snp.makeConstraints { (make) in
            make.height.equalTo(48)
            make.top.equalTo(titleLabel.snp.bottom)
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalTo(titleLabel.snp.right)
        }
        
        
        separator.backgroundColor = UIColor.lightGray
        addSubview(separator)
        separator.snp.makeConstraints { (make) in
            make.height.equalTo(1)
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalTo(titleLabel.snp.right)
            make.top.equalTo(entryTextField.snp.bottom)
        }
        
        errorLabel.isHidden = true
        addSubview(errorLabel)
        errorLabel.snp.makeConstraints { (make) in
            make.left.equalTo(titleLabel.snp.left)
            make.right.equalTo(titleLabel.snp.right)
            make.top.equalTo(separator.snp.bottom).offset(8)
            make.bottom.equalTo(self)
        }
    }
    func showErrorWith(title: String) {
        errorLabel.isHidden = false
        errorLabel.attributedText = NSAttributedString.init(string: title, attributes: [NSForegroundColorAttributeName: UIColor.red])
        errorLabel.textColor = .red

        separator.backgroundColor = UIColor.red
    }
    func hideError() {
        errorLabel.isHidden = true
        separator.backgroundColor = UIColor.lightGray
    }
    func cleanUp() {
        for aView in subviews {
            aView.removeFromSuperview()
        }
    }
}
