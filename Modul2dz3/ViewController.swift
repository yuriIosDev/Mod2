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
            settBtn.translatesAutoresizingMaskIntoConstraints = false
            settBtn.heightAnchor.constraint(equalToConstant: 20).isActive = true
            settBtn.setTitle("Настройки", for: .normal)
            settBtn.setTitleColor(UIColor(red: 8/255, green: 92/255, blue: 255, alpha: 1), for: .normal)
            return settBtn
        }()
        
        lazy var btnAction = UIAction { _ in
            let svController = SetViewController()
            svController.deligate = self
            self.navigationController?.pushViewController(svController, animated: true)
        }
        
        lazy var nameLabel = textLabel (text: "Имя")
        lazy var firstLabel = textLabel (text: "Фамилия")
        
        lazy var oneLabel = groupLabel(text: "10", weight: .bold, fontSize: 20)
        lazy var twoLabel = groupLabel(text: "20", weight: .bold, fontSize: 20)
        lazy var threeLabel = groupLabel(text: "30", weight: .bold, fontSize: 20)
        lazy var fourLabel = groupLabel(text: "Друзья", weight: .regular, fontSize: 16)
        lazy var fiveLabel = groupLabel(text: "Подписок", weight: .regular, fontSize: 16)
        lazy var sixLabel = groupLabel(text: "Избранных", weight: .regular, fontSize: 16)
        
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
        
        lazy var horOneStack: UIStackView = {
            $0.axis = .horizontal
            $0.spacing = 10
            $0.alignment = .center
            $0.distribution = .fill
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.heightAnchor.constraint(equalToConstant: 45).isActive = true
            $0.addArrangedSubview(nameLabel)
            $0.addArrangedSubview(firstLabel)
            return $0
        }(UIStackView())
        
        lazy var horStack: UIStackView = {
            $0.axis = .horizontal
            $0.spacing = 20
            $0.alignment = .fill
            $0.distribution = .fillProportionally
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.heightAnchor.constraint(equalToConstant: 89).isActive = true
            $0.widthAnchor.constraint(equalToConstant: 109).isActive = true
            $0.addArrangedSubview(oneView)
            $0.addArrangedSubview(twoView)
            $0.addArrangedSubview(truView)
            return $0
        }(UIStackView())
        
        lazy var vertLabelOneStack: UIStackView = {
            $0.axis = .vertical
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.addArrangedSubview(oneLabel)
            $0.addArrangedSubview(fourLabel)
            return $0
        }(UIStackView())
        
        lazy var vertLabelTwoStack: UIStackView = {
            $0.axis = .vertical
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.addArrangedSubview(twoLabel)
            $0.addArrangedSubview(fiveLabel)
            return $0
        }(UIStackView())
        
        lazy var vertLabelFriStack: UIStackView = {
            $0.axis = .vertical
            $0.translatesAutoresizingMaskIntoConstraints = false
            $0.addArrangedSubview(threeLabel)
            $0.addArrangedSubview(sixLabel)
            return $0
        }(UIStackView())
        
        lazy var imTwo: UIImageView = {
            let imageTwo = UIImageView()
            imageTwo.translatesAutoresizingMaskIntoConstraints = false
            imageTwo.heightAnchor.constraint(equalToConstant: 332).isActive = true
            imageTwo.image = UIImage(named: "image_one")
            imageTwo.layer.cornerRadius = 20
            imageTwo.clipsToBounds = true
            return imageTwo
        }()
        
        
        override func viewDidLoad() {
            super.viewDidLoad()
            view.backgroundColor = .white
            
            title = "Профиль"
            navigationController?.navigationBar.prefersLargeTitles = true
            
            view.addSubview(imOne)
            view.addSubview(horOneStack)
            view.addSubview(settBtn)
            view.addSubview(horStack)
            oneView.addSubview(vertLabelOneStack)
            twoView.addSubview(vertLabelTwoStack)
            truView.addSubview(vertLabelFriStack)
            view.addSubview(imTwo)
            
            NSLayoutConstraint.activate([
                
                imOne.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                imOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50),
                horOneStack.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                horOneStack.topAnchor.constraint(equalTo: imOne.bottomAnchor, constant: 10),
                settBtn.topAnchor.constraint(equalTo: horOneStack.bottomAnchor, constant: 0),
                settBtn.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                horStack.topAnchor.constraint(equalTo: settBtn.bottomAnchor, constant: 35),
                horStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                horStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                imTwo.topAnchor.constraint(equalTo: horStack.bottomAnchor, constant: 10),
                imTwo.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
                imTwo.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
                imTwo.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -30),
                vertLabelOneStack.topAnchor.constraint(equalTo: oneView.topAnchor, constant: 20),
                vertLabelOneStack.leadingAnchor.constraint(equalTo: oneView.leadingAnchor, constant: 10),
                vertLabelTwoStack.topAnchor.constraint(equalTo: twoView.topAnchor, constant: 20),
                vertLabelTwoStack.leadingAnchor.constraint(equalTo: twoView.leadingAnchor, constant: 10),
                vertLabelFriStack.topAnchor.constraint(equalTo: truView.topAnchor, constant: 20),
                vertLabelFriStack.leadingAnchor.constraint(equalTo: truView.leadingAnchor, constant: 10),
                
            ])
            
        }
        
        func textLabel (text: String) -> UILabel{
            
            let tLabel = UILabel()
            tLabel.text = text
            tLabel.translatesAutoresizingMaskIntoConstraints = false
            tLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            tLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
            return tLabel
        }
        
        func groupLabel (text: String, weight: UIFont.Weight, fontSize: CGFloat) -> UILabel{
            
            let grLabel = UILabel()
            grLabel.text = text
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
