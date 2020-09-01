//
//  MovieTableViewCell.swift
//  Love Movies
//
//  Created by Lucas Reinaldo on 25/08/20.
//  Copyright © 2020 Vostore. All rights reserved.
//

import UIKit
import Firebase

class MovieTableViewCell: UITableViewCell {

    @IBOutlet var movieTitleLabel: UILabel!
    @IBOutlet var movieYearLabel: UILabel!
    
    @IBOutlet weak var moviePosterImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    static let indentifier = "MovieTableViewCell"
    
    static func nib() -> UINib {
        return UINib(nibName: "MovieTableViewCell", bundle: nil)
    }
    
    
    func configure(with model: Movie){
        self.movieTitleLabel.text = model.Title
        self.movieYearLabel.text = model.Year
        let url = model.Poster
        if let data = try? Data(contentsOf: URL(string: url)!){
             self.moviePosterImageView.image = UIImage(data: data)
            self.moviePosterImageView.layer.cornerRadius = self.moviePosterImageView.frame.height / 10
        }
       
        
    }
    
}
