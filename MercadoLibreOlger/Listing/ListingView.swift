//
//  ListingView.swift
//  MercadoLibreOlger
//
//  Created by Olger Rosero on 14/10/20.
//  
//

import Foundation
import UIKit

class ListingView: BaseViewController {

    // MARK: Properties
    var presenter: ListingPresenterProtocol?
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var loadingIndicator: UIActivityIndicatorView!
    
   
    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "ItemListing", bundle: nil),  forCellReuseIdentifier: "ItemListingViewCell")
        presenter?.viewDidLoad()
        searchBar.text = presenter?.query
    }
    
    func search(_ query: String){
        presenter?.search(query)
    }
    
    @IBAction func onSearch(_ value: Any){
        guard let query = searchBar.text else { return }
        search(query)
    }
}

extension ListingView: ListingViewProtocol {

    func onReloadData() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    func onError(error: ErrorApi) {
        onShowAlertMessage(error.message)
    }
    
    func setLoadingIndicator(animating: Bool) {
        DispatchQueue.main.async {
            if animating{
                self.loadingIndicator.isHidden = false
                self.loadingIndicator.startAnimating()
            }else{
                self.loadingIndicator.stopAnimating()
            }
        }
        
    }
    
}

extension ListingView: UITableViewDelegate, UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return presenter?.results?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemListingViewCell", for: indexPath) as! ItemListingViewCell
        cell.result = presenter?.results?[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let result = presenter?.results?[indexPath.row] else { return }
        presenter?.openDetail(result)
        
    }
    
}
