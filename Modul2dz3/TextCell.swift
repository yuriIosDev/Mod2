//
//  TextCell.swift
//  Modul2dz3
//
//  Created by Юрий Кузнецов on 07.02.2024.
//

import UIKit

class TextCell: UITableViewCell {

    static let reuseId = "TextCell"
    
    lazy var cellView: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.backgroundColor = UIColor(red: 237/255, green: 237/255, blue: 237/255, alpha: 1)
        $0.layer.cornerRadius = 20
        $0.addSubview(cellText)
        $0.addSubview(cellImageView)
        $0.addSubview(titleLabel)
        return $0
    }(UIView())
    
    lazy var cellText: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0 
        return $0
    }(UILabel())
    
    lazy var cellImageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.contentMode = .scaleToFill
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    lazy var titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 1
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return $0
    }(UILabel())
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(cellView)
        setConstraints()
    }
    
    private func setConstraints(){
        NSLayoutConstraint.activate([
            
            cellView.topAnchor.constraint(equalTo: topAnchor, constant: 10),
            cellView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            cellView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            cellView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -10),
            
            cellImageView.topAnchor.constraint(equalTo: cellView.topAnchor, constant: 10),
            cellImageView.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 10),
            cellImageView.widthAnchor.constraint(equalTo: cellView.widthAnchor, constant: -20),
            cellImageView.heightAnchor.constraint(equalToConstant: 300),
            
            titleLabel.topAnchor.constraint(equalTo: cellImageView.bottomAnchor, constant: 15),
            titleLabel.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),

            cellText.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10),
            cellText.leadingAnchor.constraint(equalTo: cellView.leadingAnchor, constant: 20),
            cellText.trailingAnchor.constraint(equalTo: cellView.trailingAnchor, constant: -20),
            cellText.bottomAnchor.constraint(equalTo: cellView.bottomAnchor, constant: -10),
         ])
    }
    
    func setupcell(title: String, text: String, image: UIImage?) {
          titleLabel.text = title
          cellText.text = text
          cellImageView.image = image
      }
      
    required init?(coder: NSCoder) {
          fatalError("init(coder:) has not been implemented")
      }
  }
