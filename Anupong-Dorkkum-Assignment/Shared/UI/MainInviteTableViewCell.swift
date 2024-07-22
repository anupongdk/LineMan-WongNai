//
//  MainInviteTableViewCell.swift
//  Anupong-Dorkkum-Assignment
//
//  Created by gone on 22/7/2567 BE.
//

import UIKit

class MainInviteTableViewCell: UITableViewCell {

    @IBOutlet weak var bgCard: CardView!
    @IBOutlet weak var imageHeader: UIImageView!
    @IBOutlet weak var lblDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        imageHeader.image = UIImage(named: "icPresent")
        // Full text
        let fullText = "You can earn $10 when you invite a friend to buy crypto. Invite your friend"
                
                // Create the attributed string
                let attributedString = NSMutableAttributedString(string: fullText)
                
                // Define attributes
                let blackColorAttribute: [NSAttributedString.Key: Any] = [
                    .foregroundColor: UIColor.black
                ]
                
                let blueColorAttribute: [NSAttributedString.Key: Any] = [
                    .foregroundColor: UIColor.blue
                ]
                
                // Apply black color to the full text
                attributedString.addAttributes(blackColorAttribute, range: NSRange(location: 0, length: fullText.count))
                
                // Apply blue color to "Invite your friend"
                if let range = fullText.range(of: "Invite your friend") {
                    let nsRange = NSRange(range, in: fullText)
                    attributedString.addAttributes(blueColorAttribute, range: nsRange)
                }
                
        
                // add font
        attributedString.addAttribute(NSAttributedString.Key.font, value: UIFont.DesignSystem.title ?? UIFont.systemFont(ofSize: 16), range: NSRange(location: 0, length: fullText.count))
                // Set the attributed text to the label
                lblDescription.attributedText = attributedString
                lblDescription.numberOfLines = 2
        
                self.selectionStyle = .none
        
        bgCard.backgroundColor = UIColor.DesignSystem.appInviteFriendCardBg
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
