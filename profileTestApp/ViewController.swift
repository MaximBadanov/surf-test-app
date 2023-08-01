import UIKit


class ViewController: UIViewController {
	
	var arrayOfSkills = ["Skillbox", "GUAP", "ITMO","Mentor","iOS SDK",
						 "XCode","Многопоточность", "MVC", "CoreData",
						 "UX/UI","King of antipatterns", "iOSNubbie", "Signletone",
						 "Prototype", "Delegation","OOP"]
	
	private lazy var topPartOfScreen: UIView = {
		let topPart = UIView()
		topPart.backgroundColor = UIColor(red: 0.953, green: 0.953, blue: 0.961, alpha: 1)
		return topPart
	}()
	
	private lazy var photo: UIImageView = {
		let photo = UIImageView()
		photo.backgroundColor = .gray
		photo.image = UIImage(named: "me")
		photo.layer.cornerRadius = 60
		photo.clipsToBounds = true
		photo.contentMode = .scaleAspectFit
		return photo
	}()
	
	private lazy var name: UILabel = {
		let name = UILabel()
		name.text = "Баданов Максим\nИгоревич"
		name.numberOfLines = 2
		name.textAlignment = .center
		name.font = .systemFont(ofSize: 24, weight: .bold)
		return name
	}()
	
	private lazy var position: UILabel = {
		let position = UILabel()
		position.text = "iOS developer trainee, опыт менее 1 года"
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
		city.text = "Санкт-Петербург"
		city.font = .systemFont(ofSize: 14, weight: .medium)
		city.textColor = UIColor(red: 0.588, green: 0.584, blue: 0.608, alpha: 1)
		return city
	}()
	
	private lazy var stack: UIStackView = {
		let stack = UIStackView()
		stack.axis = .horizontal
		stack.addArrangedSubview(dot)
		stack.addArrangedSubview(city)
		stack.distribution = .fillProportionally
		return stack
	}()
	
	private lazy var aboutMe: UILabel = {
		let aboutMe = UILabel()
		aboutMe.text = "Not enough experienced software engineer, still getting skills in developing mobile apps"
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
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		
		let collection = UICollectionView(frame: .zero,
										  collectionViewLayout: layout)
		layout.minimumLineSpacing = 12
		layout.minimumInteritemSpacing = 12
		
		
		return collection
	}()
	
	private lazy var addButton: UIButton = {
		var button = UIButton()
		button.setImage(UIImage(named: "add"), for: .normal)
		button.addTarget(self, action: #selector(addNewSkill), for: .touchUpInside)
		return button
	}()
	
	
	func setupUI() {
		
		topPartOfScreen.translatesAutoresizingMaskIntoConstraints = false
		photo.translatesAutoresizingMaskIntoConstraints = false
		name.translatesAutoresizingMaskIntoConstraints = false
		position.translatesAutoresizingMaskIntoConstraints = false
		stack.translatesAutoresizingMaskIntoConstraints = false
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
		topPartOfScreen.addSubview(stack)
		
		topPartOfScreen.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
		topPartOfScreen.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
		topPartOfScreen.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
		topPartOfScreen.heightAnchor.constraint(equalToConstant: 387).isActive = true
		
		photo.centerXAnchor.constraint(equalTo: topPartOfScreen.centerXAnchor).isActive = true
		photo.widthAnchor.constraint(equalToConstant: 120).isActive = true
		photo.heightAnchor.constraint(equalToConstant: 120).isActive = true
		photo.bottomAnchor.constraint(equalTo: topPartOfScreen.bottomAnchor, constant: -143).isActive = true
		
		
		name.leadingAnchor.constraint(equalTo: topPartOfScreen.leadingAnchor, constant: 60).isActive = true
		name.trailingAnchor.constraint(equalTo: topPartOfScreen.trailingAnchor, constant: -60).isActive = true
		name.heightAnchor.constraint(equalToConstant: 64).isActive = true
		name.bottomAnchor.constraint(equalTo: topPartOfScreen.bottomAnchor, constant: -63).isActive = true
		
		position.leadingAnchor.constraint(equalTo: topPartOfScreen.leadingAnchor, constant: 51).isActive = true
		position.trailingAnchor.constraint(equalTo: topPartOfScreen.trailingAnchor, constant: -51).isActive = true
		position.heightAnchor.constraint(equalToConstant: 20).isActive = true
		position.bottomAnchor.constraint(equalTo: topPartOfScreen.bottomAnchor, constant: -39).isActive = true
		
		
		stack.leadingAnchor.constraint(equalTo: topPartOfScreen.leadingAnchor, constant: 120).isActive = true
		stack.trailingAnchor.constraint(equalTo: topPartOfScreen.trailingAnchor, constant: -120).isActive = true
		stack.heightAnchor.constraint(equalToConstant: 20).isActive = true
		stack.bottomAnchor.constraint(equalTo: topPartOfScreen.bottomAnchor, constant: -19).isActive = true
		
		aboutMe.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
		aboutMe.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
		aboutMe.heightAnchor.constraint(equalToConstant: 40).isActive = true
		aboutMe.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
		
		about.leadingAnchor.constraint(equalTo: aboutMe.leadingAnchor).isActive = true
		about.heightAnchor.constraint(equalToConstant: 20).isActive = true
		about.widthAnchor.constraint(equalToConstant: 70).isActive = true
		about.bottomAnchor.constraint(equalTo: aboutMe.topAnchor).isActive = true
		
		mySkills.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
		mySkills.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 48).isActive = true
		mySkills.heightAnchor.constraint(equalToConstant: 20).isActive = true
		mySkills.topAnchor.constraint(equalTo: topPartOfScreen.bottomAnchor, constant: 21).isActive = true
		
		collection.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
		collection.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
		collection.topAnchor.constraint(equalTo: mySkills.bottomAnchor, constant: 20).isActive = true
		collection.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -152).isActive = true
		
		//		addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 335).isActive = true
		addButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
		addButton.heightAnchor.constraint(equalToConstant: 24).isActive = true
		addButton.bottomAnchor.constraint(equalTo: mySkills.bottomAnchor).isActive = true
	}
	
	@objc func addNewSkill() {
		arrayOfSkills.append("+")
		collection.reloadData()
		addButton.setImage(UIImage(named: "check"), for: .normal)
		
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
					self.addButton.setImage(UIImage(named: "add"), for: .normal)
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


extension ViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		let string = arrayOfSkills[indexPath.row]
		let width = (string.count * 5) + 48
		return CGSize(width:width, height: 44)
	}
}
