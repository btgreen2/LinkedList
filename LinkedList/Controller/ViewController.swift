//
//  ViewController.swift
//  Linked List
//
//  Created by Brian Green on 12/6/18.
//  Copyright © 2018 Brian Green. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate let nodeCell = "nodeCell"
    
    private let linkedList = LinkedList()
    
    let titleLabel : UILabel = {
        let label = UILabel()
        label.text = "Linked List"
        label.textAlignment = .center
        label.font = UIFont.boldSystemFont(ofSize: 30)
        label.minimumScaleFactor = 0.1
        label.adjustsFontSizeToFitWidth = true
        return label
    }()
    
    let addButton : UIButton = {
        let button = UIButton()
        button.setTitle("Add", for: .normal)
        button.backgroundColor = .green
        return button
    }()
    
    let deleteButton : UIButton = {
        let button = UIButton()
        button.setTitle("Delete", for: .normal)
        button.backgroundColor = .red
        return button
    }()
    
    let orderedButton : UIButton = {
        let button = UIButton()
        button.setTitle("Order", for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.backgroundColor = .blue
        return button
    }()
    
    let addTextField : UITextField = {
        let field = UITextField()
        field.placeholder = "Add node by value."
        field.keyboardType = .numberPad
        return field
    }()
    
    let deleteTextField : UITextField = {
        let field = UITextField()
        field.placeholder = "Delete the node by value."
        field.keyboardType = .numberPad
        return field
    }()
    
    let orderedField : UITextField = {
        let field = UITextField()
        field.placeholder = "Insert node in order."
        field.keyboardType = .numberPad
        return field
    }()
    
    let collectionView : UICollectionView = {
        let flow = UICollectionViewFlowLayout()
        flow.scrollDirection = .horizontal
        flow.minimumLineSpacing = 0
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flow)
        collection.isPagingEnabled = true
        collection.backgroundColor = .white
        return collection
    }()
    
    @objc func hideKeyboard(){
        view.endEditing(true)
    }
    
    @objc func addNode(){
        if let number = Int(addTextField.text ?? ""){
            linkedList.insert(number)
            collectionView.reloadData()
        }
    }
    
    @objc func deleteNode(){
        if let number = Int(deleteTextField.text ?? ""){
            linkedList.delete(value: number)
            collectionView.reloadData()
        }
    }
    
    @objc func insertInOrder(){
        if let number = Int(orderedField.text ?? ""){
            linkedList.insertInOrder(number)
            collectionView.reloadData()
        }
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        addButton.layer.cornerRadius = addButton.frame.width / 2
        deleteButton.layer.cornerRadius = deleteButton.frame.width / 2
        orderedButton.layer.cornerRadius = orderedButton.frame.width / 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCollectionView()
        setupButtons()
        setupLayout()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    func setupCollectionView(){
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(NodeCollectionViewCell.self, forCellWithReuseIdentifier: nodeCell)
    }
    
    func setupButtons(){
        addButton.addTarget(self, action: #selector(addNode), for: .touchUpInside)
        deleteButton.addTarget(self, action: #selector(deleteNode), for: .touchUpInside)
        orderedButton.addTarget(self, action: #selector(insertInOrder), for: .touchUpInside)
    }
    
    func setupLayout(){
        view.addSubview(titleLabel)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.15).isActive = true
        
        view.addSubview(addButton)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        addButton.topAnchor.constraint(equalTo: titleLabel.safeAreaLayoutGuide.bottomAnchor).isActive = true
        addButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2).isActive = true
        addButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2).isActive = true
        
        view.addSubview(addTextField)
        addTextField.translatesAutoresizingMaskIntoConstraints = false
        addTextField.firstBaselineAnchor.constraint(equalTo: addButton.firstBaselineAnchor).isActive = true
        addTextField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        addTextField.trailingAnchor.constraint(equalTo: addButton.layoutMarginsGuide.leadingAnchor).isActive = true
        addTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        view.addSubview(deleteButton)
        deleteButton.translatesAutoresizingMaskIntoConstraints = false
        deleteButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        deleteButton.topAnchor.constraint(equalTo: addButton.safeAreaLayoutGuide.bottomAnchor, constant: 8).isActive = true
        deleteButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2).isActive = true
        deleteButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2).isActive = true
        
        view.addSubview(deleteTextField)
        deleteTextField.translatesAutoresizingMaskIntoConstraints = false
        deleteTextField.firstBaselineAnchor.constraint(equalTo: deleteButton.firstBaselineAnchor).isActive = true
        deleteTextField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        deleteTextField.trailingAnchor.constraint(equalTo: deleteButton.layoutMarginsGuide.leadingAnchor).isActive = true
        deleteTextField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        view.addSubview(orderedButton)
        orderedButton.translatesAutoresizingMaskIntoConstraints = false
        orderedButton.trailingAnchor.constraint(equalTo: view.layoutMarginsGuide.trailingAnchor).isActive = true
        orderedButton.topAnchor.constraint(equalTo: deleteButton.safeAreaLayoutGuide.bottomAnchor, constant: 8).isActive = true
        orderedButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2).isActive = true
        orderedButton.heightAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.2).isActive = true
        
        view.addSubview(orderedField)
        orderedField.translatesAutoresizingMaskIntoConstraints = false
        orderedField.firstBaselineAnchor.constraint(equalTo: orderedButton.firstBaselineAnchor).isActive = true
        orderedField.leadingAnchor.constraint(equalTo: view.layoutMarginsGuide.leadingAnchor).isActive = true
        orderedField.trailingAnchor.constraint(equalTo: orderedButton.layoutMarginsGuide.leadingAnchor).isActive = true
        orderedField.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.1).isActive = true
        
        view.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        collectionView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.4).isActive  = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return linkedList.getCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: nodeCell, for: indexPath) as! NodeCollectionViewCell
    
        if let node = linkedList.nodeAt(indexPath.section){
            cell.setAddress(address: Unmanaged.passUnretained(node).toOpaque().debugDescription)
            cell.setValue(int: node.value)
        }
        
        if let nextNode = linkedList.nodeAt(indexPath.section)?.next{
            cell.setNextAddress(address: Unmanaged.passUnretained(nextNode).toOpaque().debugDescription)
        } else{
            cell.setNextAddress(address: "nil")
        }
    
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.frame.size.width
        let height = collectionView.frame.size.height
        return CGSize(width: width, height: height)
    }
    
    
}
