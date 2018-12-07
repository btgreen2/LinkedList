//
//  NodeCollectionViewCell.swift
//  Linked List
//
//  Created by Brian Green on 12/6/18.
//  Copyright © 2018 Brian Green. All rights reserved.
//

import UIKit

class NodeCollectionViewCell: UICollectionViewCell {
    
    private let memoryAddress : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        return label
    }()
    
    private let value : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        return label
    }()
    
    private let nextAddress : UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        label.adjustsFontSizeToFitWidth = true
        label.minimumScaleFactor = 0.1
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupLayout(){
        contentView.addSubview(memoryAddress)
        memoryAddress.translatesAutoresizingMaskIntoConstraints = false
        memoryAddress.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor).isActive = true
        memoryAddress.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        memoryAddress.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        memoryAddress.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1).isActive = true
        
        contentView.addSubview(value)
        value.translatesAutoresizingMaskIntoConstraints = false
        value.topAnchor.constraint(equalTo: memoryAddress.safeAreaLayoutGuide.bottomAnchor).isActive = true
        value.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        value.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        value.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.4).isActive = true
        
        contentView.addSubview(nextAddress)
        nextAddress.translatesAutoresizingMaskIntoConstraints = false
        nextAddress.topAnchor.constraint(equalTo: value.safeAreaLayoutGuide.bottomAnchor).isActive = true
        nextAddress.leadingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.leadingAnchor).isActive = true
        nextAddress.trailingAnchor.constraint(equalTo: contentView.layoutMarginsGuide.trailingAnchor).isActive = true
        nextAddress.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.1).isActive = true
        
    }
    
    func setValue(int : Int){
        value.text = "value: \(int.description)"
    }
    
    func setAddress(address : String){
        memoryAddress.text = "address: \(address)"
    }
    
    func setNextAddress(address : String){
        nextAddress.text = "next: \(address)"
    }

    
}
