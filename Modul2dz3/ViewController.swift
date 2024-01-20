//
//  ViewController.swift
//  Modul2dz3
//
//  Created by Юрий Кузнецов on 17.01.2024.
//

import UIKit

protocol ViewControllerDelegate{
    func newTextLabel(nameLabel: String, firstLabel: String)
}

class ViewController: UIViewController, ViewControllerDelegate {
    func newTextLabel(nameLabel: String, firstLabel: String){
        self.nameLabel.text = nameLabel
        self.firstLabel.text = firstLabel
    }
    
    
    lazy var settBtn: UIButton = {
        let settBtn = UIButton(primaryAction: btnAction)
        settBtn.setTitle("Настройки", for: .normal)
        settBtn.frame = CGRect(x: view.frame.width, y: 335, width: 150, height: 19)
        settBtn.center.x = view.center.x
        settBtn.setTitleColor(UIColor(red: 8/255, green: 92/255, blue: 255, alpha: 1), for: .normal)
        
        return settBtn
    }()
    
    lazy var btnAction = UIAction { _ in
        let svController = SetViewController()
        svController.deligate = self
        self.navigationController?.pushViewController(svController, animated: true)
    
    }
    
    lazy var nameLabel = textLabel (text: "Имя", xOffset: 125)
    lazy var firstLabel = textLabel (text: "Фамилия", xOffset: 185)
    
    lazy var oneLabel = groupLabel(text: "10", yOffset: 5, xOffset: 10, weight: .bold, fontSize: 20)
    lazy var twoLabel = groupLabel(text: "20", yOffset: 5, xOffset: 10, weight: .bold, fontSize: 20)
    lazy var threeLabel = groupLabel(text: "30", yOffset: 5, xOffset: 10, weight: .bold, fontSize: 20)
    lazy var fourLabel = groupLabel(text: "Друзья", yOffset: 25, xOffset: 10, weight: .regular, fontSize: 16)
    lazy var fiveLabel = groupLabel(text: "Подписок", yOffset: 25, xOffset: 10, weight: .regular, fontSize: 16)
    lazy var sixLabel = groupLabel(text: "Избранных", yOffset: 25, xOffset: 10, weight: .regular, fontSize: 16)
    
    lazy var oneView = newView (text: "one", xOffset: 15)
    lazy var twoView = newView (text: "two", xOffset: view.center.x - 54.5)
    lazy var truView = newView (text: "tru", xOffset: view.frame.size.width - 124)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Профиль"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let imageOne = UIImageView(frame: CGRect(x: view.frame.width, y: 175, width: 100, height: 100))
        imageOne.center.x = view.center.x
        imageOne.image = UIImage(named: "image_one")
        imageOne.layer.cornerRadius = imageOne.frame.size.width / 2
        imageOne.clipsToBounds = true
        self.view.addSubview(imageOne)
        
        let imageTwo = UIImageView(frame: CGRect(x: view.frame.width, y: 485, width: 369, height: 332))
        imageTwo.center.x = view.center.x
        imageTwo.image = UIImage(named: "image_one")
        imageTwo.layer.cornerRadius = 20
        imageTwo.clipsToBounds = true
        self.view.addSubview(imageTwo)
        
        view.addSubview(nameLabel)
        view.addSubview(firstLabel)
        view.addSubview(oneLabel)
        view.addSubview(twoLabel)
        view.addSubview(threeLabel)
        view.addSubview(fourLabel)
        view.addSubview(fiveLabel)
        view.addSubview(sixLabel)
        view.addSubview(oneView)
        view.addSubview(twoView)
        view.addSubview(truView)
        view.addSubview(settBtn)
        oneView.addSubview(oneLabel)
        oneView.addSubview(fourLabel)
        twoView.addSubview(twoLabel)
        twoView.addSubview(fiveLabel)
        truView.addSubview(threeLabel)
        truView.addSubview(sixLabel)
    }
    
    func textLabel (text: String, xOffset: CGFloat) -> UILabel{
        
        let tLabel = UILabel()
        tLabel.frame = CGRect(x: xOffset, y: 290, width: view.frame.width - 50, height: 45)
        tLabel.text = text
        tLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        tLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        return tLabel
    }
    
    func groupLabel (text: String, yOffset: CGFloat, xOffset: CGFloat, weight: UIFont.Weight, fontSize: CGFloat) -> UILabel{
        
        let grLabel = UILabel()
        grLabel.frame.size = CGSize(width: 108, height: 50)
        grLabel.text = text
        grLabel.frame.origin.x = xOffset
        grLabel.frame.origin.y = yOffset
        grLabel.font = UIFont.systemFont(ofSize: fontSize, weight: weight)
        grLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        return grLabel
    }
    
    
    func newView (text: String, xOffset: CGFloat) -> UIView{
        
        let tView = UIView()
        tView.frame.size = CGSize(width: 109, height: 79)
        tView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        tView.frame.origin.y = 390
        tView.frame.origin.x = xOffset
        tView.layer.cornerRadius = 10
        tView.clipsToBounds = true
        
        return tView
    }
    
}
