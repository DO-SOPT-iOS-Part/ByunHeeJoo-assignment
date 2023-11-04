//
//  DisplayLayoutFactory.swift
//  DO_SOPT_Seminar_Assignment
//
//  Created by 변희주 on 2023/11/04.
//

import UIKit

enum LayoutFactory {
    
    //MARK: - 섹션별로 다른 SectionLayout 생성
    static func create() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionNumber, environment) -> NSCollectionLayoutSection? in
            let section: NSCollectionLayoutSection
            
            switch sectionNumber {
            case 0:
                section = createScrollSection()
            case 1:
                section = createVerticalSection()
            default:
                section = createScrollSection()
            }
            
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20.adjusted, trailing: 0)

            return section
        }
    }
    
    static func createScrollSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/3)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(44.adjusted), heightDimension: .absolute(146.adjusted)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 22.adjusted
        section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 22.adjusted)
        section.boundarySupplementaryItems = [self.createSupplementaryHeaderItem(forSection: 0)]
        section.supplementaryContentInsetsReference = .layoutMargins
        // Background
        let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: "sectionOneBackground")
        section.decorationItems = [sectionBackgroundDecoration]
        return section
    }
    
    static func createVerticalSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1/11)))
        let group = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .absolute(335.adjusted), heightDimension: .absolute(643.adjusted)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.interGroupSpacing = 0
        section.contentInsets = .init(top: 0, leading: 0, bottom: 0, trailing: 0)
        section.boundarySupplementaryItems = [
                self.createSupplementaryHeaderItem(forSection: 1),
                self.createSupplementaryFooterItem()
            ]
        section.supplementaryContentInsetsReference = .layoutMargins
        // Background
        let sectionBackgroundDecoration = NSCollectionLayoutDecorationItem.background(elementKind: "sectionTwoBackground")
        section.decorationItems = [sectionBackgroundDecoration]
        return section
    }
    
    static func createSupplementaryHeaderItem(forSection section: Int) -> NSCollectionLayoutBoundarySupplementaryItem {
        let headerElement: NSCollectionLayoutBoundarySupplementaryItem
        
        if section == 0 {
            headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .estimated(330.adjusted), heightDimension: .estimated(66.adjusted)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        } else {
            headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .estimated(330.adjusted), heightDimension: .estimated(38.adjusted)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        }
        
        headerElement.pinToVisibleBounds = true
        return headerElement
    }
    
    static func createSupplementaryFooterItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        let footerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(40.adjusted)), elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        return footerElement
    }
    
}
