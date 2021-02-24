//
//  MovieViewController.swift
//  MVVMDemo
//
//  Created by Samir on 20/03/19.
//  Copyright © 2019 Samir. All rights reserved.
//

import UIKit

class MovieViewController: UIViewController {
    
    //MARK: IBOutlets
    @IBOutlet weak var mainView: UIView!
    @IBOutlet weak var tableView: UITableView!
    
    //MARK: Variables
    let viewModel = MovieViewModel()
    
    //MARK: View Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initConfig()
    }
    
    func initConfig() {
        self.navigationItem.title = "Movie"
        
        self.tableView.register(UINib(nibName: "MovieViewCell", bundle: nil), forCellReuseIdentifier: "MovieViewCell")
        prepareViewModelObserver()
        //get data
        fetchMovieList()
    }
    
    //MARK: IBActions
    @IBAction func btnFilter(_ sender: UIButton) {
        
        viewModel.movies = viewModel.movies?.sortByName()
    }
    
}

//MARK: Private Methods

extension MovieViewController {
    
    func fetchMovieList() {
        viewModel.fetchMovieList()
    }
    
    func prepareViewModelObserver() {
        self.viewModel.movieDidChanges = { (finished, error) in
            if !error {
                self.reloadTableView()
            }
        }
    }
    
    func reloadTableView() {
        self.tableView.reloadData()
    }
}

// MARK: - UITableView Delegate And Datasource Methods

extension MovieViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.movies!.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell: MovieViewCell = tableView.dequeueReusableCell(withIdentifier: "MovieViewCell", for: indexPath as IndexPath) as? MovieViewCell else {
            fatalError("AddressCell cell is not found")
        }
        
        let movie = viewModel.movies![indexPath.row]
       cell.movieItem = movie
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        tableView.estimatedRowHeight = 160
        tableView.rowHeight = UITableView.automaticDimension
        return UITableView.automaticDimension
    }
}
