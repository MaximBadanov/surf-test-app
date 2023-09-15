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
		label.font = UIFont.systemFont(ofSize: 14)
		label.textAlignment = .center
		label.contentMode = .scaleAspectFit
		return label
	}()
	
	 lazy var deleteImage: UIImageView = {
		let image = UIImageView()
		image.image = UIImage(named: "delete")
		return image
	}()
	
	private lazy var stack: UIStackView = {
		let stack = UIStackView()
		stack.axis = .horizontal
		stack.alignment = .center
		stack.distribution = .fill
		stack.spacing = 20
		stack.addArrangedSubview(labelText)
		stack.addArrangedSubview(deleteImage)
		return stack
	}()
	
	private func setupConstraints() {
		stack.translatesAutoresizingMaskIntoConstraints = false
		NSLayoutConstraint.activate([
			stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 24),
			stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -24),
			stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 12),
			stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -12),
		])
	}
	
	func configure(_ label: String) {
		labelText.text = label
		deleteImage.isHidden = false
		contentView.addSubview(stack)
		contentView.backgroundColor = UIColor(red: 0.953, green: 0.953, blue: 0.961, alpha: 1)
		contentView.clipsToBounds = true
		contentView.layer.cornerRadius = 12
		setupConstraints()
	}
	
}
