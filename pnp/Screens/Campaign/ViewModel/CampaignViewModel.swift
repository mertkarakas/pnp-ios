//
//  UIViewController+Extensions.swift
//  pnp
//
//  Created by Mert Karakas [Mirsisbilgiteknolojileri] on 26.11.2021.
//

import UIKit

protocol CampaignViewModelOutput: AnyObject {
    func refreshCollection()
}

protocol CampaignViewModelProtocol {
    var reOrderedModels: [Campaign] { get }

    func didSelectItem(at index: Int)
    func goToSignIn()
}

final class CampaignViewModel: CampaignViewModelProtocol {

    // MARK: - Delegate
    weak var coordinatorDelegate: CampaignCoordinatorDelegate?
    weak var delegate: CampaignViewModelOutput?

    // MARK: - Properties
    private let coreDataManager: CoreDataManager

    #warning("Models will retrieve from the service.")
    private var models: [Campaign]

    var reOrderedModels: [Campaign] {
        return models.reversed()
    }

    // MARK: - Init

    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
        if coreDataManager.fetchCampaigns().isEmpty {

            coreDataManager.saveCampaign(
                title: "Van Depreminde yıkılan okulu tekrar onarıyoruz",
                description: "Van’da meydana gelen depremde, ilkokullu çocuklarımız için okulu baştan yaptırılacaktır. İyilik zincirine katkıda bulun, bir çocuk senin sayende gülümsesin 😊",
                image: UIImage(named: "c1")?.jpegData(compressionQuality: 0.4),
                totalAmount: 12000,
                reachedAmound: 9000)

            coreDataManager.saveCampaign(
                title: "Bodrumda yanan ormanı yeniden yeşillendiriyoruz",
                description: "Bodrum’da meydana gelen yangında 66 bin hektar ormanımız yanmıştır. İyilik zincirine katkıda bulun, bir çiçek senin sayende açsın 🌼",
                image: UIImage(named: "c2")?.jpegData(compressionQuality: 0.4),
                totalAmount: 10000,
                reachedAmound: 9000)

            coreDataManager.saveCampaign(
                title: "Bodrumda yanan hayvan barınağını yeniden oluşturuyoruz.",
                description: "Bodrumda meydana gelen yangında 3 hayvan barınağımız yanmış 52 sevimli dostumuz yuvasız kalmıştır. İyilik zincirine katkıda bulun, bir kedi de senin sayende yuvasını bulsun 🐈",
                image: UIImage(named: "c3")?.jpegData(compressionQuality: 0.4),
                totalAmount: 10000,
                reachedAmound: 9000)

            coreDataManager.saveCampaign(
                title: "Gölcük depreminde evsiz kalan vatandaşlarımız için konaklama desteği sağlıyoruz.",
                description: "Gölcük depreminde yıkılan 970 ev ile 3.000 vatandaşımız evsiz kalmıştır. İyilik zincirine katkıda bulun, bir aile de senin sayende yuvasını bulsun ❤️",
                image: UIImage(named: "c4")?.jpegData(compressionQuality: 0.4),
                totalAmount: 10000,
                reachedAmound: 9000)

            coreDataManager.saveCampaign(
                title: "Karadeniz sel felaketinde okulsuz kalan öğrencilerimize onarım için destek sağlıyoruz",
                description: "Kastamonuda gerçekleşen sel felaketinde henüz sayısını belirlenemeyen oranda işyeri, ev ve okul hasar görmüştür. İyilik zincirine katkıda bulun, bir çocuk senin sayende gülümsesin 🧒🏻",
                image: UIImage(named: "c5")?.jpegData(compressionQuality: 0.4),
                totalAmount: 10000,
                reachedAmound: 9000)

            coreDataManager.saveCampaign(
                title: "Soma madenindeki kazada hayatını kaybeden vatandaşlarımızın ailelerine sahip çıkıyoruz.",
                description: "Manisa Soma da meydana gelen kazada hayatını kaybeden vatandaşlarımızın 300 çocuklarına burs desteği sağlamak istiyoruz. İyilik zincirine katkıda bulun, bir çocuk senin sayende gülümsesin ",
                image: UIImage(named: "c6")?.jpegData(compressionQuality: 0.4),
                totalAmount: 10000,
                reachedAmound: 9000)
            
            models = coreDataManager.fetchCampaigns()
        } else {
            models = coreDataManager.fetchCampaigns()
        }

    }

    func refreshItems() {
        models = coreDataManager.fetchCampaigns()
        delegate?.refreshCollection()
    }

    func didSelectItem(at index: Int) {
        coordinatorDelegate?.goToDetail(with: reOrderedModels[index])
    }

    func goToSignIn() {
        coordinatorDelegate?.goToSignIn()
    }
}

