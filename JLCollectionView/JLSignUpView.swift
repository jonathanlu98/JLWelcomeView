//
//  JLSignUpView.swift
//  JLCollectionView
//
//  Created by Jonathan Lu on 2019/3/27.
//  Copyright © 2019 JonathanLu. All rights reserved.
//

import UIKit
import YYKit
import Masonry

class JLignUpNavigationController: UINavigationController {
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationBar.setBackgroundImage(nil, for: .default)
        self.navigationBar.shadowImage = nil
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

//MARK: - 欢迎登录界面
class JLSignUpViewController : UIViewController {
    
    var grayColorView:UIView!
    var joinButton:UIButton!
    var signUpButton:UIButton!
    var backGroundCollectionView:WelcomePageCollectionView!
    var label:UILabel!
    var pageControl:UIPageControl!
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.alpha = 0
        UIView.animate(withDuration: 0.5) {
            self.view.alpha = 1
        }


    }
    

    

    
    override func viewDidLoad() {
        
        self.navigationController?.setNavigationBarHidden(false, animated: false)
        
        
        self.view.backgroundColor = .black
        

        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = self.view.frame.size
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.sectionInset = .init(top: 0, left: 0, bottom: 0, right: 0)
        
        
        layout.scrollDirection = .horizontal
        
        backGroundCollectionView = WelcomePageCollectionView(frame: self.view.frame, collectionViewLayout: layout)
        
        pageControl = UIPageControl()
        pageControl.numberOfPages = 5
        backGroundCollectionView.itemValue = { (number) in
            self.pageControl.currentPage = number
        }
        pageControl.currentPage = 0
        pageControl.hidesForSinglePage = false
        pageControl.isEnabled = false
        pageControl.updateCurrentPageDisplay()
        



        
        let buttonView = UIView(frame: .init(x: 25, y: 522, width: self.view.frame.width - 50, height: 100))
        buttonView.backgroundColor = .clear
        
        joinButton = UIButton.init(type: .custom)
        joinButton.frame = .init(x: 0, y: 0, width: self.view.frame.width - 50, height: 45)
        config(button: joinButton, title: "开始吧", bgColor: #colorLiteral(red: 0, green: 0.7215686275, blue: 1, alpha: 1), tintColor: #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1), textFont: UIFont.boldSystemFont(ofSize: 16))
        
        signUpButton = UIButton.init(type: .system)
        signUpButton.frame = .init(x: 0, y: 55, width: self.view.frame.width - 50, height: 45)
        config(button: signUpButton, title: "登录", bgColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.3), tintColor: .white, textFont: UIFont.boldSystemFont(ofSize: 16))
        
        let logoView = UIView.init(frame: .init(x: self.view.center.x - 50, y: 100, width: 100, height: 100))
        let animationView = LogoCustomView.init(frame: .init(x: 0, y: 0, width: 100, height: 100))
        
        
        self.view.addSubview(backGroundCollectionView)

        
        view.addSubview(logoView)
        logoView.addSubview(animationView)
        
        self.view.addSubview(buttonView)
        buttonView.addSubview(joinButton)
        buttonView.addSubview(signUpButton)
        
        self.view.addSubview(pageControl)
        animationView.addTumblrAnimation()
        
        
        buttonView.mas_makeConstraints { (make) in
            make?.bottom.equalTo()(self.view.bottom)?.offset()(-44)
            make?.left.offset()(25)
            make?.width.equalTo()(self.view.frame.width - 50)
            make?.height.equalTo()(100)
        }

        pageControl.mas_makeConstraints { (make) in
            make?.bottom.equalTo()(buttonView.mas_top)
            make?.centerX.equalTo()(buttonView.mas_centerX)
            make?.width.equalTo()(71)
            make?.height.equalTo()(37)
        }

    }
    
    func config(button:UIButton, title:String, bgColor:UIColor, tintColor:UIColor, textFont:UIFont) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.setTitle(title, for: .highlighted)
        

        button.titleLabel?.font = textFont
        button.backgroundColor = bgColor
        button.tintColor = tintColor
        button.layer.cornerRadius = 3
    }
}
//MARK: - 动图背景
class WelcomePageCollectionView : UICollectionView {
    let images = ["1111", "123456", "123", "20190402133750", "20190402134019"]
    let texts = ["发现让你眼界大开的内容。", "关注点燃你兴趣的\nTumblr用户。", "自定义你的外观，做你想做的人。", "可以发布任何内容：文字、GIF动图、音乐，随便什么。", "欢迎来到Tumblr。"]
    
    var itemValue:((Int) -> Void)? = nil
    
    override init(frame: CGRect, collectionViewLayout layout: UICollectionViewLayout) {
        super.init(frame: frame, collectionViewLayout: layout)
        self.backgroundColor = .clear

        
        self.delegate = self
        self.dataSource = self
        self.isPagingEnabled = true
        self.showsHorizontalScrollIndicator = false
        self.register(WCCollectionViewCell.self, forCellWithReuseIdentifier: "WCCollectionViewCell")

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension WelcomePageCollectionView : UICollectionViewDelegate, UICollectionViewDataSource {

    

    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    


    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "WCCollectionViewCell", for: indexPath) as! WCCollectionViewCell

        
        



            YYDispatchQueuePool.init(name: "yyimage", queueCount: 8, qos: .background).queue().async {

                let image = YYImage.init(named: self.images[indexPath.row])

                

                
                DispatchQueue.main.sync {
                    cell.setupUI()

                    cell.imageView.image = image
                    cell.textLabel.text = self.texts[indexPath.row]

                }
            }

            

        
        return cell

    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        
        cell.frame = CGRect(x: (CGFloat(indexPath.row) * collectionView.width), y: collectionView.bounds.minY, width: collectionView.width, height: collectionView.height)


        
    }

    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let point = CGPoint(x: self.frame.size.width / 2 + scrollView.contentOffset.x, y: self.frame.size.height / 2 + scrollView.contentOffset.y)
        let indexpath = self.indexPathForItem(at: point)
        
        itemValue!(indexpath?.row ?? 0)
        

    }


}

struct WCCollectionViewCellModel {
    var imageURL:URL! = URL.init(string: "")
    var text:String! = ""
    
    init(imageURL:URL, text:String) {
        self.imageURL = imageURL
        self.text = text
    }
}

class WCCollectionViewCell: UICollectionViewCell {
    

    var imageView: YYAnimatedImageView!
    var grayView: UIView!
    var textLabel: UILabel!
    
    override init(frame: CGRect) {

        super.init(frame: frame)
        

        
        imageView = YYAnimatedImageView.init(frame: .init(x: 0, y: 0, width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height))
        imageView.backgroundColor = .clear
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFill
        
        
        
        
        grayView = UIView.init(frame: imageView.frame)
        grayView.backgroundColor = .black
        grayView.alpha = 0.4
        
        textLabel = UILabel()
        textLabel.textAlignment = .center
        textLabel.textColor = .white
        textLabel.font = UIFont.boldSystemFont(ofSize: 26)
        textLabel.numberOfLines = 0
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    

    
    func setupUI() {
        
        self.addSubview(imageView)
        imageView.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.mas_top)
            make?.bottom.equalTo()(self.mas_bottom)
            make?.leading.equalTo()(self.mas_leading)
            make?.trailing.equalTo()(self.mas_trailing)

        }
        self.addSubview(grayView)
        grayView.mas_makeConstraints { (make) in
            make?.top.equalTo()(self.mas_top)
            make?.bottom.equalTo()(self.mas_bottom)
            make?.leading.equalTo()(self.mas_leading)
            make?.trailing.equalTo()(self.mas_trailing)
            
        }
        self.addSubview(textLabel)
        textLabel.mas_makeConstraints { (make) in
            make?.centerY.equalTo()(self.mas_centerY)
            make?.centerX.equalTo()(self.mas_centerX)
            make?.right.equalTo()(-25)
            make?.left.equalTo()(25)
            make?.height.equalTo()(120)
            
        }
        
        
    }

}

//MARK: - 登录账号界面

class LoginAccountView: UIStackView {
    var emailTextField:UITextField!
    var tipView:UITextView!
    var successButton:UIButton!
    var lineView:UIView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.axis = .vertical
        self.alignment = .fill
        self.distribution = .fill
        self.spacing = 5
        self.backgroundColor = .clear
        
        emailTextField = UITextField()
        emailTextField.background = nil
        emailTextField.backgroundColor = .clear
        emailTextField.placeholder = "电子邮件"
        emailTextField.textColor = .white
        emailTextField.font = UIFont.systemFont(ofSize: 18)
        emailTextField.textAlignment = .natural
        emailTextField.borderStyle = .none
        emailTextField.clearButtonMode = .never
        emailTextField.leftViewMode = .never
        emailTextField.rightViewMode = .always
        emailTextField.minimumFontSize = 14
        
        emailTextField.spellCheckingType = .default
        emailTextField.autocapitalizationType = .none
        emailTextField.autocorrectionType = .no
        
        emailTextField.keyboardType = .emailAddress
        emailTextField.keyboardAppearance = .alert
        emailTextField.returnKeyType = .default
        
        emailTextField.contentHorizontalAlignment = .left
        emailTextField.contentVerticalAlignment = .bottom
        
        
        lineView = UIView()
        lineView.backgroundColor = .white
        
        
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    

}
