//
//  SlideHorizCell.swift
//  Modul2dz3
//
//  Created by Юрий Кузнецов on 11.02.2024.
//

import UIKit

class SlideHorizCell: UICollectionViewCell {
    
    static let reuseId = "SlideHorizCell"
    
    lazy var imageView: UIImageView = {
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        return $0
    }(UIImageView(frame: bounds))
    
    lazy var titleLabel: UILabel = {
        $0.textColor = .blue
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.font = UIFont.boldSystemFont(ofSize: 20)
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    lazy var entryBtn: UIButton = UIButton()
    lazy var nameTextField = newTextField(text: "Имя")
    lazy var firstTextField = newTextField(text: "Фамилия")
    
    lazy var centerView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 264).isActive = true
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        $0.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        return $0
    }(UIView())
    
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
    
    lazy var btn: UIButton = {
        $0.backgroundColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        $0.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
        $0.setTitle("Сохранить", for: .normal)
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.heightAnchor.constraint(equalToConstant: 50).isActive = true
        $0.layer.cornerRadius = 25
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        return $0
    }(UIButton())
    
        override func prepareForReuse() {
                centerView.removeFromSuperview()
                imageView.image = nil
            }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(imageView)
        addSubview(titleLabel)
        
        
        NSLayoutConstraint.activate([
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.bottomAnchor.constraint(equalTo: bottomAnchor),
            
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 100),
            
        ])
    }
    
    
    func newTextField(text: String) -> UITextField {
        let offsetview = UIView(frame: CGRect(x: 0, y: 0, width: 20, height: 50))
        let textField = UITextField()

    textField.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
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
    
    func setImageView(image: String){
            imageView.image = UIImage(named: image)
        }
    
    func configCell(item: SlideItemModel){
        imageView.image = UIImage(named: item.image)
        titleLabel.text = item.title
        titleLabel.textColor = item.color
    }
    func addCenter (){
        addSubview(centerView)
        centerView.addSubview(generalStack)
        
        NSLayoutConstraint.activate([
            centerView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            centerView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            centerView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 330),
            
            generalStack.leadingAnchor.constraint(equalTo: centerView.leadingAnchor, constant: 20),
            generalStack.trailingAnchor.constraint(equalTo: centerView.trailingAnchor, constant: -20),
            generalStack.bottomAnchor.constraint(equalTo: centerView.bottomAnchor, constant: -40)
        ])
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
