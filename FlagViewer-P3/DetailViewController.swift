//
//  DetailViewController.swift
//  FlagViewer-P3
//
//  Created by Łukasz Nycz on 29/06/2021.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet var FlagView: UIImageView!
    var selectedImage: String?
    var detailVCTitle: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        title = detailVCTitle
        navigationItem.largeTitleDisplayMode = .never
        
        if let imageToLoad = selectedImage {
            FlagView.image = UIImage(named: imageToLoad)
        }
        
        FlagView.layer.borderWidth = 2
        FlagView.layer.borderColor = UIColor.black.cgColor
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
