//
//  CourseCell.swift
//  Json Parsing swift 4
//
//  Created by Nerimene  on 16/05/2018.
//  Copyright © 2018 Nerimene . All rights reserved.
//

import UIKit

class CourseCell: UITableViewCell {

    static let reuseId = "cell"
    static let cellHeight = 257.0
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblNbre: UILabel!
    @IBOutlet weak var lblLink: UILabel!
    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var containerView: UIView!
    
}
