import UIKit

class StuffCell: UICollectionViewCell {
    
    let imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .gray
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .center
        return label
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(nameLabel)
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        nameLabel.snp.makeConstraints { make in
            make.bottom.left.right.equalToSuperview()
            make.height.equalTo(30)
        }
        imageView.snp.makeConstraints { make in
            make.left.top.equalToSuperview().offset(5)
            make.right.equalToSuperview().offset(-5)
            make.bottom.equalTo(nameLabel.snp.top)
        }
    }
    
}
