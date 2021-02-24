//
//  MovieViewCell.swift
//  MVVMDemo
//
//  Created by Samir on 27/03/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import UIKit

class MovieViewCell: UITableViewCell {

    @IBOutlet weak var picture: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var overviewLabel: UILabel!
    
    
    var movieItem: Movie? {
        
        didSet {
            
            if let movie = movieItem {
                
                self.titleLabel.text = movie.title ?? ""
                
                self.overviewLabel.text = movie.overview ?? ""
                
                self.picture.setImage(withImageId: movie.poster_path ?? "", placeholderImage: #imageLiteral(resourceName: "placeholder"), size: .original)
                
                self.picture.contentMode = .scaleToFill
            }
        }
    }
    
    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
