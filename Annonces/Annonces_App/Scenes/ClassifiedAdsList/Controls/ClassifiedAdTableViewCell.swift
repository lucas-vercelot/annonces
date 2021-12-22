//
//  ClassifiedAdTableViewCell.swift
//  Annonces
//
//  Created by Lucas VERCELOT on 20/12/2021.
//

import UIKit
import Annonces_Entities

class ClassifiedAdTableViewCell: UITableViewCell {
    
    // MARK: - Outlets
    
    private lazy var thumbnailImageView: UIImageView = {
        let thumbnailImageView = UIImageView()
        thumbnailImageView.translatesAutoresizingMaskIntoConstraints = false
        thumbnailImageView.contentMode = .scaleAspectFill
        thumbnailImageView.clipsToBounds = true
        thumbnailImageView.image = UIImage(named: "placeholderImage")
        return thumbnailImageView
    }()
    
    private lazy var detailsVerticalStackView: UIStackView = {
        let detailsVerticalStackView = UIStackView()
        detailsVerticalStackView.translatesAutoresizingMaskIntoConstraints = false
        detailsVerticalStackView.axis = .vertical
        detailsVerticalStackView.alignment = .fill
        detailsVerticalStackView.distribution = .fillProportionally
        detailsVerticalStackView.spacing = 8.0
        return detailsVerticalStackView
    }()
    
    private lazy var titleLabel: UILabel = {
        let titleLabel = UILabel()
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.adjustsFontForContentSizeCategory = true
        titleLabel.font = .systemFont(ofSize: 15.0, weight: .regular)
        titleLabel.textColor = .label
        titleLabel.textAlignment = .left
        titleLabel.numberOfLines = 0
        return titleLabel
    }()
    
    private lazy var priceLabel: UILabel = {
        let priceLabel = UILabel()
        priceLabel.translatesAutoresizingMaskIntoConstraints = false
        priceLabel.adjustsFontForContentSizeCategory = true
        priceLabel.font = .systemFont(ofSize: 13.0, weight: .semibold)
        priceLabel.textColor = .secondaryLabel
        priceLabel.textAlignment = .right
        priceLabel.numberOfLines = 1
        return priceLabel
    }()
    
    private lazy var categoryLabel: UILabel = {
        let categoryLabel = UILabel()
        categoryLabel.translatesAutoresizingMaskIntoConstraints = false
        categoryLabel.adjustsFontForContentSizeCategory = true
        categoryLabel.font = .systemFont(ofSize: 11.0, weight: .heavy)
        categoryLabel.textColor = .secondaryLabel
        categoryLabel.textAlignment = .left
        categoryLabel.numberOfLines = 1
        return categoryLabel
    }()
    
    private lazy var urgentLabel: UILabel = {
        let urgentLabel = UILabel()
        urgentLabel.translatesAutoresizingMaskIntoConstraints = false
        urgentLabel.adjustsFontForContentSizeCategory = true
        urgentLabel.font = .systemFont(ofSize: 10.0, weight: .bold)
        urgentLabel.textColor = .systemRed
        urgentLabel.numberOfLines = 1
        urgentLabel.textAlignment = .left
        urgentLabel.text = "URGENT"
        urgentLabel.isHidden = true
        return urgentLabel
    }()
    
    private lazy var creationDateLabel: UILabel = {
        let creationDateLabel = UILabel()
        creationDateLabel.translatesAutoresizingMaskIntoConstraints = false
        creationDateLabel.adjustsFontForContentSizeCategory = true
        creationDateLabel.font = .systemFont(ofSize: 10.0, weight: .medium)
        creationDateLabel.textColor = .label
        creationDateLabel.textAlignment = .right
        creationDateLabel.numberOfLines = 1
        return creationDateLabel
    }()
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    private func commonInit() {
        configureViews()
    }
    
    // MARK: - Configure

    func configureViews() {
        contentView.addSubview(thumbnailImageView)
        
        NSLayoutConstraint(item: thumbnailImageView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: contentView,
                           attribute: .top,
                           multiplier: 1.0,
                           constant: 10.0).isActive = true
        NSLayoutConstraint(item: thumbnailImageView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: contentView,
                           attribute: .leading,
                           multiplier: 1.0,
                           constant: 15.0).isActive = true
        NSLayoutConstraint(item: thumbnailImageView,
                           attribute: .width,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: 70.0).isActive = true
        NSLayoutConstraint(item: thumbnailImageView,
                           attribute: .height,
                           relatedBy: .equal,
                           toItem: nil,
                           attribute: .notAnAttribute,
                           multiplier: 1.0,
                           constant: 70.0).isActive = true
        
        contentView.addSubview(detailsVerticalStackView)
        
        detailsVerticalStackView.addArrangedSubview(urgentLabel)
        detailsVerticalStackView.addArrangedSubview(categoryLabel)
        detailsVerticalStackView.addArrangedSubview(titleLabel)
        detailsVerticalStackView.addArrangedSubview(priceLabel)
        detailsVerticalStackView.addArrangedSubview(creationDateLabel)
        
        NSLayoutConstraint(item: detailsVerticalStackView,
                           attribute: .top,
                           relatedBy: .equal,
                           toItem: contentView,
                           attribute: .top,
                           multiplier: 1,
                           constant: 10.0).isActive = true
        NSLayoutConstraint(item: detailsVerticalStackView,
                           attribute: .bottom,
                           relatedBy: .equal,
                           toItem: contentView,
                           attribute: .bottom,
                           multiplier: 1,
                           constant: -10.0).isActive = true
        NSLayoutConstraint(item: detailsVerticalStackView,
                           attribute: .leading,
                           relatedBy: .equal,
                           toItem: thumbnailImageView,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: 8.0).isActive = true
        NSLayoutConstraint(item: detailsVerticalStackView,
                           attribute: .trailing,
                           relatedBy: .equal,
                           toItem: contentView,
                           attribute: .trailing,
                           multiplier: 1,
                           constant: -15.0).isActive = true
        
        layoutIfNeeded()
    }
    
    func configure(with enrichedClassifiedAd: EnrichedClassifiedAd) {
        configureImage(with: enrichedClassifiedAd.imagesURL.thumbnail)
        configureUrgentState(with: enrichedClassifiedAd.isUrgent)
        configureTitle(with: enrichedClassifiedAd.title)
        configureCategory(with: String(enrichedClassifiedAd.category.name))
        configurePrice(with: String(format: "%.2f€", enrichedClassifiedAd.price))
        configureCreationDate(with: enrichedClassifiedAd.creationDate)
    }
    
    private func configureImage(with imageURL: URL) {
        thumbnailImageView.setImageFromURL(imageURL) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let image):
                DispatchQueue.main.async {
                    self.thumbnailImageView.image = image
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
    
    private func configureCategory(with category: String) {
        categoryLabel.text = category
    }
    
    private func configurePrice(with price: String) {
        priceLabel.text = price
    }
    
    private func configureCreationDate(with creationDate: Date) {
        creationDateLabel.text = "Annonce créée le " + DateFormatter.creationDateDisplayFormatter.string(from: creationDate)
    }
    
    // MARK: - Reuse
    
    override func prepareForReuse() {
        super.prepareForReuse()
        cleanUi()
    }
    
    private func cleanUi() {
        titleLabel.text = nil
        categoryLabel.text = nil
        priceLabel.text = nil
        thumbnailImageView.image = UIImage(named: "placeholderImage")
        urgentLabel.isHidden = true
        creationDateLabel.text = nil
    }
}
