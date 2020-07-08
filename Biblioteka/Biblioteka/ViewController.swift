//
//  ViewController.swift
//  Biblioteka
//
//  Created by Pawel on 02.06.2020.
//  Copyright © 2020 PSW. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var search: UITextField!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var booksArr = [SingleBook]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 35, height: 30))
        imageView.image = UIImage(named: "lupa")
        search.rightView = imageView;
        search.rightViewMode = .always
        
        downloadJSON {
            print("Successfull load data from JSON")
            self.collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return booksArr.count
    }
    
    func downloadJSON(completed: @escaping () -> ()) {
        let url = URL(string: "http://localhost:4000/books")
        
        URLSession.shared.dataTask(with: url!) { (data, response, error) in
            if error == nil {
                do {
                    self.booksArr = try JSONDecoder().decode([SingleBook].self, from: data!)
                    
                    DispatchQueue.main.async {
                        completed()
                    }
                } catch {
                    print("JSON ERROR")
                }
            }
        }.resume()
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.bookName.text = booksArr[indexPath.item].title
        let url = URL(string: booksArr[indexPath.item].url)
        cell.bookImage.load(url: url!)
        
        return cell
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
