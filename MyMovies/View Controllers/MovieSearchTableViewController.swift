//
//  MovieSearchTableViewController.swift
//  MyMovies
//
//  Created by Spencer Curtis on 8/17/18.
//  Copyright © 2018 Lambda School. All rights reserved.
//

import UIKit

class MovieSearchTableViewController: UITableViewController, UISearchBarDelegate {
    @IBOutlet weak var titleLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        guard let searchTerm = searchBar.text else { return }
        
        movieController?.searchForMovie(with: searchTerm) { (error) in
            
            guard error == nil else { return }
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movieController?.searchedMovies.count ?? 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        
        cell.textLabel?.text = movieController?.searchedMovies[indexPath.row].title
        return cell
    }
    
    
    

    
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBAction func saveButton(_ sender: UIBarButtonItem) {
        guard let title = titleLabel.text else {return}
        
        if let movie = movie {
            movieController?.update(movie: movie, title: title)
        } else {
            movieController?.createMovie(with: movie?.title ?? "Movie", hasWatched: false)
        }
        self.navigationController?.popViewController(animated: true)
    }
    
    private func updateViews() {
        guard let movie = movie,
            isViewLoaded else {
                title = "Create Movie"
                return
        }
        
        title = movie.title
    }
    
   
    
    var movie: Movie? {
        didSet{
            updateViews()
        }
    }
    
    
    
    var movieController: MovieController?
}

