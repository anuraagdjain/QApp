//
//  SearchViewController.swift
//  QApp
//
//  Created by Anuraag Jain on 14/02/17.
//  Copyright © 2017 Anuraag. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate{
    
    @IBOutlet weak var tableView:UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    func initialSetup(){
        let nib = UINib(nibName: "QCell", bundle: nil)
        tableView.delegate = self
        tableView.estimatedRowHeight = 205
        tableView.register(nib, forCellReuseIdentifier: "cell")
        
        searchBar.placeholder = "Seach Here!"
        searchBar.delegate = self
        self.navigationItem.titleView = searchBar
        searchBar.becomeFirstResponder()
        automaticallyAdjustsScrollViewInsets = false
        
        navBar()
    }
    
    func navBar(){
        let backbarButton = UIBarButtonItem(image: UIImage(named:"back"), style: .done, target: self, action: #selector(SearchViewController.didTapOnBackButton))
        self.navigationItem.leftBarButtonItem = backbarButton
    }
    func didTapOnBackButton(){
        _ = self.navigationController?.popViewController(animated: true)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //MARK: - TableView Delegate
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as! QCell
        return cell
    }
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 205
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
   
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
