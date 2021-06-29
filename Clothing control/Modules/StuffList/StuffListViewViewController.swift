import UIKit

class StuffListViewViewController: UIViewController {

    var mainTitle: String = "All stuff"
    var testArray = [ClotherModel]()
    
    var mainView: StuffListView {
        return view as! StuffListView
    }
    
    private lazy var plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addClothing))
        return button
    }()
    
    override func loadView() {
        let view = StuffListView()
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = mainTitle   
        navigationController?.navigationBar.barTintColor = .white
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        mainView.collectionView.register(StuffCell.self, forCellWithReuseIdentifier: StuffCell.description())
        
        navigationItem.rightBarButtonItem = plusButton
    }
    
    @objc private func addClothing() {
        let vc = ThingViewController()
        present(vc, animated: true)
    }

}

extension StuffListViewViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let model = testArray[indexPath.item]
        let vc = ThingViewController()
        vc.mainView.imageView.image = model.image
        vc.mainView.plusButton.isHidden = model.image != nil
        vc.mainView.nameLabel.text = model.name
        navigationController?.pushViewController(vc, animated: true)
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return testArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StuffCell.description(), for: indexPath) as! StuffCell
        
        cell.nameLabel.text = testArray[indexPath.item].name
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = UIScreen.main.bounds.width/2
        let height: CGFloat = UIScreen.main.bounds.width/2 * 1.5
        let size = CGSize(width: width, height: height)

        return size
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
