import UIKit

class StuffListView: UIView {

    let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.backgroundColor = .clear
        
        return view
    }()
    
    let topView: UIView = {
        let view = UIView()
        return view
    }()
    
    let bottomSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .fromHex(hex: 0xb1b1b1, alpha: 0.4)
        return view
    }()
    
    let stackSeparatorView: UIView = {
        let view = UIView()
        view.backgroundColor = .fromHex(hex: 0xb1b1b1, alpha: 0.4)
        
        return view
    }()
    
    let topButtonsStack: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
//        view.distribution = .fillProportionally
        
        return view
    }()
    
    let filterButton: UIButton = {
        let button = UIButton()
        button.setTitle("filter", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    let sortButton: UIButton = {
        let button = UIButton()
        button.setTitle("sort", for: .normal)
        button.setTitleColor(.black, for: .normal)
        
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        addSubview(topView)
        
        topView.addSubview(topButtonsStack)
        topView.addSubview(bottomSeparatorView)
        
        topButtonsStack.addArrangedSubview(sortButton)
        topButtonsStack.addArrangedSubview(stackSeparatorView)
        topButtonsStack.addArrangedSubview(filterButton)
        
        backgroundColor = .white
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        stackSeparatorView.snp.makeConstraints { make in
            make.width.equalTo(1)
            make.top.equalToSuperview().offset(10)
            make.bottom.equalToSuperview().offset(-10)
        }
        filterButton.snp.makeConstraints { make in
            make.width.equalTo(bounds.width/2 - 1)
            make.top.bottom.equalToSuperview()
        }
        sortButton.snp.makeConstraints { make in
            make.width.equalTo(bounds.width/2 - 1)
            make.top.bottom.equalToSuperview()
        }
        topButtonsStack.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.left.right.equalToSuperview()
            make.height.equalTo(50)
        }
        topView.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide.snp.top)
        }
        bottomSeparatorView.snp.makeConstraints { make in
            make.top.equalTo(topButtonsStack.snp.bottom)
            make.left.right.equalToSuperview()
            make.height.equalTo(1)
        }
        collectionView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalTo(topButtonsStack.snp.bottom)
        }
    }
}
