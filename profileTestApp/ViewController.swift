import UIKit


class ViewController: UIViewController {
	
	var arrayOfSkills = ["Basics of Swift", "Basics of Python" , "UIkit",
						 "XCode","Многопоточность", "MVC","CoreData",
						 "UX/UI","King of antipatterns","OOP",  "iOSNubbie", "Singletone",
						 "Prototype", "Delegation"]
	
	private lazy var topPartOfScreen: UIView = {
		let topPart = UIView()
		topPart.backgroundColor = UIColor(red: 0.953, green: 0.953, blue: 0.961, alpha: 1)
		return topPart
	}()
	
	private lazy var photo: UIImageView = {
		let photo = UIImageView()
		photo.backgroundColor = .gray
		photo.image = UIImage(named: ProfileModel.pofile.imageName)
		photo.layer.cornerRadius = 60
		photo.clipsToBounds = true
		photo.contentMode = .scaleAspectFit
		return photo
	}()
	
	private lazy var name: UILabel = {
		let name = UILabel()
		name.text = ProfileModel.pofile.name
		name.numberOfLines = 2
		name.textAlignment = .center
		name.font = .systemFont(ofSize: 24, weight: .bold)
		return name
	}()
	
	private lazy var position: UILabel = {
		let position = UILabel()
		position.text = ProfileModel.pofile.description
		position.textAlignment = .center
		position.font = .systemFont(ofSize: 14, weight: .medium)
		position.textColor = UIColor(red: 0.588, green: 0.584, blue: 0.608, alpha: 1)
		return position
	}()
	
	private lazy var dot: UIImageView = {
		let dot = UIImageView()
		dot.image = UIImage(named: "dot")
		dot.frame = CGRect(x: 0, y: 0, width: 16, height: 16)
		return dot
	}()
	
	private lazy var city: UILabel = {
		let city = UILabel()
		city.text = ProfileModel.pofile.place
		city.font = .systemFont(ofSize: 14, weight: .medium)
		city.textColor = UIColor(red: 0.588, green: 0.584, blue: 0.608, alpha: 1)
		return city
	}()
	
	private lazy var locationStack: UIStackView = {
		let stack = UIStackView()
		stack.axis = .horizontal
		stack.addArrangedSubview(dot)
		stack.addArrangedSubview(city)
		stack.distribution = .fillProportionally
		return stack
	}()
	
	private lazy var aboutMe: UILabel = {
		let aboutMe = UILabel()
		aboutMe.text = ProfileModel.pofile.about
		aboutMe.textAlignment = .left
		aboutMe.numberOfLines = 2
		aboutMe.font = .systemFont(ofSize: 14)
		return aboutMe
	}()
	
	private lazy var about: UILabel = {
		let about = UILabel()
		about.text = "О себе"
		about.font = .systemFont(ofSize: 16, weight: .medium)
		about.textAlignment = .left
		return about
	}()
	
	private lazy var mySkills: UILabel = {
		let mySkills = UILabel()
		mySkills.text = "Мои навыки"
		mySkills.font = .systemFont(ofSize: 16, weight: .medium)
		mySkills.textAlignment = .left
		return mySkills
	}()
	
	private lazy var collection: UICollectionView = {
		let collection = UICollectionView(frame: .zero,
										  collectionViewLayout: makeLayout())
		return collection
	}()
	
	private func makeLayout() -> UICollectionViewLayout {
		UICollectionViewCompositionalLayout { sectionIndex, env in
			let itemSize = NSCollectionLayoutSize(widthDimension: .estimated(60), heightDimension: .fractionalHeight(1.0))
			let item = NSCollectionLayoutItem(layoutSize: itemSize)

			let groupSize = NSCollectionLayoutSize(widthDimension: .fractionalWidth(1.0), heightDimension: .absolute(56))
			let group = NSCollectionLayoutGroup.horizontal(layoutSize: groupSize, subitems: [item])
			group.contentInsets = .init(top: 12, leading: 0, bottom: 0, trailing: 0)
			group.interItemSpacing = .fixed(12)

			let section = NSCollectionLayoutSection(group: group)
			return section
		}
	}
	
	private lazy var addButton: UIButton = {
		var button = UIButton()
		button.setImage(UIImage(named: "add"), for: .normal)
		button.addTarget(self, action: #selector(editingSkills), for: .touchUpInside)
		return button
	}()
	
	
	func setupUI() {
		
		topPartOfScreen.translatesAutoresizingMaskIntoConstraints = false
		photo.translatesAutoresizingMaskIntoConstraints = false
		name.translatesAutoresizingMaskIntoConstraints = false
		position.translatesAutoresizingMaskIntoConstraints = false
		locationStack.translatesAutoresizingMaskIntoConstraints = false
		aboutMe.translatesAutoresizingMaskIntoConstraints = false
		about.translatesAutoresizingMaskIntoConstraints = false
		mySkills.translatesAutoresizingMaskIntoConstraints = false
		collection.translatesAutoresizingMaskIntoConstraints = false
		addButton.translatesAutoresizingMaskIntoConstraints = false
		
		view.addSubview(topPartOfScreen)
		view.addSubview(aboutMe)
		view.addSubview(about)
		view.addSubview(mySkills)
		view.addSubview(collection)
		view.addSubview(addButton)

		
		topPartOfScreen.addSubview(photo)
		topPartOfScreen.addSubview(name)
		topPartOfScreen.addSubview(position)
		topPartOfScreen.addSubview(locationStack)
		
		NSLayoutConstraint.activate([
		topPartOfScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor),
		topPartOfScreen.topAnchor.constraint(equalTo: view.topAnchor),
		topPartOfScreen.widthAnchor.constraint(equalTo: view.widthAnchor),
		topPartOfScreen.heightAnchor.constraint(equalToConstant: 387),
		
		photo.centerXAnchor.constraint(equalTo: topPartOfScreen.centerXAnchor),
		photo.widthAnchor.constraint(equalToConstant: 120),
		photo.heightAnchor.constraint(equalToConstant: 120),
		photo.bottomAnchor.constraint(equalTo: topPartOfScreen.bottomAnchor, constant: -143),
		
		
		name.leadingAnchor.constraint(equalTo: topPartOfScreen.leadingAnchor, constant: 60),
		name.trailingAnchor.constraint(equalTo: topPartOfScreen.trailingAnchor, constant: -60),
		name.heightAnchor.constraint(equalToConstant: 64),
		name.bottomAnchor.constraint(equalTo: topPartOfScreen.bottomAnchor, constant: -63),
		
		position.leadingAnchor.constraint(equalTo: topPartOfScreen.leadingAnchor, constant: 51),
		position.trailingAnchor.constraint(equalTo: topPartOfScreen.trailingAnchor, constant: -51),
		position.heightAnchor.constraint(equalToConstant: 20),
		position.bottomAnchor.constraint(equalTo: topPartOfScreen.bottomAnchor, constant: -39),
		
		
		locationStack.leadingAnchor.constraint(equalTo: topPartOfScreen.leadingAnchor, constant: 120),
		locationStack.trailingAnchor.constraint(equalTo: topPartOfScreen.trailingAnchor, constant: -120),
		locationStack.heightAnchor.constraint(equalToConstant: 20),
		locationStack.bottomAnchor.constraint(equalTo: topPartOfScreen.bottomAnchor, constant: -19),
		
		aboutMe.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
		aboutMe.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
		aboutMe.heightAnchor.constraint(equalToConstant: 40),
		aboutMe.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60),
		
		about.leadingAnchor.constraint(equalTo: aboutMe.leadingAnchor),
		about.heightAnchor.constraint(equalToConstant: 20),
		about.widthAnchor.constraint(equalToConstant: 70),
		about.bottomAnchor.constraint(equalTo: aboutMe.topAnchor),
		
		mySkills.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
		mySkills.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 48),
		mySkills.heightAnchor.constraint(equalToConstant: 20),
		mySkills.topAnchor.constraint(equalTo: topPartOfScreen.bottomAnchor, constant: 21),
		
		collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16),
		collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
		collection.topAnchor.constraint(equalTo: mySkills.bottomAnchor, constant: 20),
		collection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -152),
		
		addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16),
		addButton.heightAnchor.constraint(equalToConstant: 24),
		addButton.bottomAnchor.constraint(equalTo: mySkills.bottomAnchor)
		])
	}

	@objc func editingSkills() {
		arrayOfSkills.append("+")
		addButton.setImage(UIImage(named: "check"), for: .normal)
		collection.reloadData()
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .white
		self.title = "Профиль"
		setupUI()
		collection.register(CollectionViewCell.self, forCellWithReuseIdentifier: "cell")
		collection.dataSource = self
		collection.delegate = self
	}
	
}

extension ViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		arrayOfSkills.count
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collection.dequeueReusableCell(withReuseIdentifier: "cell",
												  for: indexPath) as! CollectionViewCell
		cell.configure(arrayOfSkills[indexPath.row])
		
		return cell
	}
	
}

extension ViewController: UICollectionViewDelegate {
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		
		for item in arrayOfSkills[indexPath.row] {
			if item == "+" {
				
				let alert = UIAlertController(title: "Добавление навыка",
											  message: "Введите название навыка, которым вы владеете",
											  preferredStyle: .alert)
				alert.addTextField(configurationHandler: { textField in
					textField.placeholder = "Введите навык"
				})
				let cancelAction = UIAlertAction(title: "Закрыть", style: .cancel) { _ in
					self.arrayOfSkills.remove(at: self.arrayOfSkills.count - 1)
					self.addButton.setImage(UIImage(named: "add"), for: .selected)
					self.collection.reloadData()
				}
				alert.addAction(cancelAction)
					
				let saveAction = UIAlertAction(title: "Cохранить", style: .default) { _ in
					guard let newSkill = alert.textFields?[0].text else {
						return
					}
					let skill = newSkill
					self.arrayOfSkills.append(skill)
					for i in self.arrayOfSkills {
						if i == "+" {
							self.arrayOfSkills.remove(at: self.arrayOfSkills.count - 2)
							self.addButton.setImage(UIImage(named: "add"), for: .normal)
							self.collection.reloadData()
						}
					}
				}
				alert.addAction(saveAction)
				self.present(alert, animated: true, completion: nil)
			} else {
				let alertOfDelete = UIAlertController(title: "Удалить навык?",
													  message: "Подтвердите удаление",
													  preferredStyle: .alert)
				let deleteAction = UIAlertAction(title: "Удалить", style: .destructive) { _ in
					self.arrayOfSkills.remove(at: indexPath.row)
					self.addButton.setImage(UIImage(named: "add"), for: .normal)
					self.collection.reloadData()
				}
				alertOfDelete.addAction(deleteAction)
				let cancelOfDeleteAction = UIAlertAction(title: "Оставить", style: .cancel) { _ in
					self.addButton.setImage(UIImage(named: "add"), for: .normal)
				}
				alertOfDelete.addAction(cancelOfDeleteAction)
				self.present(alertOfDelete, animated: true)

			}
		}
	}
}
