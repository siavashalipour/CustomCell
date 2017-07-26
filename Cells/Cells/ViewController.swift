//
//  ViewController.swift
//  Cells
//
//  Created by siavash abbasalipour on 26/7/17.
//  Copyright © 2017 Siavash. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var ds: [ProfileTableDataSource] = []
    @IBOutlet weak var prTableView: UITableView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        setupDS()
        let v = UIView.init(frame: CGRect.init(x: 0, y: 0, width: view.frame.width, height: 80))
        v.backgroundColor = UIColor.white
        prTableView.tableFooterView = v
        prTableView.delegate = self
        prTableView.dataSource = self
    }
    func setupDS() {
        let emojiData = EmojiCell.init(emojiImage: UIImage())
        var a = ProfileTableDataSource.init(data: emojiData, type: .emoji)
        ds.append(a)
        
        let detailSection = ProfileSectionData.init(staticLabel: "Your details")
        a = ProfileTableDataSource.init(data: detailSection, type: .section)
        ds.append(a)
        
        let nameCell = ProfileDetailData.init(staticLabel: "Name", dynamicLabel: "Roy Casey")
        a = ProfileTableDataSource.init(data: nameCell, type: .twoLabel)
        ds.append(a)
        
        let phoneCell = ProfileDetailData.init(staticLabel: "Phone number", dynamicLabel: "+4673-776 63 72")
        a = ProfileTableDataSource.init(data: phoneCell, type: .twoLabel)
        ds.append(a)
        
        let emailCell = ProfileDetailData.init(staticLabel: "Email", dynamicLabel: "roy.casey@gmail.com")
        a = ProfileTableDataSource.init(data: emailCell, type: .twoLabel)
        ds.append(a)
        
        let orderSection = ProfileSectionData.init(staticLabel: "Orders & Payments")
        a = ProfileTableDataSource.init(data: orderSection, type: .section)
        ds.append(a)
        
        let orderHistory = ProfileDetailData.init(staticLabel: "Order history", dynamicLabel: nil)
        a = ProfileTableDataSource.init(data: orderHistory, type: .oneLabel)
        ds.append(a)
        
        let paymentMethods = ProfileDetailData.init(staticLabel: "Patment methods", dynamicLabel: nil)
        a = ProfileTableDataSource.init(data: paymentMethods, type: .oneLabel)
        ds.append(a)
        
        let nombleBusiness = ProfileDetailData.init(staticLabel: "Nomble Business", dynamicLabel: nil)
        a = ProfileTableDataSource.init(data: nombleBusiness, type: .oneLabel)
        ds.append(a)
        
        let settingSection = ProfileSectionData.init(staticLabel: "Settings")
        a = ProfileTableDataSource.init(data: settingSection, type: .section)
        ds.append(a)
        
        let notifications = ProfileDetailData.init(staticLabel: "Notifications", dynamicLabel: nil)
        a = ProfileTableDataSource.init(data: notifications, type: .oneLabel)
        ds.append(a)
        
        let helpSection = ProfileSectionData.init(staticLabel: "Help")
        a = ProfileTableDataSource.init(data: helpSection, type: .section)
        ds.append(a)
        
        let helpCenter = ProfileDetailData.init(staticLabel: "Help Centre", dynamicLabel: nil)
        a = ProfileTableDataSource.init(data: helpCenter, type: .oneLabel)
        ds.append(a)
        
        let leaveFeedback = ProfileDetailData.init(staticLabel: "Leave feedback", dynamicLabel: nil)
        a = ProfileTableDataSource.init(data: leaveFeedback, type: .oneLabel)
        ds.append(a)
        
        let aboutSection = ProfileSectionData.init(staticLabel: "About")
        a = ProfileTableDataSource.init(data: aboutSection, type: .section)
        ds.append(a)
        
        let termsOfUse = ProfileDetailData.init(staticLabel: "Terms of use", dynamicLabel: nil)
        a = ProfileTableDataSource.init(data: termsOfUse, type: .oneLabel)
        ds.append(a)
        
        let privacyPolicy = ProfileDetailData.init(staticLabel: "Privacy policy", dynamicLabel: nil)
        a = ProfileTableDataSource.init(data: privacyPolicy, type: .oneLabel)
        ds.append(a)
        
        let openSourceLibrary = ProfileDetailData.init(staticLabel: "Open source library", dynamicLabel: nil)
        a = ProfileTableDataSource.init(data: openSourceLibrary, type: .oneLabel)
        ds.append(a)
        
        let logout = ProfileDetailData.init(staticLabel: "Log out", dynamicLabel: nil)
        a = ProfileTableDataSource.init(data: logout, type: .logout)
        ds.append(a)

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
        
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ds.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = ds[indexPath.row]
        switch item.type {
        case .emoji:
            let cell: ProfileTopEmojiContainerCell
            if let aCell = tableView.dequeueReusableCell(withIdentifier: "ProfileTopEmojiContainerCell") as? ProfileTopEmojiContainerCell {
                cell = aCell
            } else {
                cell = ProfileTopEmojiContainerCell()
            }
            cell.config(with: item.data as! EmojiCell)
            return cell
        case .section:
            let cell: ProfileSectionLikeCell
            if let aCell = tableView.dequeueReusableCell(withIdentifier: "ProfileSectionLikeCell") as? ProfileSectionLikeCell {
                cell = aCell
            } else {
                cell = ProfileSectionLikeCell()
            }
            cell.config(with: item.data as! ProfileSectionData)
            return cell
        case .twoLabel, .oneLabel:
            let cell: ProfileCell
            if let aCell = tableView.dequeueReusableCell(withIdentifier: "ProfileCell") as? ProfileCell {
                cell = aCell
            } else {
                cell = ProfileCell()
            }
            cell.config(with: item.data as! ProfileDetailData)
            return cell
        case .logout:
            let cell: ProfileLogoutCell
            if let aCell = tableView.dequeueReusableCell(withIdentifier: "ProfileLogoutCell") as? ProfileLogoutCell {
                cell = aCell
            } else {
                cell = ProfileLogoutCell()
            }
            cell.config(with: item.data as! ProfileDetailData)
            cell.selectionStyle = .none
            return cell
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let item = ds[indexPath.row]
        switch item.type {
        case .emoji:
            return 140
        case .section:
            return 75
        case .oneLabel, .twoLabel:
            return 55
        case .logout:
            return 140
        }
    }
}
class ProfileTopEmojiContainerCell: UITableViewCell {
    
    @IBOutlet weak var emojiHolder: UIImageView!
    @IBOutlet weak var emoji: UIImageView!
    
    func config(with data: EmojiCell) {
        emoji.image = data.emojiImage
    }
}

class ProfileSectionLikeCell: UITableViewCell {
    
    @IBOutlet weak var separator: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    
    func config(with data: ProfileSectionData) {
        titleLabel.text = data.staticLabel
    }
}

class ProfileCell: UITableViewCell {
    
    @IBOutlet weak var staticLabel: UILabel!
    @IBOutlet weak var dynamicLabel: UILabel!
    
    func config(with data: ProfileDetailData) {
        if let dynamicText = data.dynamicLabel {
            dynamicLabel.text = dynamicText
        } else {
            dynamicLabel.text = ""
        }
        staticLabel.text = data.staticLabel
    }
}

class ProfileLogoutCell: UITableViewCell {
    
    @IBOutlet var separators: [UIView]!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var actionableContainer: UIView!
    
    func config(with data: ProfileDetailData) {
        titleLabel.text = data.staticLabel
    }
}

enum ProfileCellType {
    case emoji
    case section
    case twoLabel
    case oneLabel
    case logout
}
struct ProfileTableDataSource {
    let data: ProfileCellDate
    let type: ProfileCellType
}
protocol ProfileCellDate {
    
}
struct ProfileDetailData: ProfileCellDate {
    let staticLabel: String
    var dynamicLabel: String?
}
struct ProfileSectionData: ProfileCellDate {
    let staticLabel: String
}
struct EmojiCell: ProfileCellDate {
    let emojiImage: UIImage
}
