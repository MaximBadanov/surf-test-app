//
//  CollectionViewCell.swift
//  profileTestApp
//
//  Created by Максим Баданов on 01.08.2023.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
	
	private lazy var labelText: UILabel = {
		let label = UILabel()
		label.textAlignment = .center
		label.contentMode = .scaleToFill
		label.font = .systemFont(ofSize: 14)

		return label
	}()
	
	
	private func setupConstraints() {
		labelText.translatesAutoresizingMaskIntoConstraints = false
		labelText.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
		labelText.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
		labelText.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
		labelText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true

	}
	
	func configure(_ label: String) {
		labelText.text = label
		contentView.addSubview(labelText)
		contentView.backgroundColor = UIColor(red: 0.953, green: 0.953, blue: 0.961, alpha: 1)
		contentView.clipsToBounds = true
		contentView.layer.cornerRadius = 12
		setupConstraints()
	}
	
}
