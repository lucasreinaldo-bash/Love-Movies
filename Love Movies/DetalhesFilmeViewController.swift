//
//  DetalhesFilmeViewController.swift
//  Love Movies
//
//  Created by Lucas Reinaldo on 27/08/20.
//  Copyright © 2020 Vostore. All rights reserved.
//

import UIKit

class DetalhesFilmeViewController: UIViewController {

    @IBOutlet weak var capaFilme: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    func configure(with model: Movie){
       let url = model.Poster
        if let data = try? Data(contentsOf: URL(string: url)!){
             self.capaFilme.image = UIImage(data: data)
        }
       
        
    }
}
extension UIImageView {
    func load(url: URL) {
        DispatchQueue.global().async { [weak self] in
            if let data = try? Data(contentsOf: url) {
                if let image = UIImage(data: data) {
                    DispatchQueue.main.async {
                        self?.image = image
                    }
                }
            }
        }
    }
    
}
