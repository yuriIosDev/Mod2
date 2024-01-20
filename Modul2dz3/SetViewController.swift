//
//  SetViewController.swift
//  Modul2dz3
//
//  Created by Юрий Кузнецов on 19.01.2024.
//

import UIKit

class SetViewController: UIViewController {
    
    
    var entryBtn: UIButton = UIButton()
    var textLabel: UILabel = UILabel()
    lazy var nameTextField = newTextField (text: "Имя", yOffset: 40)
    lazy var firstTextField = newTextField (text: "Фамилия", yOffset: 100)
    var deligate: ViewControllerDelegate?
    
    lazy var centerView: UIView = {
        let vie = UIView()
        vie.frame.size = CGSize(width: view.frame.width - 52, height: 264)
        vie.center = view.center
        vie.layer.cornerRadius = 20
        vie.clipsToBounds = true
        vie.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        return vie
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Настройки"
        
        view.addSubview(nameTextField)
        view.addSubview(firstTextField)
        view.addSubview(btn)
        view.addSubview(centerView)
        centerView.addSubview(nameTextField)
        centerView.addSubview(firstTextField)
        centerView.addSubview(btn)
        
        
        textLabel.frame = CGRect(x: 31, y: 186, width: centerView.frame.width - 33, height: 50)
        textLabel.text = "Введите новые данные"
        textLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        textLabel.numberOfLines = 0
        view.addSubview(textLabel)
        
        
    }
    
    func newTextField (text: String, yOffset: CGFloat) -> UITextField{
        let offsetview = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        let textField = UITextField()
        textField.frame.size = CGSize(width: centerView.frame.width - 20, height: 50)
        textField.frame.origin.x = 10
        textField.frame.origin.y = yOffset
        textField.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        textField.placeholder = text
        textField.textColor = UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)
        textField.layer.cornerRadius = 30
        textField.clipsToBounds = true
        textField.leftView = offsetview
        textField.leftViewMode = .always
        return textField
    }
    
    lazy var btn: UIButton = {
        let entryBtn = UIButton(primaryAction: backBtnAction)
        entryBtn.frame.size = CGSize(width: centerView.frame.width - 20, height: 50)
        entryBtn.frame.origin.x = 10
        entryBtn.frame.origin.y = centerView.frame.height - 90
        entryBtn.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        entryBtn.tintColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        entryBtn.setTitle("Сохранить", for: .normal)
        entryBtn.layer.cornerRadius = 25
        entryBtn.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return entryBtn
    }()
    
    lazy var backBtnAction = UIAction { _ in
        let nameLabel = self.nameTextField.text ?? "  "
        let firstLabel = self.firstTextField.text ?? ""
        self.deligate?.newTextLabel(nameLabel: nameLabel, firstLabel: firstLabel)
        self.navigationController?.popViewController(animated: true)
        
        
        
        
    }

        
}
