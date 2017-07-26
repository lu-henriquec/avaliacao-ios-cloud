//
//  BeersTableViewController.swift
//  Beers
//
//  Created by Lucas Domingos on 15/07/17.
//  Copyright © 2017 Lucas Domingos. All rights reserved.
//

import UIKit

class BeersTableViewController: UITableViewController {
    
    // MARK: - Properties
    var beers: [Beer] = []

    // MARK: - Super methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        requestBeers();
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? BeerDetailViewController {
            vc.beer = beers[tableView.indexPathForSelectedRow!.row]
        }
    }
    
    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.beers.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! BeerTableViewCell
        let beer = beers[indexPath.row]
        
        cell.drawBeer(beer)
        return cell
    }


    // MARK: - Methods
    func requestBeers(){
        let api = RequestApi()
        api.requestBeers() { response in
            self.beers = response
            self.tableView.reloadData()
        }
    }

}
