
//
//  DetailViewController.swift
//  QApp
//
//  Created by Anuraag Jain on 10/02/17.
//  Copyright © 2017 Anuraag. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var tableView:UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initialSetup()
    }
    func initialSetup(){
       navBar()
        let detailCell =  UINib(nibName: "DetailQCell", bundle: nil)
        let commentCell = UINib(nibName: "CommentCell", bundle: nil)
        tableView.register(detailCell, forCellReuseIdentifier: "detailQ")
        tableView.register(commentCell, forCellReuseIdentifier: "commentCell")
        tableView.reloadData()
    }
    
    func navBar(){
        self.title = "Question"
        self.navigationController?.navigationBar.barTintColor = UIColor(red: 212/255, green: 23/255, blue: 123/255, alpha: 1.0)
        let backbarButton = UIBarButtonItem(image: UIImage(named:"back"), style: .done, target: self, action: #selector(DetailViewController.didTapOnBackButton))
        self.navigationController?.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationController?.navigationBar.shadowImage = UIImage()
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.isOpaque = false
        self.navigationItem.leftBarButtonItem = backbarButton
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        NotificationCenter.default.addObserver(self, selector: #selector(DetailViewController.reloadData), name: .UIContentSizeCategoryDidChange, object: nil)
        
    }
    func reloadData(){
        tableView.reloadData()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
    }
     func didTapOnBackButton(){
        _ = self.navigationController?.popViewController(animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0{
            let cell = tableView.dequeueReusableCell(withIdentifier: "detailQ") as! DetailQCell
            cell.questionLabel.text = "Why do people ask even simple question on Stackoverflow?"
            cell.tagsLabel.text = "#Google #Facebook #hastag #twitter #trending #insta #food #daily #fun"
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "commentCell", for: indexPath) as! CommentCell
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if indexPath.row != 0 {
            let rotation =  CATransform3DTranslate(CATransform3DIdentity, 20, -300, -10)
            cell.layer.transform = rotation
            cell.alpha = 0
            UIView.animate(withDuration: 1, animations: {
                cell.alpha = 1
                cell.layer.transform = CATransform3DIdentity
            })
        }
        
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
