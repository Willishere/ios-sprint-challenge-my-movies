//
//  MyMoviesTableViewCell.swift
//  MyMovies
//
//  Created by William Chen on 10/14/19.
//  Copyright © 2019 Lambda School. All rights reserved.
//

import UIKit

class MyMoviesTableViewCell: UITableViewCell {
  
    @IBOutlet weak var titleLabel: UILabel!

    @IBOutlet weak var hasWatchedButton: UIButton!
    
    var movieController: MovieController?
    var movie: Movie?{
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
    
    @IBAction func toggleWatched(_ sender: UIButton) {
        movie?.hasWatched = !(movie?.hasWatched ?? false)
        try? CoreDataStack.shared.mainContext.save()
        if movie?.hasWatched ?? false{
            hasWatchedButton.setTitle("Has Watched", for: .normal)
        }else {
            hasWatchedButton.setTitle("Not Watched", for: .normal)
        }
    }
    

}
