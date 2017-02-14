
//
//  HomeViewController.swift
//  QApp
//
//  Created by Anuraag Jain on 10/02/17.
//  Copyright © 2017 Anuraag. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    @IBOutlet weak var tableView:UITableView!
    var refreshControl = UIRefreshControl()
    let header =  ProfileHeader.loadView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    
    func initialSetup(){
        navBar()
        refreshControl.tintColor =  UIColor.white
        refreshControl.addTarget(self, action: #selector(HomeViewController.refreshEvents), for: .valueChanged)
        let nib = UINib(nibName: "QCell", bundle: nil)
        tableView.delegate = self
        tableView.estimatedRowHeight = 205
        tableView.register(nib, forCellReuseIdentifier: "cell")
        tableView.addSubview(refreshControl)
        tableView.reloadData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navBar()
        tableView.reloadData()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
    }
    func navBar(){
        self.title = "QApp"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 32/255, green: 32/255, blue: 43/255, alpha: 1.0)
        self.navigationController?.navigationBar.tintColor = UIColor.white
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.titleTextAttributes = [NSForegroundColorAttributeName:UIColor.white]
        self.navigationController?.navigationBar.isTranslucent = false
        let rightButton = UIBarButtonItem(image: UIImage(named:"search"), style: .done, target: self, action: #selector(HomeViewController.loadSearchController))
        let leftButton = UIBarButtonItem(image: UIImage(named:"menu"), style: .done, target: self, action: nil)
        self.navigationItem.leftBarButtonItem = leftButton
        self.navigationItem.rightBarButtonItem = rightButton
    }
    func refreshEvents(){
        tableView.reloadData()
        refreshControl.endRefreshing()
    }
    func loadSearchController(){
        let vc = self.storyboard?.instantiateViewController(withIdentifier: SegueIdentifer.SearchViewController) as! SearchViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    //MARK: - TableView Delegate..
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! QCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "DetailController")
        self.navigationController?.pushViewController(vc!, animated: true)
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let frame = CGRect(x: 0, y: 0, width: self.view.frame.size.width, height: 150)
        header.frame = frame
        return header
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 150
    }
   
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 205
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
