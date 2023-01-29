//
//  CodeView.swift
//  FlagHunter
//
//  Created by Michel Bernardo on 29/01/23.
//

public protocol CodeView {

    func buildViewHierarchy()
    func setupConstraints()
    func setupAdditionalConfiguration()
    func setupView()
}

extension CodeView {

    public func setupView() {
        buildViewHierarchy()
        setupConstraints()
        setupAdditionalConfiguration()
    }
}
