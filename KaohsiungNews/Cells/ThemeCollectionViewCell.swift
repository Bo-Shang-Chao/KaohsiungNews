//
//  WordCollectionViewCell.swift
//  KaohsiungNews
//
//  Created by ChaoBo-Shang on 2022/10/19.
//

import UIKit

class ThemeCollectionViewCell: UICollectionViewCell {
    let titleLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.backgroundColor = .gray
        label.textColor = .white
        label.font = UIFont.systemFont(ofSize: 24)
        label.textAlignment = .center
        
        return label
      }()
         
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.initView()
    }
 
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
     
    private func initView() {
        self.contentView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0).isActive = true
    }
}

extension ThemeCollectionViewCell {
    func config(with themeVM: ThemeViewModel) {
        self.titleLabel.text = themeVM.title
        
    }
}
