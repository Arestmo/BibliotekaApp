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
    
    let books = ["book1", "book2", "book3", "book4"]
    let bookImages: [UIImage] = [
        UIImage(named: "book1")!,
        UIImage(named: "book1")!,
        UIImage(named: "book1")!,
        UIImage(named: "book1")!,
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.dataSource = self
        collectionView.delegate = self
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 35, height: 30))
        imageView.image = UIImage(named: "lupa")
        search.rightView = imageView;
        search.rightViewMode = .always
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return books.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        cell.bookName.text = books[indexPath.item]
        cell.bookImage.image = bookImages[indexPath.item]
        
        return cell
    }

}

