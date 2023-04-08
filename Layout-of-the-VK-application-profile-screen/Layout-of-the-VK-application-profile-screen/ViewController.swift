//
//  ViewController.swift
//  Layout-of-the-VK-application-profile-screen
//
//  Created by Georgiy on 19.05.2022.
//

import UIKit

class ViewController: UIViewController {
    
    private lazy var labelNameSurname: UILabel = {
        var labelNameSurname = UILabel()
        labelNameSurname.text = "Алексей Павлов"
        labelNameSurname.font = UIFont.boldSystemFont(ofSize: 17)
        labelNameSurname.textColor = UIColor.white
        return labelNameSurname
    }()
    
    private lazy var labelOnOff: UILabel = {
       var labelOnOff = UILabel()
        
        let attributedString = NSMutableAttributedString(string: "online ")
        let stringAttachment = NSTextAttachment()
        stringAttachment.image = UIImage(systemName: "iphone.homebutton")?.withTintColor(UIColor(red: 163/255, green: 181/255, blue: 198/255, alpha: 1.00))
        attributedString.append(NSAttributedString(attachment: stringAttachment))
       
        labelOnOff.attributedText = attributedString
        labelOnOff.font = UIFont.boldSystemFont(ofSize: 14)
        labelOnOff.textColor = UIColor.gray
        return labelOnOff
    }()
    
    private lazy var parentStackView: UIStackView = {
        let parentStackView = UIStackView()
        parentStackView.axis = .vertical
        parentStackView.spacing = 15
        return parentStackView
    }()
    
    private lazy var firstStackViewAva: UIStackView = {
        let firstStackViewAva = UIStackView()
        firstStackViewAva.axis = .vertical
        return firstStackViewAva
    }()
    
    private lazy var secondStackViewPageTitle: UIStackView = {
        let secondStackViewPageTitle = UIStackView()
        secondStackViewPageTitle.axis = .vertical
        secondStackViewPageTitle.alignment = .leading
        return secondStackViewPageTitle
    }()
    
    private lazy var stackViewHeading: UIStackView = {
        let stackViewHeading = UIStackView()
        stackViewHeading.axis = .horizontal
        stackViewHeading.spacing = 10
        stackViewHeading.alignment = .leading
        return stackViewHeading
        
    }()
    
    private lazy var thirdStackViewButtonsInCenter: UIStackView = {
        let thirdStackViewButtonsInCenter = UIStackView()
        thirdStackViewButtonsInCenter.axis = .vertical
        return thirdStackViewButtonsInCenter
    }()
    
    private lazy var stackVIewFourMainButtons: UIStackView = {
        let stackVIewFourMainButtons = UIStackView()
        stackVIewFourMainButtons.axis = .horizontal
        stackVIewFourMainButtons.distribution = .fillProportionally
        
        return stackVIewFourMainButtons
    }()
    
    private lazy var finishStackViewButtons: UIStackView = {
       let finishStackViewButtons = UIStackView()
        finishStackViewButtons.axis = .vertical
        finishStackViewButtons.alignment = .leading
        return finishStackViewButtons
    }()
    
    private lazy var imagePic: UIButton = {
        let imagePic = UIButton()
        imagePic.setImage(UIImage(named: "Ava"), for: .normal)
        imagePic.layer.cornerRadius = 15
        return imagePic
    }()
    

    private lazy var buttonStatus = {
        addButtonPageTitle(with: Title.buttonStatus.rawValue,
                           titleLabel: Metric.firstFont,
                           backgroundColor: UIColor.black,
                           setTitleColor: UIColor.secondColor,
                           cornerRadius: Metric.thirdCornerRadius)
    }()

    private lazy var buttonEdit = {
        addButtonPageTitle(with: Title.buttonEdit.rawValue,
                           titleLabel: Int(Metric.firstFont),
                           backgroundColor: UIColor.firstColor,
                           setTitleColor: UIColor.white,
                           cornerRadius: Metric.secondCornerRadius)
    }()
    

    private lazy var buttonHistory = {
        addFourCentralButtons(with: Title.buttonHistory.rawValue,
                              font: Metric.secondFont,
                              image: Image.buttonHistory.rawValue)
    }()


    private lazy var buttonRecord = {
        addFourCentralButtons(with: Title.buttonRecord.rawValue,
                              font: Metric.secondFont,
                              image: Image.buttonRecord.rawValue)
    }()
    

    
    private lazy var buttonPhoto = {
        addFourCentralButtons(with: Title.buttonPhoto.rawValue,
                              font: Metric.secondFont,
                              image: Image.buttonPhoto.rawValue)
    }()
    
    
    private lazy var buttonClip = {
        addFourCentralButtons(with: Title.buttonClip.rawValue,
                              font: Metric.secondFont,
                              image: Image.buttonClip.rawValue)
    }()

    
    private lazy var buttonCity = {
        addMainFiveButtons(with: Title.buttonCity.rawValue,
                       baseForegroundColor: UIColor.gray,
                       image: Image.buttonCity.rawValue)
    }()
    
    
    
    private lazy var buttonSubscriber = {
        addMainFiveButtons(with: Title.buttonSubscriber.rawValue,
                       baseForegroundColor: UIColor.gray,
                       image: Image.buttonSubscriber.rawValue)
    }()
    
    
    private lazy var buttonWork = {
        addMainFiveButtons(with: Title.buttonWork.rawValue,
                       baseForegroundColor: UIColor.secondColor,
                       image: Image.buttonWork.rawValue)
    }()
    
    private lazy var buttonGiff = {
        addMainFiveButtons(with: Title.buttonGiff.rawValue,
                       baseForegroundColor: UIColor.thirdColor,
                       image: Image.buttonGiff.rawValue)
    }()
    
    
    
    private lazy var buttonInformation = {
        addMainFiveButtons(with: Title.buttonInfo.rawValue,
                       baseForegroundColor: .white,
                       image: Image.buttonInfoImage.rawValue)
    }()
    

    // MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
        setupView()

    }
    
    // MARK: - Settings
    
    //приватная ф-я, где установлена иерархия элементов
    private func setupHierarchy() {
        
        firstStackViewAva.addArrangedSubview(imagePic)
        
        secondStackViewPageTitle.addArrangedSubview(labelNameSurname)
        secondStackViewPageTitle.addArrangedSubview(buttonStatus)
        secondStackViewPageTitle.addArrangedSubview(labelOnOff)
        
        stackViewHeading.addArrangedSubview(firstStackViewAva)
        stackViewHeading.addArrangedSubview(secondStackViewPageTitle)
        
        thirdStackViewButtonsInCenter.addArrangedSubview(buttonEdit)
        stackVIewFourMainButtons.addArrangedSubview(buttonHistory)
        stackVIewFourMainButtons.addArrangedSubview(buttonRecord)
        stackVIewFourMainButtons.addArrangedSubview(buttonPhoto)
        stackVIewFourMainButtons.addArrangedSubview(buttonClip)

        finishStackViewButtons.addArrangedSubview(buttonCity)
        finishStackViewButtons.addArrangedSubview(buttonSubscriber)
        finishStackViewButtons.addArrangedSubview(buttonWork)
        finishStackViewButtons.addArrangedSubview(buttonGiff)
        finishStackViewButtons.addArrangedSubview(buttonInformation)
        
        parentStackView.addArrangedSubview(stackViewHeading)
        parentStackView.addArrangedSubview(thirdStackViewButtonsInCenter)
        parentStackView.addArrangedSubview(stackVIewFourMainButtons)
        
        parentStackView.addArrangedSubview(finishStackViewButtons)
        view.addSubview(parentStackView)

    }
    
    //установка + закрепление на экране констрейтов
    private func setupLayout() {
        parentStackView.translatesAutoresizingMaskIntoConstraints = false
        parentStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 5).isActive = true
        parentStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 18).isActive = true
        parentStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -18).isActive = true
    }
    
    //ф-я для установки настроек вью
    private func setupView() {
        view.backgroundColor = UIColor.black
    }
    
// MARK: - Private functions
    private func addButtonPageTitle(with title: String,
                                    titleLabel: Int,
                                    backgroundColor: UIColor,
                                    setTitleColor: UIColor,
                                    cornerRadius: CGFloat) -> UIButton {
        let myButton = UIButton()
        
        myButton.setTitle(title, for: .normal)
        myButton.titleLabel?.font = UIFont.systemFont(ofSize: CGFloat(titleLabel), weight: .light)
        myButton.backgroundColor = backgroundColor
        myButton.setTitleColor(setTitleColor, for: .normal)
        myButton.layer.cornerRadius = cornerRadius
        
        return myButton
    }
    
    
    private func addMainFiveButtons(with title: String,
                                baseForegroundColor: UIColor,
                                image: String) -> UIButton {
        
        let myButton = UIButton()
        myButton.configuration = .plain()
        myButton.configuration?.title = title
        myButton.configuration?.baseForegroundColor = baseForegroundColor
        myButton.configuration?.image = UIImage(systemName: image)
        myButton.configuration?.imagePadding = Metric.imagePaddingSecond
        
        return myButton
    }
    
    
    private func addFourCentralButtons(with title: String, font: CGFloat, image: String) -> UIButton {
        let myButton = UIButton()
        myButton.configuration = .tinted()
        myButton.configuration?.title = title
        myButton.configuration?.attributedTitle?.font = .systemFont(ofSize: font)
        myButton.configuration?.baseForegroundColor = UIColor.secondColor
        myButton.configuration?.baseBackgroundColor = .black
        myButton.configuration?.image = UIImage(systemName: image)
        myButton.configuration?.imagePadding = CGFloat(Metric.imagePadding)
        myButton.configuration?.imagePlacement = .top
        return myButton
    }
    
}

extension ViewController {
    enum Metric {
        static let firstFont = 14
        static let secondCornerRadius: CGFloat = 8
        static let thirdCornerRadius: CGFloat = 0
        static let imagePadding: CGFloat = 10
        static let imagePaddingSecond: CGFloat = 5
        static let secondFont: CGFloat = 15
        
    }
    
    enum Title: String {
        case buttonEdit = "Редактировать"
        case buttonStatus = "Установить статус"
        case buttonInfo = "Подробная информация"
        case buttonGiff = "Получить подарок >"
        case buttonWork = "Указать место работы"
        case buttonSubscriber = "35 подписчиков"
        case buttonCity = "Город: Москва"
        case buttonClip = "Клип"
        case buttonPhoto = "Фото"
        case buttonRecord = "Запись"
        case buttonHistory = "История"
    }
    
    enum Image: String {
        case buttonInfoImage = "info.circle.fill"
        case buttonGiff = "snowflake"
        case buttonWork = "bag"
        case buttonSubscriber = "dot.radiowaves.up.forward"
        case buttonCity = "house"
        case buttonClip = "video.bubble.left"
        case buttonPhoto = "photo"
        case buttonRecord = "square.and.pencil"
        case buttonHistory = "camera"
    }
}

extension UIColor {
    static var firstColor: UIColor  { return UIColor(red: 41/255, green: 45/255, blue: 46/255, alpha: 1.00) }
    static var secondColor: UIColor { return UIColor(red: 121/255, green: 164/255, blue: 221/255, alpha: 1.00) }
    static var thirdColor: UIColor { return UIColor(red: 92/255, green: 79/255, blue: 162/255, alpha: 1.00) }
}

