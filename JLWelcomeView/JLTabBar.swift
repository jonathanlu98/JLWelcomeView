//
//  ViewController.swift
//  JLWelcomeView
//
//  Created by Jonathan Lu on 2019/3/21.
//  Copyright © 2019 JonathanLu. All rights reserved.
//

import UIKit

let SCREEN_WIDTH = UIScreen.main.bounds.width
let SCREEN_HEIGHT = UIScreen.main.bounds.height


//class CustomTabBarView: UIView {
//
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//}
//
//
//class CustomTabBar: UITabBar {
//
//    var homeItem: UITabBarItem!
//    var searchItem: UITabBarItem!
//    var libraryItem: UITabBarItem!
//
//
//    override init(frame: CGRect) {
//        super.init(frame: frame)
//        homeItem = UITabBarItem.init(title: "Home", image: UIImage(), tag: 1)
//        searchItem = UITabBarItem.init(title: "Search", image: UIImage(), tag: 2)
//        libraryItem = UITabBarItem.init(title: "Your Library", image: UIImage(), tag: 3)
//        self.items = [homeItem, searchItem, libraryItem]
//
//    }
//
//    required init?(coder aDecoder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//
//}

class TabBarController: UITabBarController {
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tabBar.isTranslucent = false

        self.tabBar.barTintColor = #colorLiteral(red: 0.1568627451, green: 0.1568627451, blue: 0.1568627451, alpha: 1)

        self.loadViewControllers()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    func loadViewControllers() {
        let vc1 = UIViewController()
        config(tabBarItem: vc1.tabBarItem, title: "Home", image: #imageLiteral(resourceName: "home-o"), selectedImage: #imageLiteral(resourceName: "home"), textColor: #colorLiteral(red: 0.7019607843, green: 0.7019607843, blue: 0.7019607843, alpha: 1), selectedTextColor: .white, textFont: UIFont.systemFont(ofSize: 11))
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = .init(width: UIScreen.main.bounds.width, height: 56)
        layout.minimumLineSpacing = 0
        layout.scrollDirection = .vertical
        
        let vc2 = RadioCollectionViewController(collectionViewLayout: layout)
        let nc = SearchNavigationController(rootViewController: vc2)
        vc2.title = "Radio"
        
        config(tabBarItem: nc.tabBarItem, title: "Search", image: #imageLiteral(resourceName: "search"), selectedImage: #imageLiteral(resourceName: "search-o"), textColor: #colorLiteral(red: 0.7019607843, green: 0.7019607843, blue: 0.7019607843, alpha: 1), selectedTextColor: .white, textFont: UIFont.systemFont(ofSize: 11))
        let vc3 = UIViewController()
        config(tabBarItem: vc3.tabBarItem, title: "Your Library", image: #imageLiteral(resourceName: "align-right 0"), selectedImage: #imageLiteral(resourceName: "align-right"), textColor: #colorLiteral(red: 0.7019607843, green: 0.7019607843, blue: 0.7019607843, alpha: 1), selectedTextColor: .white, textFont: UIFont.systemFont(ofSize: 11))


        
        self.addChild(vc1)
        self.addChild(nc)
        self.addChild(vc3)
        
    }
    
    func config(tabBarItem:UITabBarItem, title:String, image:UIImage ,selectedImage:UIImage ,textColor:UIColor, selectedTextColor:UIColor, textFont:UIFont) {
        tabBarItem.title = title
        tabBarItem.image = image
        tabBarItem.selectedImage = selectedImage
        let attr = NSMutableDictionary()
        attr[NSAttributedString.Key.font] = textFont
        attr[NSAttributedString.Key.foregroundColor] = textColor
        
        let selectedAttr = NSMutableDictionary()
        selectedAttr[NSAttributedString.Key.font] = textFont
        selectedAttr[NSAttributedString.Key.foregroundColor] = selectedTextColor
        
        tabBarItem.setTitleTextAttributes((attr as! [NSAttributedString.Key : Any]), for: .normal)
        tabBarItem.setTitleTextAttributes((selectedAttr as! [NSAttributedString.Key : Any]), for: .selected)
        
    }


}



