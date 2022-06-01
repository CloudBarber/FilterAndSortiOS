//
//  ViewController.swift
//  InClass06
//
//  Created by Evans, Jonathan on 4/28/19.
//  Copyright © 2019 Evans, Jonathan. All rights reserved.
//
//Assignment #: 6
//File name: InClass06
//Student Full Name: Jonathan Evans

import UIKit

class ViewController: UIViewController {
    
    var user: User?
    var userArray = [User]()
    var alteredArray = [User]()
   
    
    
    
    @IBOutlet weak var tableView: UITableView!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cellNib = UINib(nibName: "CustomTableViewCell", bundle: nil)
        tableView.register(cellNib, forCellReuseIdentifier: "CustomCell")
        // Do any additional setup after loading the view, typically from a nib.
        
        userArray = DataInfo.users
        alteredArray = userArray
        
        
        
    }
    
    
    @IBAction func FilterButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "Filter By", message: "Pick option to filter users by", preferredStyle: .actionSheet)
        
        let FilterFemale = UIAlertAction(title: "Gender: Female", style: .default, handler: {(alert: UIAlertAction!) in self.FilterArrayFemale()})
        
        let FilterMale = UIAlertAction(title: "Gender: Male", style: .default, handler: {(alert: UIAlertAction!) in self.FilterArrayMale()})
        
        let ShowAll = UIAlertAction(title: "Show All", style: .default, handler: {(alert: UIAlertAction!) in self.ShowAll()})
        
        let Cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(FilterFemale)
        alert.addAction(FilterMale)
        alert.addAction(ShowAll)
        alert.addAction(Cancel)
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc func FilterArrayFemale(){
        alteredArray.removeAll()
        
        for i in 0..<userArray.count {
            
            if userArray[i].gender == "Female"{
               alteredArray.append(userArray[i])
            }
        }
        
        tableView.reloadData()
    }
    
    @objc func FilterArrayMale(){
        alteredArray.removeAll()
        
        for i in 0..<userArray.count{
            if userArray[i].gender == "Male"{
                alteredArray.append(userArray[i])
            }
        }
        
        tableView.reloadData()
    }
    
    @objc func ShowAll(){
        alteredArray = userArray
        tableView.reloadData()
    }
    
    
    @IBAction func SortButton(_ sender: Any) {
        
        let alert = UIAlertController(title: "Sort By", message: "Pick option to sort users by", preferredStyle: .actionSheet)
        
        let SortName = UIAlertAction(title: "Name", style: .default, handler: {(alert: UIAlertAction!) in self.SortArrayByName()} )
        
        let SortAge = UIAlertAction(title: "Age", style: .default, handler: {(alert: UIAlertAction!) in self.SortArrayByAge()})
        
        let SortState = UIAlertAction(title: "State", style: .default, handler: {(alert: UIAlertAction!) in self.SortArrayByState()})
        
        let Cancel = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        
        alert.addAction(SortName)
        alert.addAction(SortAge)
        alert.addAction(SortState)
        alert.addAction(Cancel)
        
        
        present(alert, animated: true, completion: nil)
    }
    
    @objc func SortArrayByName(){
        alteredArray.sort(by: {$0.name! < $1.name!})
        tableView.reloadData()
    }
    
    @objc func SortArrayByAge(){
        alteredArray.sort(by: {$0.age! < $1.age!})
        tableView.reloadData()
    }
    
    @objc func SortArrayByState(){
        alteredArray.sort(by: {$0.state! < $1.state!})
        tableView.reloadData()
    }


}

extension ViewController: UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return alteredArray.count
       
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as! CustomTableViewCell
      
        
        /*
        let imageView = cell.viewWithTag(1000) as! UIImageView
        let nameLabel = cell.viewWithTag(100) as! UILabel
        let stateLabel = cell.viewWithTag(200) as! UILabel
        let ageLabel = cell.viewWithTag(300) as! UILabel
        let groupLabel = cell.viewWithTag(400) as! UILabel
        
        let intAge = Int(userArray[indexPath.row].age!)
        
        
        
            if userArray[indexPath.row].gender == "Male"{
                imageView.image = UIImage(named: "avatar_male")
            }
        
            else if userArray[indexPath.row].gender == "Female"{
                imageView.image = UIImage(named: "avatar_female")
            }
        nameLabel.text = userArray[indexPath.row].name
        stateLabel.text = userArray[indexPath.row].state
        ageLabel.text = "\(intAge) years old"
        groupLabel.text = userArray[indexPath.row].group
        
    */
        
        
            
        
        
            let intAge = Int(alteredArray[indexPath.row].age!)
        
            if alteredArray[indexPath.row].gender == "Male"{
                cell.ImageViewOutlet.image = UIImage(named: "avatar_male")
            }
        
            else if alteredArray[indexPath.row].gender == "Female"{
                cell.ImageViewOutlet.image = UIImage(named: "avatar_female")
            }
        
            cell.NameLabel.text = alteredArray[indexPath.row].name
            cell.StateLabel.text = alteredArray[indexPath.row].state
            cell.AgeLabel.text = "\(intAge) years old"
            cell.GroupLabel.text = alteredArray[indexPath.row].group
        
        
        
        
            
            
        return cell
    }
    
    
}

extension ViewController: UITableViewDelegate{
    
}
