//
//  ViewController.swift
//  Serachapp
//
//  Created by bmiit on 12/04/22.
//

import UIKit

class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate{

    @IBOutlet var searchbar: UISearchBar!
    @IBOutlet var tableview: UITableView!
    private var array:[String ]=["Cow","Lion","Wolf","Camel","Tiger"]
    private var Intenalarray:[String ]=["Cow","Lion","Wolf","Camel","Tiger"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.tableview.register(UITableViewCell.self, forCellReuseIdentifier: "cellIdentifier")
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.array.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell=self.tableview.dequeueReusableCell(withIdentifier: "cellIdentifier")!
        cell.textLabel?.text=self.array[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(self.array[indexPath.row])
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        let text:String = self.searchbar.text ?? ""
        self.array=[]
        for item in self.Intenalarray{
            if(item.lowercased().contains(text.lowercased())){
                self.array.append(item)
            }
        }
        if(text.isEmpty){
            self.array=self.Intenalarray
        }
        self.tableview.reloadData()
    }


}

