//
//  ViewControllerScreen.swift
//  ViewCodeTrainning
//
//  Created by thiago.lioy on 4/25/18.
//  Copyright © 2018 thiago.lioy. All rights reserved.
//

import UIKit

final class ViewControllerScreen: UIView {
    
    lazy var headerView: HeaderView = {
        let view = HeaderView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var gridBoxLeft: GridBoxView = {
        let view = GridBoxView()
        return view
    }()
    
    lazy var gridBoxRight: GridBoxView = {
        let view = GridBoxView()
        return view
    }()
    
    lazy var gridBoxContainer: UIStackView = {
        let view = UIStackView()
        view.axis = .horizontal
        view.distribution = .fillEqually
        view.spacing = 10
        return view
    }()
    
    lazy var button: UIButton = {
        let view = UIButton(frame: .zero)
        view.setTitle("fech", for: .normal)
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override init(frame: CGRect = .zero) {
       super.init(frame: frame)
       setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension ViewControllerScreen: CodeView {
    func buildViewHierarchy() {
        addSubview(button)
        gridBoxContainer.addArrangedSubview(gridBoxLeft)
        gridBoxContainer.addArrangedSubview(gridBoxRight)
        addSubview(gridBoxContainer)
        addSubview(headerView)
    }
    
    func setupConstraints() {
        
        button.snp.makeConstraints { make in
            make.left.equalTo(self).offset(20)
            make.right.equalTo(self).inset(20)
            make.bottom.equalTo(self).inset(20)
            make.height.equalTo(44)
        }
        
        gridBoxContainer.snp.makeConstraints { make in
            make.top.equalTo(headerView.snp.bottom).offset(40)
            make.height.equalTo(250)
            make.left.equalToSuperview().offset(20)
            make.right.equalToSuperview().inset(20)
        }
        
        gridBoxLeft.snp.makeConstraints { make in
            make.height.equalToSuperview()
        }
        
        gridBoxRight.snp.makeConstraints { make in
            make.height.equalToSuperview()
        }
        
        headerView.snp.makeConstraints { maker in
            maker.top.equalTo(safeAreaLayoutGuide.snp.top).offset(20)
            maker.left.equalToSuperview().offset(20)
            maker.right.equalToSuperview().inset(20)
        }
    }
    
    func setupAdditionalConfiguration() {
        backgroundColor = .darkGray
    }
    
}
