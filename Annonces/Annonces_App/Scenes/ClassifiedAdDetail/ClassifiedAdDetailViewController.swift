//
//  ClassifiedAdDetailViewController.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 21/12/2021.
//

import Foundation
import UIKit
import Annonces_Entities

class ClassifiedAdDetailViewController: UIViewController {
    
    // MARK: - Outlets
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    private lazy var contentView: UIView = {
        let contentView = UIView()
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()
    
    private lazy var detailsVerticalStackView: UIStackView = {
        let detailsVerticalStackView = UIStackView()
        detailsVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        detailsVerticalStackView.axis = .vertical
        detailsVerticalStackView.alignment = .fill
        detailsVerticalStackView.distribution = .fillProportionally
        detailsVerticalStackView.spacing = 16.0
        return detailsVerticalStackView
    }()
    
    private lazy var horizontalTopStackView: UIStackView = {
        let horizontalTopStackView = UIStackView()
        horizontalTopStackView.translatesAutoresizingMaskIntoConstraints = false
        horizontalTopStackView.axis = .horizontal
        horizontalTopStackView.alignment = .center
        horizontalTopStackView.distribution = .fillProportionally
        horizontalTopStackView.spacing = 16.0
        return horizontalTopStackView
    }()
    
    private lazy var coverImageView: UIImageView = {
        let coverImageView = UIImageView()
        coverImageView.translatesAutoresizingMaskIntoConstraints = false
        coverImageView.contentMode = .scaleAspectFill
        coverImageView.clipsToBounds = true
        coverImageView.image = UIImage(named: "placeholderImage")
        return coverImageView
    }()
    
    private lazy var topUrgentTitleStackView: UIStackView = {
        let topUrgentTitleStackView = UIStackView()
        topUrgentTitleStackView.translatesAutoresizingMaskIntoConstraints = false
        topUrgentTitleStackView.axis = .vertical
        topUrgentTitleStackView.alignment = .fill
        topUrgentTitleStackView.distribution = .fillProportionally
        topUrgentTitleStackView.spacing = 8.0
        return topUrgentTitleStackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.font = .systemFont(ofSize: 18.0, weight: .medium)
        titleLabel.textColor = .label
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let descriptionLabel = UILabel()
        descriptionLabel.translatesAutoresizingMaskIntoConstraints = false
        descriptionLabel.adjustsFontForContentSizeCategory = true
        descriptionLabel.font = .systemFont(ofSize: 16.0, weight: .regular)
        descriptionLabel.textColor = .secondaryLabel
        descriptionLabel.textAlignment = .left
        descriptionLabel.numberOfLines = 0
        return descriptionLabel
    }()
    
    private lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.adjustsFontForContentSizeCategory = true
        priceLabel.font = .systemFont(ofSize: 14.0, weight: .semibold)
        priceLabel.textColor = .darkText
        priceLabel.textAlignment = .right
        priceLabel.numberOfLines = 1
        return priceLabel
    }()
    
    private lazy var categoryLabel: UILabel = {
        let categoryLabel = UILabel()
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.adjustsFontForContentSizeCategory = true
        categoryLabel.font = .systemFont(ofSize: 12.0, weight: .heavy)
        categoryLabel.textColor = .secondaryLabel
        categoryLabel.numberOfLines = 1
        return categoryLabel
    }()
    
    private lazy var creationDateLabel: UILabel = {
        let creationDateLabel = UILabel()
        creationDateLabel.translatesAutoresizingMaskIntoConstraints = false
        creationDateLabel.adjustsFontForContentSizeCategory = true
        creationDateLabel.font = .systemFont(ofSize: 12.0, weight: .semibold)
        creationDateLabel.textColor = .label
        creationDateLabel.numberOfLines = 1
        return creationDateLabel
    }()
    
    private lazy var urgentLabel: UILabel = {
        let urgentLabel = UILabel()
        urgentLabel.translatesAutoresizingMaskIntoConstraints = false
        urgentLabel.adjustsFontForContentSizeCategory = true
        urgentLabel.font = .systemFont(ofSize: 10.0, weight: .bold)
        urgentLabel.textColor = .systemRed
        urgentLabel.numberOfLines = 1
        urgentLabel.text = "URGENT"
        urgentLabel.isHidden = true
        return urgentLabel
    }()
    
    // MARK: - Dependencies
    
    private lazy var interactor: ClassifiedAdDetailInteractable = ClassifiedAdDetailInteractor(presenter: ClassifiedAdDetailPresenter(displayer: self))
    private lazy var internalRouter: ClassifiedAdDetailRoutable & Router = ClassifiedAdDetailRouter(viewController: self)
    private var viewModel: ClassifiedAdDetailModels.ViewModel?
    var enrichedClassifiedAd: EnrichedClassifiedAd!
    
    // MARK: - View Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        configureViewsLayout()
        configureOutlets()
    }
    
    // MARK: - Configure
    
    private func configureViewsLayout() {
        view.backgroundColor = .systemBackground
        
        view.addSubview(scrollView)
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        scrollView.addSubview(contentView)
        let contentViewHeightConstraint = contentView.heightAnchor.constraint(equalTo: scrollView.heightAnchor)
        contentViewHeightConstraint.priority = UILayoutPriority(rawValue: 750)
        contentViewHeightConstraint.isActive = true
        NSLayoutConstraint.activate([
            contentView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor),
            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentViewHeightConstraint
        ])
        
        contentView.addSubview(detailsVerticalStackView)
        detailsVerticalStackView.addArrangedSubview(horizontalTopStackView)
        
        horizontalTopStackView.addArrangedSubview(coverImageView)
        NSLayoutConstraint.activate([
            coverImageView.widthAnchor.constraint(equalToConstant: 80.0),
            coverImageView.heightAnchor.constraint(equalToConstant: 80.0)
        ])

        horizontalTopStackView.addArrangedSubview(topUrgentTitleStackView)
        
        topUrgentTitleStackView.addArrangedSubview(urgentLabel)
        topUrgentTitleStackView.addArrangedSubview(titleLabel)
        
        detailsVerticalStackView.addArrangedSubview(categoryLabel)
        detailsVerticalStackView.addArrangedSubview(descriptionLabel)
        detailsVerticalStackView.addArrangedSubview(priceLabel)
        detailsVerticalStackView.addArrangedSubview(creationDateLabel)
        
        NSLayoutConstraint.activate([
            detailsVerticalStackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 15.0),
            detailsVerticalStackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -15.0),
            detailsVerticalStackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15.0),
            detailsVerticalStackView.bottomAnchor.constraint(lessThanOrEqualTo: contentView.bottomAnchor, constant: -15.0)
        ])
    }
    
    private func configureOutlets() {
        configureCoverImage(with: enrichedClassifiedAd.imagesURL.small)
        configureUrgentState(with: enrichedClassifiedAd.isUrgent)
        configureTitle(with: enrichedClassifiedAd.title)
        configureDescription(with: enrichedClassifiedAd.description)
        configurePrice(with: String(format: "%.2f€", enrichedClassifiedAd.price))
        configureCategory(with: enrichedClassifiedAd.category.name)
        configureCreationDate(with: enrichedClassifiedAd.creationDate)
    }
    
    private func configureCoverImage(with imageURL: URL) {
        coverImageView.setImageFromURL(imageURL) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self.coverImageView.image = image
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    private func configureUrgentState(with isUrgent: Bool) {
        urgentLabel.isHidden = !isUrgent
    }
    
    private func configureTitle(with title: String) {
        titleLabel.text = title
    }
    
    private func configureDescription(with description: String) {
        descriptionLabel.text = description
    }
    
    private func configurePrice(with price: String) {
        priceLabel.text = price
    }
    
    private func configureCategory(with category: String) {
        categoryLabel.text = category
    }
    
    private func configureCreationDate(with creationDate: Date) {
        creationDateLabel.text = "Annonce créée le " + DateFormatter.creationDateDisplayFormatter.string(from: creationDate)
    }
}

// MARK: - Presenter -> ViewController

extension ClassifiedAdDetailViewController: ClassifiedAdDetailDisplayable {
}

// MARK: - ViewController -> Router

extension ClassifiedAdDetailViewController {
}

extension ClassifiedAdDetailViewController: RoutedViewController {
    var router: Router? {
        return internalRouter
    }
}
