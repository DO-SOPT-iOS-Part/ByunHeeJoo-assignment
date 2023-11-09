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
                section = creatInformation()
            case 1:
                section = createScrollSection()
            case 2:
                section = createVerticalSection()
            default:
                section = createScrollSection()
            }
            
            section.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 0, bottom: 20.adjusted, trailing: 0)

            return section
        }
    }
    
    static func creatInformation() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .absolute(256.adjusted)), subitems: [item])
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .none
        return section
    }
    
    static func createScrollSection() -> NSCollectionLayoutSection {
        let item = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .absolute(66.adjusted), heightDimension: .absolute(146.adjusted)), subitems: [item])
        group.contentInsets = .init(top: 0, leading: 22.adjusted, bottom: 0, trailing: 0)
        let section = NSCollectionLayoutSection(group: group)
        section.orthogonalScrollingBehavior = .continuous
        section.boundarySupplementaryItems = [self.createSupplementaryHeaderItem(forSection: 1)]
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
                self.createSupplementaryHeaderItem(forSection: 2),
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
        
        if section == 1 {
            headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .estimated(330.adjusted), heightDimension: .estimated(38.adjusted)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        } else if section == 2 {
            headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .estimated(330.adjusted), heightDimension: .estimated(38.adjusted)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        } else {
            headerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .estimated(0), heightDimension: .estimated(0)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        }
        
        headerElement.pinToVisibleBounds = true
        return headerElement
    }
    
    static func createSupplementaryFooterItem() -> NSCollectionLayoutBoundarySupplementaryItem {
        let footerElement = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .estimated(100.adjusted)), elementKind: UICollectionView.elementKindSectionFooter, alignment: .bottom)
        return footerElement
    }
    
}
