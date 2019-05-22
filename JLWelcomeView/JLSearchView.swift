//
//  JLSearchView.swift
//  JLWelcomeView
//
//  Created by Jonathan Lu on 2019/3/22.
//  Copyright © 2019 JonathanLu. All rights reserved.
//

import UIKit
import SDWebImage


class SearchNavigationController: UINavigationController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        self.navigationBar.barStyle = .black
        self.navigationBar.shadowImage = UIImage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MusicListCollectionViewCell: UICollectionViewCell {
    var picture: UIImageView!
    var textView:UIView!
    var title: UILabel!
    var classify: UILabel!
    var imageUrl:URL!

    
    override init(frame: CGRect) {
        super.init(frame: frame)

        
        picture = UIImageView(frame: CGRect(x: 0, y: 0, width: 155, height: 155))
        textView = UIView(frame: CGRect(x: 0, y: 155, width: 155, height: 64))
        
        title = UILabel(frame: CGRect(x: 0, y: 8, width: 155, height: 14.5))
        classify = UILabel(frame: CGRect(x: 0, y: 23.5, width: 155, height: 14.5))
        
        
        
    }
    
    func setupUI() {
        picture.backgroundColor = .clear
        picture.alpha = 0
        
        title.textAlignment = .center
        title.font = UIFont.boldSystemFont(ofSize: 10)
        title.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        classify.textAlignment = .center
        classify.font = UIFont.systemFont(ofSize: 10)
        classify.textColor = #colorLiteral(red: 0.7019607843, green: 0.7019607843, blue: 0.7019607843, alpha: 1)
        
        self.addSubview(picture)
        self.addSubview(textView)
        
        textView.addSubview(title)
        textView.addSubview(classify)
        
//        SDWebImageDownloader.shared().downloadImage(with: imageUrl, options: .continueInBackground, progress: { (x, y, url) in
//
//        }) { (image, data, error, bool) in
//            self.picture.image = image
//            UIImageView.animate(withDuration: 0.2, animations: {
//                self.picture.alpha = 1
//                self.picture.image = image
//            })
//        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class MusicListCollectionView: UICollectionView, UICollectionViewDelegate, UICollectionViewDataSource {

    var URLS:NSMutableArray!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {

        let cell = self.dequeueReusableCell(withReuseIdentifier: "musicCell", for: indexPath) as! MusicListCollectionViewCell


        
        DispatchQueue.global(qos: .userInitiated).sync {
            cell.title.text = "Younger"
            
            cell.classify.text = "Song Radio"
            
            cell.setupUI()
            
            cell.imageUrl = URL.init(string: self.URLS[indexPath.row] as! String)
            cell.picture.sd_setImage(with: cell.imageUrl, completed: { (image, error, cacheType, url) in
                
                DispatchQueue.main.async {
                    cell.picture.image = image
                    UIImageView.animate(withDuration: 0.2, animations: {
                        cell.picture.alpha = 1
                    })
                }
            })
        }
        

        
        
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let vc = Load1CustomView.init(frame: .init(x: UIScreen.main.bounds.width/2 - 50, y: UIScreen.main.bounds.height/2 - 50, width: 100, height: 100))
        vc.alpha = 0
        vc.backgroundColor = .clear
        self.superview?.addSubview(vc)
        addAnimation(view: vc)
//        UIView.animate(withDuration: 0.3, animations: {
//            vc.alpha = 1
//        }) { (Bool) in
//            if Bool == true {
//            self.addAnimation(view: vc)
//            }
//        }


    }
    func addAnimation(view:Load1CustomView) {
        UIView.animate(withDuration: 1.56, animations: {
            view.alpha = 1
            view.addAni1Animation()
        }) { (Bool) in
                view.alpha = 0
                self.addAnimation(view: view)
            }

    }
    
    
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        SDImageCache.shared.clearDisk {
            
        }
        URLS = ["https://i.scdn.co/image/f3eda5df1723b13f0846926f7e480e72013bf1ef",
                "https://i.scdn.co/image/ce25b6074176711666fd990f6d4f0622dc0697b4",
                "https://i.scdn.co/image/2ae26ca31634b41f4528049322e1e3c599a116ae",
                "https://i.scdn.co/image/77eb7c17cafe55031d4132e803a28613ecd54da4",
                "https://i.scdn.co/image/fe4df61dbf98a845fe90c772728c9a80cb246cee",
                "https://i.scdn.co/image/8b79c05e1d8927bcaae594bf64dfd19d8d027af2"]
        self.backgroundColor = .clear
        self.showsHorizontalScrollIndicator = false
        self.showsVerticalScrollIndicator = false
        
        self.delegate = self
        self.dataSource = self

        self.register(MusicListCollectionViewCell.self, forCellWithReuseIdentifier: "musicCell")
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}





class RadioCollectionViewController: UICollectionViewController {
    
    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.collectionView.backgroundColor = #colorLiteral(red: 0.07058823529, green: 0.07058823529, blue: 0.07058823529, alpha: 1)
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        
        self.collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        
    }
}

extension RadioCollectionViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
        
        if indexPath.row == 0 {
            let label = UILabel(frame: CGRect(x: 0, y: 24.5, width: cell.frame.width, height: 21.5))
            label.text = "Recommended Stations"
            label.font = UIFont.boldSystemFont(ofSize: 15)
            label.textColor = .white
            label.textAlignment = .center
            cell.contentView.addSubview(label)
                    return cell
        }
        
        if indexPath.row == 1 {
            cell.frame = CGRect(x: 0, y: 56, width: cell.frame.width, height: 229)
            let layout = UICollectionViewFlowLayout()
            layout.itemSize = .init(width: 155, height: 219)
            layout.minimumLineSpacing = 16
            layout.sectionInset.left = 16
            layout.sectionInset.right = 16
            layout.sectionInset.top = -10
            layout.sectionInset.bottom = 0


            layout.scrollDirection = .horizontal
            let collectionView = MusicListCollectionView(frame: CGRect(x: 0, y: 0, width: cell.frame.width, height: cell.frame.height), collectionViewLayout: layout)
            cell.contentView.addSubview(collectionView)
                    return cell
        }
                return cell

        
    }
    
    
}
