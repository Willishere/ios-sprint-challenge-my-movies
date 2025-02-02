//
//  MovieTableViewCell.swift
//  MyMovies
//
//  Created by William Chen on 9/20/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MovieTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var addMovie: UIButton!
    var movieController: MovieController?
    var movie: MovieRepresentation?{
        didSet{
            updateViews()
        }
    }
    
    
    func updateViews(){
        guard let movie = movie else  {return}
            
        titleLabel.text = movie.title
        
        
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        updateViews()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
    
    @IBAction func addMoviePressed(_ sender: UIButton) {
        guard let title = movie?.title else {return}
        movieController?.createMovie(with: title, hasWatched: false)
    }
    
}
