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
    
    lazy var oneView = newView (text: "one")
    lazy var twoView = newView (text: "two")
    lazy var truView = newView (text: "tru")
    
    lazy var imOne: UIImageView = {
        let imageOne = UIImageView()
        imageOne.image = UIImage(named: "image_one")
        imageOne.translatesAutoresizingMaskIntoConstraints = false
        imageOne.heightAnchor.constraint(equalToConstant: 100).isActive = true
        imageOne.widthAnchor.constraint(equalToConstant: 100).isActive = true
        imageOne.layer.cornerRadius = 50
        imageOne.clipsToBounds = true
        return imageOne
    }()
    
    lazy var imTwo: UIImageView = {
        let imageTwo = UIImageView()
        imageTwo.frame = CGRect(x: view.frame.width, y: horStack.frame.origin.y + 100, width: 369, height: 332)
        imageTwo.center.x = view.center.x
        imageTwo.image = UIImage(named: "image_one")
        imageTwo.layer.cornerRadius = 20
        imageTwo.clipsToBounds = true
        return imageTwo
    }()
    
    lazy var horStack: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 20
        $0.alignment = .fill
        $0.distribution = .fillProportionally
        $0.addArrangedSubview(oneView)
        $0.addArrangedSubview(twoView)
        $0.addArrangedSubview(truView)
        return $0
    }(UIStackView(frame: CGRect(x: 15, y: generalOneStack.frame.origin.y + 195, width: view.bounds.width - 30, height: 80)))
    
    lazy var horOneStack: UIStackView = {
        $0.axis = .horizontal
        $0.spacing = 10
        $0.distribution = .equalCentering
        $0.addArrangedSubview(nameLabel)
        $0.addArrangedSubview(firstLabel)
        return $0
    }(UIStackView())
    
    lazy var generalOneStack: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 20
        $0.alignment = .center
        $0.addArrangedSubview(imOne)
        $0.addArrangedSubview(horOneStack)
        $0.addArrangedSubview(settBtn)
        return $0
    }(UIStackView(frame: CGRect(x: 0, y: 175, width: view.frame.width, height: 170)))
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Профиль"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        view.addSubview(generalOneStack)
        view.addSubview(horStack)
        view.addSubview(imTwo)
        view.addSubview(oneLabel)
        view.addSubview(twoLabel)
        view.addSubview(threeLabel)
        view.addSubview(fourLabel)
        view.addSubview(fiveLabel)
        view.addSubview(sixLabel)
        oneView.addSubview(oneLabel)
        oneView.addSubview(fourLabel)
        twoView.addSubview(twoLabel)
        twoView.addSubview(fiveLabel)
        truView.addSubview(threeLabel)
        truView.addSubview(sixLabel)
    }
    
    func textLabel (text: String, xOffset: CGFloat) -> UILabel{
        
        let tLabel = UILabel()
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
    
    
    func newView (text: String) -> UIView{
        
        let tView = UIView()
        tView.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        tView.layer.cornerRadius = 10
        tView.clipsToBounds = true
        
        return tView
    }
    
    
    
}
