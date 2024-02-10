//
//  ViewController.swift
//  Modul2dz3
//
//  Created by Юрий Кузнецов on 17.01.2024.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {
    
    var originalText: String = "" // Переменная для хранения исходного текста
    var shortText: Substring = "" // Переменная для хранения короткой подстроки
    
    lazy var titleLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        $0.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        return $0
    }(UILabel())
    
    lazy var imageView: UIImageView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.layer.cornerRadius = 20
        $0.clipsToBounds = true
        return $0
    }(UIImageView())
    
    
    lazy var descriptionLabel: UILabel = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.numberOfLines = 0
        return $0
    }(UILabel())
    
    lazy var scrollView: UIScrollView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        $0.addSubview(scrollViewContent)
        $0.contentInsetAdjustmentBehavior = .never
        $0.delegate = self
        return $0
    }(UIScrollView())
    
    lazy var scrollViewContent: UIView = {
        $0.translatesAutoresizingMaskIntoConstraints = false
        
        $0.addSubview(titleLabel)
        $0.addSubview(imageView)
        $0.addSubview(descriptionLabel)
        
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 20),
            titleLabel.leadingAnchor.constraint(equalTo: $0.leadingAnchor, constant: 20),
            titleLabel.trailingAnchor.constraint(equalTo: $0.trailingAnchor, constant: -20),
            
            imageView.topAnchor.constraint(equalTo: $0.safeAreaLayoutGuide.topAnchor, constant: 20),
            imageView.leadingAnchor.constraint(equalTo: $0.leadingAnchor, constant: 20),
            imageView.trailingAnchor.constraint(equalTo: $0.trailingAnchor, constant: -20),
            imageView.heightAnchor.constraint(equalToConstant: 300),
            
            descriptionLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            descriptionLabel.leadingAnchor.constraint(equalTo: $0.leadingAnchor, constant: 20),
            descriptionLabel.trailingAnchor.constraint(equalTo: $0.trailingAnchor, constant: -20),
            descriptionLabel.bottomAnchor.constraint(equalTo: $0.safeAreaLayoutGuide.bottomAnchor, constant: -30)
        ])
        return $0
    }(UIView())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(scrollView)
        
        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            
            scrollViewContent.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            scrollViewContent.topAnchor.constraint(equalTo: scrollView.topAnchor),
            scrollViewContent.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            scrollViewContent.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            scrollViewContent.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
}
