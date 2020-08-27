//
//  ViewController.swift
//  Love Movies
//
//  Created by Lucas Reinaldo on 25/08/20.
//  Copyright © 2020 Vostore. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITextFieldDelegate, UITableViewDelegate , UITableViewDataSource {

    @IBOutlet var table: UITableView!
    @IBOutlet var field: UITextField!
   
    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
      
        
        field.delegate = self
        field.placeholder = "Qual filme você deseja encontrar ?"
        // Do any additional setup after loading the view.
        
    }
    
    //Field
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
    
        searchMovies()
        return true
    }
    func searchMovies(){
        table.register(MovieTableViewCell.nib(), forCellReuseIdentifier: MovieTableViewCell.indentifier)
              table.delegate = self
              table.dataSource = self
        field.resignFirstResponder()
        
        guard let text = field.text, !text.isEmpty else {
            return
        }
        let query = text.replacingOccurrences(of: " ", with: "%20")
        movies.removeAll()
        URLSession.shared.dataTask(with: URL(string: "https://www.omdbapi.com/?apikey=86accbe3&s=\(query)&type=movie")!, completionHandler: {data, response, error in
            guard let data = data, error == nil else {
                return
            }
            //Convert
            var result: MovieResult?
            do {
                result = try JSONDecoder().decode(MovieResult.self, from: data)
            }
            catch {
                print("error")
            }
            guard let finalResult = result else {
                return
            }
            
            print("\(finalResult.Search.first?.Year)")
            //Update our movie array
            let newMovies = finalResult.Search
            self.movies.append(contentsOf: newMovies)
            
            //Refresh our table
            DispatchQueue.main.async {
                self.table.reloadData()
            }
            }).resume()
    }
    
    //Table
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.indentifier, for: indexPath) as! MovieTableViewCell
        cell.configure(with: movies[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
       let storyboard = UIStoryboard(name:"Main", bundle: nil)
        let signInVC = storyboard.instantiateViewController(withIdentifier: "detalhesFilmes")
        self.present(signInVC, animated: false, completion:  nil)
        //Show movie details
    }

}

struct MovieResult: Codable {
    let Search: [Movie]
}

struct Movie: Codable {
   let Title : String
   let Year : String
   let imdbID : String
    let _Type : String
    let Poster : String
    
    private enum CodingKeys: String, CodingKey {
        case Title, Year, imdbID, _Type = "Type", Poster
    }
}
