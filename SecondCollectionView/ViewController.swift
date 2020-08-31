//
//  ViewController.swift
//  SecondCollectionView
//
//  Created by THUY Nguyen Duong Thu on 8/31/20.
//  Copyright © 2020 THUY Nguyen Duong Thu. All rights reserved.
//

import UIKit
struct Item {
    var imageName: String
}

struct Des {
    var text: String
}

class ViewController: UIViewController {
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    var items: [Item] = [Item(imageName: "img1"),
                         Item(imageName: "img2"),
                         Item(imageName: "img3"),
                         Item(imageName: "img4"),
                         Item(imageName: "img5"),
                         Item(imageName: "img6"),
                         Item(imageName: "img7"),
                         Item(imageName: "img8")]
    var descriptions = ["Xin chao mn","viettel khuyen mai 50% ngay hom nay","Beautiful night", "Open Club","Soar","Kate Perry", "VMA Day", "Rain on Me"]
    
    var collectionViewFlowLayout: UICollectionViewFlowLayout!
    let cellIdentifier = "ItemCollectionViewCell"
    let viewImageSegueIdentifier = "viewImageSegueIdentifier"
    
    let lineSpacing: CGFloat = 5
    let interItemSpacing: CGFloat = 5
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        setupCollectionView()
        setupCollectionViewItemSize()
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
    }
    
    
    private func setupCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        let nib = UINib(nibName: "ItemCollectionViewCell", bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: cellIdentifier)
    }
    
    private func setupCollectionViewItemSize() {
        let customLayout = CustomLayout()
        customLayout.delegate = self
        collectionView.collectionViewLayout = customLayout
    }
    
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! ItemCollectionViewCell
        cell.imageView.image = UIImage(named: items[indexPath.item].imageName)
        cell.label.text = descriptions[indexPath.row]
        return cell
    }
    
}

extension ViewController: CustomLayoutDelegate {
    func collectionView(_ collectionView: UICollectionView, sizeOfPhotoIndexPath indexPath: IndexPath) -> CGSize {
        return UIImage(named: items[indexPath.item].imageName)!.size
    }
}

