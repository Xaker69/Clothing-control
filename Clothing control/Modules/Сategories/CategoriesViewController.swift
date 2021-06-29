import UIKit

class CategoriesViewController: UIViewController {

    var mainView: CategoriesView {
        return view as! CategoriesView
    }
    
    private lazy var plusButton: UIBarButtonItem = {
        let button = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addCategory))
        return button
    }()
    
    override func loadView() {
        let view = CategoriesView()
        self.view = view
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Категории"
        navigationItem.rightBarButtonItem = plusButton
        
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
    }

    @objc private func addCategory() {
        
    }

}

extension CategoriesViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
}

