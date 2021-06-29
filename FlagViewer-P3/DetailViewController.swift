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
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(shareFlag))
        
        if let imageToLoad = selectedImage {
            FlagView.image = UIImage(named: imageToLoad)
        }
        
        FlagView.layer.borderWidth = 2
        FlagView.layer.borderColor = UIColor.black.cgColor
    }
    
    @objc func shareFlag() {
        
        guard let image = FlagView.image?.pngData() else {
            print("No image found")
            return
        }
        let items: [Any] = [selectedImage!, image]
        let vc = UIActivityViewController(activityItems: items, applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
        
    }
}
