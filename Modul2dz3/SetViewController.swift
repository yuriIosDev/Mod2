//
//  SetViewController.swift
//  Modul2dz3
//
//  Created by Юрий Кузнецов on 27.01.2024.
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
        vie.translatesAutoresizingMaskIntoConstraints = false
        vie.heightAnchor.constraint(equalToConstant: 264).isActive = true
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
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 180).isActive = true
        $0.addArrangedSubview(vertStack)
        $0.addArrangedSubview(btn)
        return $0
    }(UIStackView())

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Настройки"

        view.addSubview(centerView)
        centerView.addSubview(generalStack)
        view.addSubview(textLabel)
        

        NSLayoutConstraint.activate([
            
            centerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            centerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            centerView.topAnchor.constraint(equalTo: textLabel.bottomAnchor, constant: 100),
            textLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 80),
            textLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            generalStack.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 20),
            generalStack.trailingAnchor.constraint(equalTo: centerView.trailingAnchor, constant: -20),
            generalStack.topAnchor.constraint(equalTo: centerView.topAnchor, constant: 40)
        ])

        textLabel.translatesAutoresizingMaskIntoConstraints = false
        textLabel.heightAnchor.constraint(equalToConstant: 40).isActive = true
        textLabel.text = "Введите новые данные"
        textLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        textLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        textLabel.numberOfLines = 0
        
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
