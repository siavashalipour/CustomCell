//
//  TextEntryVC.swift
//  Cells
//
//  Created by siavash abbasalipour on 27/7/17.
//  Copyright © 2017 Siavash. All rights reserved.
//

import Foundation
import SnapKit


class TextEntryVC: BaseEditViewController {
    
    let csEntry1 = CustomTextViewEntry()
    let nameLabel = UILabel()
    let nameField = UITextField()
    
    let csEntry2 = CustomTextViewEntry()
    let surnameLabel = UILabel()
    let surnameField = UITextField()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        contentView.addSubview(csEntry1)
        csEntry1.snp.makeConstraints { (make) in
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
            make.top.equalTo(subtitleLabel.snp.bottom).offset(20)
            make.height.equalTo(90)
        }
        csEntry1.layout(titleLabel: nameLabel, titleText: "First Name*", entryTextField: nameField, entryText: "Roy")
        nameField.keyboardAppearance = .dark
        nameField.delegate = self
        
        contentView.addSubview(csEntry2)
        csEntry2.snp.makeConstraints { (make) in
            make.left.equalTo(contentView)
            make.right.equalTo(contentView)
            make.top.equalTo(csEntry1.snp.bottom).offset(20)
            make.height.equalTo(90)
        }
        csEntry2.layout(titleLabel: surnameLabel, titleText: "Surname", entryTextField: surnameField, entryText: "Casey")
        surnameField.keyboardAppearance = .dark
        surnameField.delegate = self
        
    }
    override func willShowKeyboard(_ notification: Notification) {
        keyboardHeight = getKeyboardHeight(for: notification)
        /// If active text field is hidden by keyboard, scroll it so it's visible
        var rect = view.frame
        rect.size.height -= keyboardHeight
        if (rect.height <= activeEntry.frame.origin.y + activeEntry.frame.size.height) {
            let scrollPoint = CGPoint(x: 0.0, y: activeEntry.frame.origin.y - keyboardHeight + 22)
            self.scrollPoint = scrollView.contentOffset
            scrollView.setContentOffset(scrollPoint, animated: true)
        }
    }
}
extension TextEntryVC: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == nameField {
            activeEntry = csEntry1
        } else {
            activeEntry = csEntry2
        }
    }
}
class BaseEditViewController: UIViewController {
    
    let scrollView: UIScrollView = UIScrollView()
    let contentView: UIView = UIView()
    let saveButton = UIButton()
    let titleLabel = UILabel()
    let subtitleLabel = UILabel()
   
   var activeEntry: CustomTextViewEntry = CustomTextViewEntry()
   var keyboardHeight: CGFloat = CGFloat(0.0)
    var scrollPoint: CGPoint = .zero
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyboardNotificationListener()
        cleanup()
        scrollView.tag = 123
        view.addSubview(scrollView)
        scrollView.snp.makeConstraints { (make) in
            make.edges.equalTo(view)
        }
        scrollView.showsVerticalScrollIndicator = false
        scrollView.isScrollEnabled = false
        contentView.tag = 456
        scrollView.addSubview(contentView)
        contentView.snp.makeConstraints { (make) in
            make.edges.equalTo(scrollView)
            make.width.equalTo(scrollView)
            make.height.equalTo(scrollView).priority(250)
        }
        // add save button
        saveButton.setAttributedTitle(NSAttributedString.init(string: NSLocalizedString("Save", comment: ""), attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 14), NSForegroundColorAttributeName: UIColor.white]), for: .normal)
        saveButton.backgroundColor = UIColor.red
        saveButton.layer.cornerRadius = 8
        contentView.addSubview(saveButton)
        saveButton.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.height.equalTo(55)
            make.bottom.equalTo(-84)
        }
        
        // add name label 
        titleLabel.textAlignment = .center
        titleLabel.attributedText = NSAttributedString.init(string: NSLocalizedString("Name", comment: ""), attributes: [NSFontAttributeName: UIFont.boldSystemFont(ofSize: 17), NSForegroundColorAttributeName: UIColor.black])
        contentView.addSubview(titleLabel)
        titleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(20)
        }
        // add subtitle label
        subtitleLabel.textAlignment = .center
        subtitleLabel.numberOfLines = 0
        subtitleLabel.attributedText = NSAttributedString.init(string: NSLocalizedString("The name you provide    at the time of          your thing that you know I am talking about ", comment: ""), attributes: [NSFontAttributeName: UIFont.systemFont(ofSize: 15), NSForegroundColorAttributeName: UIColor.gray])
        contentView.addSubview(subtitleLabel)
        subtitleLabel.snp.makeConstraints { (make) in
            make.left.equalTo(20)
            make.right.equalTo(-20)
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
        }
        contentView.addDismissKeyboardGesture()
    }


    func getKeyboardHeight(for notification: Notification) -> CGFloat {
        let keyboardInfo = (notification as NSNotification).userInfo
        let keyboardFrameBegin = keyboardInfo![UIKeyboardFrameEndUserInfoKey] as! NSValue
        let keyboardFrameBeginRect = keyboardFrameBegin.cgRectValue
        return keyboardFrameBeginRect.height
    }
    @objc fileprivate func willShowKeyboard(_ notification: Notification) {
        
    }
    @objc fileprivate func willHideKeyboard() {
        scrollView.setContentOffset(self.scrollPoint, animated: true)
    }
    // MARK:- Public methods
    
    /// adds keyboard will show listnerer to adjust the scroll height
    func addKeyboardNotificationListener() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.willShowKeyboard(_:)), name: Notification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.willHideKeyboard), name: Notification.Name.UIKeyboardWillHide, object: nil)
    }
    // Do we really need this??
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
extension UIView {
    func addDismissKeyboardGesture() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(endEditing(_:)))
        addGestureRecognizer(tap)
    }
}
