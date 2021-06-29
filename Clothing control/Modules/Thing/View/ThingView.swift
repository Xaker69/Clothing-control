import UIKit

class ThingView: UIView {

    let imageView: UIImageView = {
        let view = UIImageView()
        view.backgroundColor = .gray
        view.contentMode = .scaleAspectFill
        view.clipsToBounds = true
        return view
    }()
    
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 23, weight: .bold)
        label.textAlignment = .center   
        return label
    }()
    
    let plusButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "plus"), for: .normal)
        return button
    }()
    
    let infoButton: UIButton = {
        let button = UIButton()
        button.setTitle("info", for: .normal)
        button.setTitleColor(.black, for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(imageView)
        addSubview(plusButton)
        addSubview(nameLabel)
        addSubview(infoButton)
        
        backgroundColor = .white
        
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        imageView.snp.makeConstraints { make in
            make.left.top.right.equalToSuperview()
            make.bottom.equalToSuperview().offset(-200)
        }
        nameLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(imageView.snp.bottom).offset(12)
        }
        plusButton.snp.makeConstraints { make in
            make.center.equalToSuperview()
            make.height.equalTo(50)
            make.width.equalTo(50)
        }
        infoButton.snp.makeConstraints { make in
            make.left.equalToSuperview().offset(20)
            make.right.bottom.equalToSuperview().offset(-20)
            make.top.equalTo(nameLabel.snp.bottom).offset(12)
        }
    }
    
}
