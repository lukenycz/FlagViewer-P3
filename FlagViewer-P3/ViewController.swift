//
//  ViewController.swift
//  FlagViewer-P3
//
//  Created by Łukasz Nycz on 29/06/2021.
//

import UIKit

class ViewController: UITableViewController {
    
    var countries = [String]()

    override func viewDidLoad() {
        super.viewDidLoad()
        countries += ["estonia", "france", "germany", "ireland", "italy", "monaco", "nigeria", "poland", "russia", "spain", "uk", "us"]

        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        

        
        for item in items {
            if item.hasSuffix(".png") {
                countries.append(item)
            }
            countries.sort()
    }


 }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return countries.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flag", for: indexPath)
        cell.textLabel?.text = countries[indexPath.row].capitalized
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: "Detail") as? DetailViewController {
        vc.selectedImage = countries[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
            vc.detailVCTitle = "Flag of \(countries[indexPath.row].capitalized)"
        }
    }
    

}
