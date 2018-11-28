//
//  HeaderView.swift
//  ViewCodeTrainning
//
//  Created by Breno Rage Aboud on 28/11/2018.
//  Copyright © 2018 thiago.lioy. All rights reserved.
//

import UIKit

final class HeaderView: UIView {
    
    let imageView: UIImageView = {
        let view = UIImageView(frame: .zero)
        view.backgroundColor = .yellow
        return view
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .orange
        return label
    }()
    
    let subtitleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.backgroundColor = .green
        return label
    }()
    
    let buttonsStackView: UIStackView = {
        let stackView = UIStackView(frame: .zero)
        stackView.distribution = .fillEqually
        stackView.spacing = 5
        stackView.axis = .horizontal
        return stackView
    }()
    
    lazy var firstButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .purple
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapFirstButton))
        button.addGestureRecognizer(tap)
        return button
    }()
    
    lazy var secondButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.backgroundColor = .blue
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapSecondButton))
        button.addGestureRecognizer(tap)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension HeaderView {
    @objc func didTapFirstButton() {
        print("tap first button")
    }
    
    @objc func didTapSecondButton() {
        print("tap second button")
    }
}

extension HeaderView: CodeView {
    func buildViewHierarchy() {
        addSubview(imageView)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        buttonsStackView.addArrangedSubview(firstButton)
        buttonsStackView.addArrangedSubview(secondButton)
        addSubview(buttonsStackView)
    }
    
    func setupConstraints() {
        imageView.snp.makeConstraints { maker in
            maker.top.bottom.left.equalToSuperview()
            maker.width.equalTo(70)
        }
        
        titleLabel.snp.makeConstraints { maker in
            maker.top.equalToSuperview()
            maker.left.equalTo(imageView.snp.right).offset(10)
            maker.right.equalToSuperview()
            maker.height.equalTo(15)
        }
        
        subtitleLabel.snp.makeConstraints { maker in
            maker.top.equalTo(titleLabel.snp.bottom).offset(5)
            maker.left.equalTo(titleLabel.snp.left)
            maker.right.equalTo(titleLabel.snp.right)
            maker.height.equalTo(15)
        }
        
        buttonsStackView.snp.makeConstraints { maker in
            maker.top.equalTo(subtitleLabel.snp.bottom).offset(10)
            maker.left.equalTo(subtitleLabel.snp.left)
            maker.right.equalTo(subtitleLabel.snp.right)
            maker.bottom.equalToSuperview()
        }
    }
}
