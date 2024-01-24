//
//  SetViewController.swift
//  Modul2dz3
//
//  Created by Юрий Кузнецов on 21.01.2024.
//

import UIKit

class SetViewController: UIViewController {
    var entryBtn: UIButton = UIButton()
    var textLabel: UILabel = UILabel()
    lazy var nameTextField = newTextField (text: "Имя")
    lazy var firstTextField = newTextField (text: "Фамилия")
    var deligate: ViewControllerDelegate?

    lazy var centerView: UIView = {
        let vie = UIView()
        vie.frame = CGRect(x: 26, y: textLabel.frame.origin.y + 300, width: view.frame.width - 52, height: 264)
        vie.layer.cornerRadius = 20
        vie.clipsToBounds = true
        vie.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        return vie
    }()
    
    lazy var vertStack: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 10
        $0.addArrangedSubview(nameTextField)
        $0.addArrangedSubview(firstTextField)
        return $0
    }(UIStackView())
    
    lazy var generalStack: UIStackView = {
        $0.axis = .vertical
        $0.spacing = 10
        $0.distribution = .equalCentering
        $0.addArrangedSubview(vertStack)
        $0.addArrangedSubview(btn)
        return $0
    }(UIStackView(frame: CGRect(x: 26, y: 35, width: centerView.frame.width - 52, height: 180)))

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Настройки"

        view.addSubview(centerView)
        centerView.addSubview(generalStack)


        textLabel.frame = CGRect(x: 31, y: 186, width: centerView.frame.width - 33, height: 50)
        textLabel.text = "Введите новые данные"
        textLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        textLabel.numberOfLines = 0
        view.addSubview(textLabel)
    }

    func newTextField (text: String) -> UITextField{
        let offsetview = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        let textField = UITextField()
        textField.backgroundColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        textField.placeholder = text
        textField.textColor = UIColor(red: 164/255, green: 164/255, blue: 164/255, alpha: 1)
        textField.translatesAutoresizingMaskIntoConstraints = false
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
        textField.layer.cornerRadius = 25
        textField.clipsToBounds = true
        textField.leftView = offsetview
        textField.leftViewMode = .always
        return textField
    }

    lazy var btn: UIButton = {
        let entryBtn = UIButton(primaryAction: backBtnAction)
        entryBtn.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        entryBtn.tintColor = UIColor(red: 255, green: 255, blue: 255, alpha: 1)
        entryBtn.setTitle("Сохранить", for: .normal)
        entryBtn.translatesAutoresizingMaskIntoConstraints = false
        entryBtn.heightAnchor.constraint(equalToConstant: 50).isActive = true
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
