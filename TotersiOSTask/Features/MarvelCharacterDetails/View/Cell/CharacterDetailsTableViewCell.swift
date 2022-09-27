//
//  CharacterDetailsTableViewCell.swift
//  TotersiOSTask
//
//  Created by Zeyad Elassal on 26/09/2022.
//

import UIKit

class CharacterDetailsTableViewCell: UITableViewCell {

    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var characterDetailImage: CharacterImageView!
    @IBOutlet weak var hammerArrowImage: UIImageView!
    @IBOutlet weak var characterHeaderTitleLabel: UILabel!
    @IBOutlet weak var characterDetailTitleLabel: UILabel!
    @IBOutlet weak var characterDetailDescLabel: UILabel!
    @IBOutlet weak var characterDetailExtraLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        setupLabels()
    }
    
    private func setupLabels() {
        characterHeaderTitleLabel.setupLabelWith(text: "", size: 16, weight: .bold)
        characterDetailTitleLabel.setupLabelWith(text: "", size: 16, weight: .bold)
        characterDetailDescLabel.setupLabelWith(text: "", size: 12, weight: .semibold)
        characterDetailExtraLabel.setupLabelWith(text: "", size: 14, weight: .bold)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
//        UIView.animate(withDuration: 0.25) {
//            if self.hammerArrowImage.transform == .identity {
//                self.hammerArrowImage.transform = CGAffineTransform(rotationAngle: CGFloat(Double.pi))
//            } else {
//                self.hammerArrowImage.transform = .identity
//            }
//        }
    }
    
    func setupHeaderCell(title: String) {
        characterHeaderTitleLabel.text = title
        characterHeaderTitleLabel.isHidden = false
        hammerArrowImage.isHidden = false
        containerView.isHidden = true
    }
    
    func setupCell(title: String, desc: String, thumbnail: String, extra: String) {
        characterHeaderTitleLabel.isHidden = true
        hammerArrowImage.isHidden = true
        containerView.isHidden = false
        characterDetailImage.isHidden = false
        characterDetailDescLabel.isHidden = desc.isEmpty
        characterDetailExtraLabel.isHidden = extra.isEmpty
        characterDetailTitleLabel.text = title
        characterDetailDescLabel.text = desc
        characterDetailExtraLabel.text = extra
        characterDetailImage.setImage(thumbnail: thumbnail)
    }
    
}
