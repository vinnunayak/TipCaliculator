//
//  SplitInputView.swift
//  TipCaliculator
//
//  Created by Vinod Nayak Banavath on 17/04/24.
//

import UIKit
import Combine
import CombineCocoa

class SplitInputView: UIView {

    private let headerView: HeaderView = {
        let view = HeaderView()
        view.configure(topText: "Split", bottomText: "the total")
        return view
    }()

    private lazy var decrementButton: UIButton = {
        let button = buildButton(
            title: "-",
            corners: [.layerMinXMinYCorner, .layerMinXMaxYCorner])
        button.tapPublisher.flatMap { [unowned self] in
            Just(spiltSubject.value == 1 ? 1 : spiltSubject.value - 1)
        }.assign(to: \.value, on: spiltSubject)
            .store(in: &cancellables)
        return button
    }()

    private lazy var  incrementButton: UIButton = {
        let button = buildButton(
            title: "+",
            corners: [.layerMaxXMinYCorner, .layerMaxXMaxYCorner])
        button.tapPublisher.flatMap { [unowned self] in
            Just(spiltSubject.value + 1)
        }.assign(to: \.value, on: spiltSubject)
            .store(in: &cancellables)
        return button
    }()

    private lazy var quantityLable: UILabel = {
        let label = LabelFactory.build(
            text: "1",
            font: ThemeFont.bold(ofSize: 20),
            backgroundColor: .white)
        return label
    }()

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [
            decrementButton,
            quantityLable,
            incrementButton
        ])
        stackView.axis = .horizontal
        stackView.spacing = 0
        return stackView
    }()

    private let spiltSubject: CurrentValueSubject<Int,Never> = .init(1)
    var valuePublisher: AnyPublisher<Int,Never> {
        return spiltSubject.removeDuplicates().eraseToAnyPublisher()
    }

    private var cancellables = Set<AnyCancellable>()

    init() {
        super.init(frame: .zero)
        layout()
        observe()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func reset() {
        spiltSubject.send(1)
    }

    private func observe() {
        spiltSubject.sink { [unowned self] quantity in
            quantityLable.text = quantity.stringValue
        }.store(in: &cancellables)
    }

    private func layout() {
        [headerView, stackView].forEach(addSubview(_:))
        stackView.snp.makeConstraints { make in
            make.top.bottom.trailing.equalToSuperview()
        }
        [decrementButton, incrementButton].forEach { button in
            button.snp.makeConstraints { make in
                make.width.equalTo(button.snp.height)
            }
        }
        headerView.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalTo(stackView.snp.centerY)
            make.trailing.equalTo(stackView.snp.leading).offset(-24)
            make.width.equalTo(68)
        }
    }

    private func buildButton(title: String, corners: CACornerMask) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.titleLabel?.font = ThemeFont.bold(ofSize: 20)
        button.backgroundColor = ThemeColor.primary
        button.addRoundedCorners(corners: corners, radius: 8.0)
        return button
    }
}
