//
//  ArticleTableViewCell.swift
//  KaohsiungNews
//
//  Created by ChaoBo-Shang on 2022/5/8.
//

import Foundation
import UIKit

class ArticleTableViewCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var newImageView: UIImageView!
    
    func config(with articleVM: ArticleViewModel) {
        self.titleLabel.text = articleVM.title
        self.descriptionLabel.text = articleVM.description
        articleVM.image { image in
            self.newImageView.image = image
        }
    }
}
