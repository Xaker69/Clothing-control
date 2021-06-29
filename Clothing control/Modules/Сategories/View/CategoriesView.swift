import UIKit
import SnapKit

class CategoriesView: UIView {

    var tableView: UITableView = {
        let view = UITableView()
        view.tableFooterView = UIView()
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(tableView)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
