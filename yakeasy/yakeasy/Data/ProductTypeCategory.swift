//
//  ProductTypeCategory.swift
//  drugger
//
//  Created by Leo Cho on 2023/07/28.
//

import Foundation

struct ProductTypeCategory: Codable {
    let id: Int
    let name: String
    var mainCategoryID: Int?
    
    static func createObject(for code: Int) -> ProductTypeCategory {
        switch code {
            // MARK: 100s
        case general_anesthesia.id: return general_anesthesia
        case sleeping_pill.id: return sleeping_pill
        case antiepileptic.id: return antiepileptic
        case analgesic.id: return analgesic
        case antihypnotic.id: return antihypnotic
        case motion_sickness.id: return motion_sickness
        case psychoactive.id: return psychoactive
        case other_CNS.id: return other_CNS
            
        case local_anesthesia.id: return local_anesthesia
        case relaxant.id: return relaxant
        case ANS.id: return ANS
        case sedative.id: return sedative
        case perspiration.id: return perspiration
        case other_PNS.id: return other_PNS
            
        case ophthalmic.id: return ophthalmic
        case otolaryngology.id: return otolaryngology
        case other_sensory.id: return other_sensory
            
        case antihistamine.id: return antihistamine
        case non_histamine.id: return non_histamine
        case other_allergy.id: return other_allergy
            
        case other_nervous.id: return other_nervous
            
            // MARK: 200s
        case cardiac_stimulant.id: return cardiac_stimulant
        case anti_arrhythmic.id: return anti_arrhythmic
        case diurectic.id: return diurectic
        case anti_hypertension.id: return anti_hypertension
        case diosmin.id: return diosmin
        case vasoconstrictor.id: return vasoconstrictor
        case vasodialator.id: return vasodialator
        case arteriosclerosis.id: return arteriosclerosis
        case other_circulatory.id: return other_circulatory
            
        case respiratory_stimulant.id: return respiratory_stimulant
        case expectorant.id: return expectorant
        case inhalant.id: return inhalant
        case other_respiratory.id: return other_respiratory
            
        case dental_oral.id: return dental_oral
        case peptic_ulcer.id: return peptic_ulcer
        case digestive_support.id: return digestive_support
        case antacid.id: return antacid
        case emetic_antiemetic.id: return emetic_antiemetic
        case bile.id: return bile
        case intestine_cleaner.id: return intestine_cleaner
        case constipation.id: return constipation
        case other_digestive.id: return other_digestive
            
        case pituary_hormone.id: return pituary_hormone
        case idk_hormone.id: return idk_hormone
        case thyroid_hormone.id: return thyroid_hormone
        case anabolic_steroid.id: return anabolic_steroid
        case adrenocorticoid.id: return adrenocorticoid
        case male_hormone.id: return male_hormone
        case female_hormone.id: return female_hormone
        case mixed_hormone.id: return mixed_hormone
        case other_hormone.id: return other_hormone
            
        case UT_disinfectant.id: return UT_disinfectant
        case uterine_contraction.id: return uterine_contraction
        case period_promoter.id: return period_promoter
        case birth_control.id: return birth_control
        case genito_urinary.id: return genito_urinary
        case hemorrhoid.id: return hemorrhoid
        case other_genito_urinary.id: return other_genito_urinary
            
        case dermal_disinfectant.id: return dermal_disinfectant
        case wound_protectant.id: return wound_protectant
        case purulent.id: return purulent
        case dermal_analgesic.id: return dermal_analgesic
        case dermal_paracitic.id: return dermal_paracitic
        case dermal_softener.id: return dermal_softener
        case hair.id: return hair
        case medical_bath.id: return medical_bath
        case other_dermal.id: return other_dermal
            
        case other_organ.id: return other_organ
            
            //MARK: 300s
        case vitamin_AD.id: return vitamin_AD
        case vitamin_B1.id: return vitamin_B1
        case vitamin_B.id: return vitamin_B
        case vitamin_CP.id: return vitamin_CP
        case vitamin_EK.id: return vitamin_EK
        case multivitamin.id: return multivitamin
        case other_vitamin.id: return other_vitamin
            
        case calcium.id: return calcium
        case mineral.id: return mineral
        case sugar.id: return sugar
        case organic_acid.id: return organic_acid
        case amino_acid.id: return amino_acid
        case unknown_suppliment_a.id: return unknown_suppliment_a
        case unknown_suppliment_b.id: return unknown_suppliment_b
        case other_suppliment.id: return other_suppliment
            
        case blood_substitute.id: return blood_substitute
        case hemostatic.id: return hemostatic
        case anticoagulant.id: return anticoagulant
        case other_blood.id: return other_blood
            
        case hemodialytic.id: return hemodialytic
        case other_hemodialytic.id: return other_hemodialytic
            
        case hepatotonic.id: return hepatotonic
        case antidote.id: return antidote
        case substance_disorder.id: return substance_disorder
        case gout.id: return gout
        case enzyme.id: return enzyme
        case diabetes.id: return diabetes
        case metabolic.id: return metabolic
        case other_metabolic_details.id: return other_metabolic_details
            
        case other_metabolic.id: return other_metabolic
            
            //MARK: 400s
        case chlorophyll.id: return chlorophyll
        case colorants.id: return colorants
        case other_cell_revival.id: return other_cell_revival
            
        case anti_tumor.id: return anti_tumor
        case other_tumor.id: return other_tumor
            
        case radioactive.id: return radioactive
        case other_cell_diagnostic.id: return other_cell_diagnostic
            
            // MARK: 600s
        case gram_positive.id: return gram_positive
        case gram_negative.id: return gram_negative
        case acid_fast.id: return acid_fast
        case gram_positive_rickettsia.id: return gram_positive_rickettsia
        case gram_negative_rickettsia.id: return gram_negative_rickettsia
        case mold_protozoa.id: return mold_protozoa
        case malignant_tumor.id: return malignant_tumor
        case gram_positive_negative.id: return gram_positive_negative
        case other_antibiotics.id: return other_antibiotics
            
        case growth_prevention.id: return growth_prevention
        case anti_tuberculosis.id: return anti_tuberculosis
        case anti_hansens.id: return anti_hansens
        case anti_syphilis.id: return anti_syphilis
        case furan_preparation.id: return furan_preparation
        case other_chemical_treatment.id: return other_chemical_treatment
            
        case vaccines.id: return vaccines
        case toxoids.id: return toxoids
        case antitoxins.id: return antitoxins
        case blood_thingy.id: return blood_thingy
        case animal_testing.id: return animal_testing
        case organism_based.id: return organism_based
        case other_organism_based.id: return other_organism_based
            
        case antiprotozoal.id: return antiprotozoal
        case antiparasitic.id: return antiparasitic
        case other_paracitic.id: return other_paracitic
            
            //MARK: 700s
        case excipitent.id: return excipitent
        case ointment.id: return ointment
        case solvent.id: return solvent
        case flavoring.id: return flavoring
        case emulsion.id: return emulsion
        case other_ingredient.id: return other_ingredient
            
        case contrast_agent.id: return contrast_agent
        case basic_reagent.id: return basic_reagent
        case blood_reagent.id: return blood_reagent
        case biochemical_reagent.id: return biochemical_reagent
        case immunity_reagent.id: return immunity_reagent
        case pathology_reagent.id: return pathology_reagent
        case biopsy_reagent.id: return biopsy_reagent
        case functional_reagent.id: return functional_reagent
        case diagnostic_reagent.id: return diagnostic_reagent
            
        case antiseptic.id: return antiseptic
        case disinfectant.id: return disinfectant
        case insect_repellant.id: return insect_repellant
        case pesticide.id: return pesticide
        case other_public_health.id: return other_public_health
            
        case capsule_material.id: return capsule_material
            
        case bandaids.id: return bandaids
        case other_nontherapeutic_unsorted.id: return other_nontherapeutic_unsorted
            
            //MARK: 800s
        case opiods.id: return opiods
        case tropane.id: return tropane
        case natural_narcotic.id: return natural_narcotic
            
        case synthetic_narcotic.id: return synthetic_narcotic
        case other_nonalkaloids.id: return other_nonalkaloids
            
        case other_narcotic.id: return other_narcotic
            
            //MARK: 1100s
        case equipment.id: return equipment
            
            // MARK: 2000s
        case children_cosmetic.id: return children_cosmetic
        case bath_shower.id: return bath_shower
        case eye_cosmetic.id: return eye_cosmetic
        case perfume.id: return perfume
        case scalp.id: return scalp
        case temp_hairdye.id: return temp_hairdye
        case makeup.id: return makeup
        case manicure.id: return manicure
        case shave.id: return shave
        case basic_cosmetic.id: return basic_cosmetic
        case sunscreen.id: return sunscreen
        case other_cosmetic.id: return other_cosmetic
            
        default:
            return empty
        }
    }
}

// MARK: - Main Categories
extension ProductTypeCategory {
    static let CNS = ProductTypeCategory(id: 110, name: "중추신경계용")
    static let PNS = ProductTypeCategory(id: 120, name: "말초신경계용")
    static let sensory = ProductTypeCategory(id: 130, name: "감각기관용")
    static let allergy = ProductTypeCategory(id: 140, name: "알레르기용")
    static let other_nervous = ProductTypeCategory(id: 190, name: "기타신경계용")
    
    static let circulatory = ProductTypeCategory(id: 210, name: "순환계용")
    static let respiratory = ProductTypeCategory(id: 220, name: "호흡기관용")
    static let digestive = ProductTypeCategory(id: 230, name: "소화기관용")
    static let hormonal = ProductTypeCategory(id: 240, name: "호르몬제")
    static let urogenital = ProductTypeCategory(id: 250, name: "비뇨생식기관용")
    static let dermal = ProductTypeCategory(id: 260, name: "외피용")
    static let other_organ = ProductTypeCategory(id: 290, name: "기타기관용")
    
    static let vitamin = ProductTypeCategory(id: 310, name: "비타민제")
    static let nutrition = ProductTypeCategory(id: 320, name: "자양강장변질제")
    static let blood_fluids = ProductTypeCategory(id: 330, name: "혈액 및 체액용")
    static let perfusion = ProductTypeCategory(id: 340, name: "인공관류용")
    static let other_metabolic = ProductTypeCategory(id: 390, name: "기타대사용")
    
    static let regeneration = ProductTypeCategory(id: 410, name: "조직부활용")
    static let tumor = ProductTypeCategory(id: 420, name: "종양용")
    static let tissue_treatment = ProductTypeCategory(id: 430, name: "조직세포의 치료 및 진단용")
    static let other_tissue = ProductTypeCategory(id: 490, name: "기타조직세포용")
    
    static let antibiotic = ProductTypeCategory(id: 610, name: "항생물질제제")
    static let chemical = ProductTypeCategory(id: 620, name: "화학요법제")
    static let biological = ProductTypeCategory(id: 630, name: "생물요법제")
    static let paracitic = ProductTypeCategory(id: 640, name: "기생동물용")
    static let other_pathogenic = ProductTypeCategory(id: 690, name: "기타병원생물용")
    
    static let dispencery = ProductTypeCategory(id: 710, name: "조제용")
    static let diagnostic = ProductTypeCategory(id: 720, name: "진단용")
    static let public_health = ProductTypeCategory(id: 730, name: "공중위생용")
    static let related_nontherapeutic = ProductTypeCategory(id: 740, name: "치료를 주목적으로 하지 않는 의약품")
    static let other_nontherapeutic = ProductTypeCategory(id: 790, name: "치료를 주목적으로 하지 않는 의약품")
    
    static let alkaloid_narcotic = ProductTypeCategory(id: 810, name: "알칼로이드 마약")
    static let nonalkaloid_narcotic = ProductTypeCategory(id: 820, name: "비알칼로이드 마약")
    static let other_narcotic = ProductTypeCategory(id: 890, name: "기타마약")
    
    static let equipment = ProductTypeCategory(id: 1100, name: "의료용구")
    static let cosmetics = ProductTypeCategory(id: 2000, name: "화장품")
}

// MARK: - 100: 신경게 감각기간용 의약품
extension ProductTypeCategory {
    static let general_anesthesia = ProductTypeCategory(id: 01110, name: "전신마취제", mainCategoryID: 110)
    static let sleeping_pill = ProductTypeCategory(id: 01120, name: "수면제", mainCategoryID: 110)
    static let antiepileptic = ProductTypeCategory(id: 01130, name: "항경련제", mainCategoryID: 110)
    static let analgesic = ProductTypeCategory(id: 01140, name: "해열, 진통, 소염제", mainCategoryID: 110)
    static let antihypnotic = ProductTypeCategory(id: 01150, name: "각성, 흥분제", mainCategoryID: 110)
    static let motion_sickness = ProductTypeCategory(id: 01160, name: "어지럼증, 두통, 멀미약", mainCategoryID: 110)
    static let psychoactive = ProductTypeCategory(id: 01170, name: "정신신경용제", mainCategoryID: 110)
    static let other_CNS = ProductTypeCategory(id: 01190, name: "중추신경약", mainCategoryID: 110)
    
    static let local_anesthesia = ProductTypeCategory(id: 01210, name: "국소마취제", mainCategoryID: 120)
    static let relaxant = ProductTypeCategory(id: 01220, name: "근이완제", mainCategoryID: 120)
    static let ANS = ProductTypeCategory(id: 01230, name: "자율신경계약", mainCategoryID: 120)
    static let sedative = ProductTypeCategory(id: 01240, name: "진정제", mainCategoryID: 120)
    static let perspiration = ProductTypeCategory(id: 01250, name: "발한제, 지한제", mainCategoryID: 120)
    static let other_PNS = ProductTypeCategory(id: 01290, name: "말초신경약", mainCategoryID: 120)
    
    static let ophthalmic = ProductTypeCategory(id: 01310, name: "안과용제", mainCategoryID: 130)
    static let otolaryngology = ProductTypeCategory(id: 01320, name: "이비과용제", mainCategoryID: 130)
    static let other_sensory = ProductTypeCategory(id: 01390, name: "감각기관약", mainCategoryID: 130)
    
    static let antihistamine = ProductTypeCategory(id: 01410, name: "항히스타민제", mainCategoryID: 140)
    static let non_histamine = ProductTypeCategory(id: 01420, name: "자격요법제", mainCategoryID: 140)
    static let other_allergy = ProductTypeCategory(id: 01490, name: "알레르기약", mainCategoryID: 140)
}

// MARK: - 200: 개개의 기관계용 의약품
extension ProductTypeCategory {
    static let cardiac_stimulant = ProductTypeCategory(id: 02110, name: "강심제", mainCategoryID: 210)
    static let anti_arrhythmic = ProductTypeCategory(id: 02120, name: "부정맥용제", mainCategoryID: 210)
    static let diurectic = ProductTypeCategory(id: 02130, name: "이뇨제", mainCategoryID: 210)
    static let anti_hypertension = ProductTypeCategory(id: 02140, name: "혈압강하제", mainCategoryID: 210)
    static let diosmin = ProductTypeCategory(id: 02150, name: "혈관보강제", mainCategoryID: 210)
    static let vasoconstrictor = ProductTypeCategory(id: 02160, name: "혈관수축제", mainCategoryID: 210)
    static let vasodialator = ProductTypeCategory(id: 02170, name: "혈관확장제", mainCategoryID: 210)
    static let arteriosclerosis = ProductTypeCategory(id: 02180, name: "동맥경화용제", mainCategoryID: 210)
    static let other_circulatory = ProductTypeCategory(id: 02190, name: "순환계통약", mainCategoryID: 210)
    
    static let respiratory_stimulant = ProductTypeCategory(id: 02210, name: "호흡촉진제", mainCategoryID: 220)
    static let expectorant = ProductTypeCategory(id: 2220, name: "진해거담제", mainCategoryID: 220)
    static let inhalant = ProductTypeCategory(id: 2230, name: "함소흡입제", mainCategoryID: 220)
    static let other_respiratory = ProductTypeCategory(id: 2290, name: "호흡기관약", mainCategoryID: 220)

    static let dental_oral = ProductTypeCategory(id: 2310, name: "치과구강용약", mainCategoryID: 230)
    static let peptic_ulcer = ProductTypeCategory(id: 2320, name: "소화성궤양용제", mainCategoryID: 230)
    static let digestive_support = ProductTypeCategory(id: 2330, name: "건위소화제", mainCategoryID: 230)
    static let antacid = ProductTypeCategory(id: 2340, name: "제산제", mainCategoryID: 230)
    static let emetic_antiemetic = ProductTypeCategory(id: 2350, name: "최토제, 진토제", mainCategoryID: 230)
    static let bile = ProductTypeCategory(id: 2360, name: "이담제", mainCategoryID: 230)
    static let intestine_cleaner = ProductTypeCategory(id: 2370, name: "정장제", mainCategoryID: 230)
    static let constipation = ProductTypeCategory(id: 2380, name: "하제, 완장제", mainCategoryID: 230)
    static let other_digestive = ProductTypeCategory(id: 2390, name: "소화기관약", mainCategoryID: 230)

    static let pituary_hormone = ProductTypeCategory(id: 2410, name: "뇌하수체호르몬제", mainCategoryID: 240)
    static let idk_hormone = ProductTypeCategory(id: 2420, name: "수액신호르몬제", mainCategoryID: 240)
    static let thyroid_hormone = ProductTypeCategory(id: 2430, name: "갑상선, 부갑상선호르몬제", mainCategoryID: 240)
    static let anabolic_steroid = ProductTypeCategory(id: 2440, name: "단백동화스테로이드제", mainCategoryID: 240)
    static let adrenocorticoid = ProductTypeCategory(id: 2450, name: "스테로이드성 항염증제", mainCategoryID: 240)
    static let male_hormone = ProductTypeCategory(id: 2460, name: "남성호르몬제", mainCategoryID: 240)
    static let female_hormone = ProductTypeCategory(id: 2470, name: "난포 및 황체호르몬제", mainCategoryID: 240)
    static let mixed_hormone = ProductTypeCategory(id: 2480, name: "혼합호르몬제", mainCategoryID: 240)
    static let other_hormone = ProductTypeCategory(id: 2490, name: "호르몬제", mainCategoryID: 240)

    static let UT_disinfectant = ProductTypeCategory(id: 2510, name: "요로소독제", mainCategoryID: 250)
    static let uterine_contraction = ProductTypeCategory(id: 2520, name: "자궁수축제", mainCategoryID: 250)
    static let period_promoter = ProductTypeCategory(id: 2530, name: "통경제", mainCategoryID: 250)
    static let birth_control = ProductTypeCategory(id: 2540, name: "피임제", mainCategoryID: 250)
    static let genito_urinary = ProductTypeCategory(id: 2550, name: "비뇨생식기관약/성병예방제", mainCategoryID: 250)
    static let hemorrhoid = ProductTypeCategory(id: 2560, name: "치질용제", mainCategoryID: 250)
    static let other_genito_urinary = ProductTypeCategory(id: 2590, name: "비뇨생식기관약", mainCategoryID: 250)

    static let dermal_disinfectant = ProductTypeCategory(id: 2610, name: "외피용살균소독제", mainCategoryID: 260)
    static let wound_protectant = ProductTypeCategory(id: 2620, name: "창상보호제", mainCategoryID: 260)
    static let purulent = ProductTypeCategory(id: 2630, name: "화농성질환용제", mainCategoryID: 260)
    static let dermal_analgesic = ProductTypeCategory(id: 2640, name: "진통, 진양, 수렴, 소염제", mainCategoryID: 260)
    static let dermal_paracitic = ProductTypeCategory(id: 2650, name: "기생성피부질환용제", mainCategoryID: 260)
    static let dermal_softener = ProductTypeCategory(id: 2660, name: "피부 연화 부식제", mainCategoryID: 260)
    static let hair = ProductTypeCategory(id: 2670, name: "모발용제", mainCategoryID: 260)
    static let medical_bath = ProductTypeCategory(id: 2680, name: "욕제", mainCategoryID: 260)
    static let other_dermal = ProductTypeCategory(id: 2690, name: "외피용약", mainCategoryID: 260)
}

// MARK: - 300: 대사성 의약품
extension ProductTypeCategory {
    static let vitamin_AD = ProductTypeCategory(id: 3110, name: "비타민 A & D", mainCategoryID: 310)
    static let vitamin_B1 = ProductTypeCategory(id: 3120, name: "비타민 B1", mainCategoryID: 310)
    static let vitamin_B = ProductTypeCategory(id: 3130, name: "비타민 B", mainCategoryID: 310)
    static let vitamin_CP = ProductTypeCategory(id: 3140, name: "비타민 C 및 P", mainCategoryID: 310)
    static let vitamin_EK = ProductTypeCategory(id: 3150, name: "비타민 E 및 K", mainCategoryID: 310)
    static let multivitamin = ProductTypeCategory(id: 3160, name: "혼합비타민제", mainCategoryID: 310)
    static let other_vitamin = ProductTypeCategory(id: 3190, name: "비타민제", mainCategoryID: 310)
    
    static let calcium = ProductTypeCategory(id: 3210, name: "칼슘제", mainCategoryID: 320)
    static let mineral = ProductTypeCategory(id: 3220, name: "무기질제제", mainCategoryID: 320)
    static let sugar = ProductTypeCategory(id: 3230, name: "당류제", mainCategoryID: 320)
    static let organic_acid = ProductTypeCategory(id: 3240, name: "유기산제제", mainCategoryID: 320)
    static let amino_acid = ProductTypeCategory(id: 3250, name: "단백아미노산제제", mainCategoryID: 320)
    static let unknown_suppliment_a = ProductTypeCategory(id: 3260, name: "장기제제", mainCategoryID: 320)
    static let unknown_suppliment_b = ProductTypeCategory(id: 3270, name: "유유아용제", mainCategoryID: 320)
    static let other_suppliment = ProductTypeCategory(id: 3290, name: "자양강장변질제", mainCategoryID: 320)
    
    static let blood_substitute = ProductTypeCategory(id: 3310, name: "혈액대용제", mainCategoryID: 330)
    static let hemostatic = ProductTypeCategory(id: 3320, name: "지혈제", mainCategoryID: 330)
    static let anticoagulant = ProductTypeCategory(id: 3330, name: "항응고제", mainCategoryID: 330)
    static let other_blood = ProductTypeCategory(id: 3390, name: "혈액 및 체액용약", mainCategoryID: 330)

    
    static let hemodialytic = ProductTypeCategory(id: 3410, name: "인공신장관류용제", mainCategoryID: 340)
    static let other_hemodialytic = ProductTypeCategory(id: 3490, name: "인공관류용제", mainCategoryID: 340)
    
    static let hepatotonic = ProductTypeCategory(id: 3910, name: "간장질환용제", mainCategoryID: 390)
    static let antidote = ProductTypeCategory(id: 3920, name: "해독제", mainCategoryID: 390)
    static let substance_disorder = ProductTypeCategory(id: 3930, name: "습관성중독용제", mainCategoryID: 390)
    static let gout = ProductTypeCategory(id: 3940, name: "통풍치료제", mainCategoryID: 390)
    static let enzyme = ProductTypeCategory(id: 3950, name: "효소제제", mainCategoryID: 390)
    static let diabetes = ProductTypeCategory(id: 3960, name: "당뇨병용제", mainCategoryID: 390)
    static let metabolic = ProductTypeCategory(id: 3970, name: "종합대사성제제", mainCategoryID: 390)
    static let other_metabolic_details = ProductTypeCategory(id: 3990, name: "대사성 의약품", mainCategoryID: 390)
}

// MARK: - 400: 조직세포의 기능용 의약품
extension ProductTypeCategory {
    static let chlorophyll = ProductTypeCategory(id: 4110, name: "클로로필제제", mainCategoryID: 410)
    static let colorants = ProductTypeCategory(id: 4120, name: "색소제제", mainCategoryID: 410)
    static let other_cell_revival = ProductTypeCategory(id: 4190, name: "세포부활용약", mainCategoryID: 410)

    static let anti_tumor = ProductTypeCategory(id: 4210, name: "항악성종양제", mainCategoryID: 420)
    static let other_tumor = ProductTypeCategory(id: 4290, name: "종양치료제", mainCategoryID: 420)
    
    static let radioactive = ProductTypeCategory(id: 4310, name: "방사성의약품", mainCategoryID: 430)
    static let other_cell_diagnostic = ProductTypeCategory(id: 4390, name: "조직세포의 치료 및 진단", mainCategoryID: 430)
}

// MARK: - 600: 항병원생물성 의약품
extension ProductTypeCategory {
    static let gram_positive = ProductTypeCategory(id: 6110, name: "그람양성균약", mainCategoryID: 610)
    static let gram_negative = ProductTypeCategory(id: 6120, name: "그람음성균약", mainCategoryID: 610)
    static let acid_fast = ProductTypeCategory(id: 6130, name: "항산성균약", mainCategoryID: 610)
    static let gram_positive_rickettsia = ProductTypeCategory(id: 6140, name: "그람양성균, 리케치아, 비루스", mainCategoryID: 610)
    static let gram_negative_rickettsia = ProductTypeCategory(id: 6150, name: "그람음성균, 리케치아, 비루스", mainCategoryID: 610)
    static let mold_protozoa = ProductTypeCategory(id: 6160, name: "곰팡이, 원충약", mainCategoryID: 610)
    static let malignant_tumor = ProductTypeCategory(id: 6170, name: "악성종양약", mainCategoryID: 610)
    static let gram_positive_negative = ProductTypeCategory(id: 6180, name: "그람양성, 음성균약", mainCategoryID: 610)
    static let other_antibiotics = ProductTypeCategory(id: 6190, name: "항생물질제제", mainCategoryID: 610)
    
    static let growth_prevention = ProductTypeCategory(id: 6210, name: "설화제", mainCategoryID: 620)
    static let anti_tuberculosis = ProductTypeCategory(id: 6220, name: "항결핵제", mainCategoryID: 620)
    static let anti_hansens = ProductTypeCategory(id: 6230, name: "치나제", mainCategoryID: 620)
    static let anti_syphilis = ProductTypeCategory(id: 6240, name: "구매제", mainCategoryID: 620)
    static let furan_preparation = ProductTypeCategory(id: 6250, name: "후란계제제", mainCategoryID: 620)
    static let other_chemical_treatment = ProductTypeCategory(id: 6290, name: "화학료법제", mainCategoryID: 620)
    
    static let vaccines = ProductTypeCategory(id: 6310, name: "백신류", mainCategoryID: 630)
    static let toxoids = ProductTypeCategory(id: 6320, name: "독소류 및 톡소이드류", mainCategoryID: 630)
    static let antitoxins = ProductTypeCategory(id: 6330, name: "항독소 및 렙토스피라혈청류", mainCategoryID: 630)
    static let blood_thingy = ProductTypeCategory(id: 6340, name: "혈액제제류", mainCategoryID: 630)
    static let animal_testing = ProductTypeCategory(id: 6350, name: "생물학적 실혐용제제류", mainCategoryID: 630)
    static let organism_based = ProductTypeCategory(id: 6360, name: "생물학적제제", mainCategoryID: 630)
    static let other_organism_based = ProductTypeCategory(id: 6390, name: "생물학적제제", mainCategoryID: 630)

    static let antiprotozoal = ProductTypeCategory(id: 6410, name: "항원충제", mainCategoryID: 640)
    static let antiparasitic = ProductTypeCategory(id: 6420, name: "구충제", mainCategoryID: 640)
    static let other_paracitic = ProductTypeCategory(id: 6490, name: "기생생물", mainCategoryID: 640)
}

// MARK: - 700: 치료를 주 목적으로 하지 않는 의약품 및 관련제품
extension ProductTypeCategory {
    static let excipitent = ProductTypeCategory(id: 7110, name: "부형제", mainCategoryID: 710)
    static let ointment = ProductTypeCategory(id: 7120, name: "연고기제", mainCategoryID: 710)
    static let solvent = ProductTypeCategory(id: 7130, name: "용해제", mainCategoryID: 710)
    static let flavoring = ProductTypeCategory(id: 7140, name: "교미교취착색제", mainCategoryID: 710)
    static let emulsion = ProductTypeCategory(id: 7150, name: "유화제", mainCategoryID: 710)
    static let other_ingredient = ProductTypeCategory(id: 7190, name: "조제용약", mainCategoryID: 710)
    
    static let contrast_agent = ProductTypeCategory(id: 7210, name: "X선조영제", mainCategoryID: 720)
    static let basic_reagent = ProductTypeCategory(id: 7220, name: "일반검사용 시약", mainCategoryID: 720)
    static let blood_reagent = ProductTypeCategory(id: 7230, name: "혈액검사용 시약", mainCategoryID: 720)
    static let biochemical_reagent = ProductTypeCategory(id: 7240, name: "생화학적 검사용 시약", mainCategoryID: 720)
    static let immunity_reagent = ProductTypeCategory(id: 7250, name: "면역혈청학적 검사용 시약", mainCategoryID: 720)
    static let pathology_reagent = ProductTypeCategory(id: 7260, name: "세균학적 검사용제", mainCategoryID: 720)
    static let biopsy_reagent = ProductTypeCategory(id: 7270, name: "병리조직검사용 시약", mainCategoryID: 720)
    static let functional_reagent = ProductTypeCategory(id: 7280, name: "기능검사용 시약", mainCategoryID: 720)
    static let diagnostic_reagent = ProductTypeCategory(id: 7290, name: "진단용약", mainCategoryID: 720)
    
    static let antiseptic = ProductTypeCategory(id: 7310, name: "방부제", mainCategoryID: 730)
    static let disinfectant = ProductTypeCategory(id: 7320, name: "방역용 살균소독제", mainCategoryID: 730)
    static let insect_repellant = ProductTypeCategory(id: 7330, name: "방충제", mainCategoryID: 730)
    static let pesticide = ProductTypeCategory(id: 7340, name: "살충제", mainCategoryID: 730)
    static let other_public_health = ProductTypeCategory(id: 7390, name: "공중위생용약", mainCategoryID: 730)
    
    static let capsule_material = ProductTypeCategory(id: 7410, name: "캅셀류", mainCategoryID: 740)
    
    static let bandaids = ProductTypeCategory(id: 7910, name: "반창고", mainCategoryID: 790)
    static let other_nontherapeutic_unsorted = ProductTypeCategory(id: 7990, name: "미분류", mainCategoryID: 790)
}

// MARK: - 800: 마약류 의약품
extension ProductTypeCategory {
    static let opiods = ProductTypeCategory(id: 8110, name: "아편계", mainCategoryID: 810)
    static let tropane = ProductTypeCategory(id: 8120, name: "코카인계", mainCategoryID: 810)
    static let natural_narcotic = ProductTypeCategory(id: 8190, name: "천연마약제", mainCategoryID: 810)
    
    static let synthetic_narcotic = ProductTypeCategory(id: 8210, name: "합성마약제", mainCategoryID: 820)
    static let other_nonalkaloids = ProductTypeCategory(id: 8290, name: "비알칼로이드제", mainCategoryID: 820)
}

// MARK: - 2000: 화장품
extension ProductTypeCategory {
    static let children_cosmetic = ProductTypeCategory(id: 20100, name: "어린이용", mainCategoryID: 2000)
    static let bath_shower = ProductTypeCategory(id: 20200, name: "목욕용", mainCategoryID: 2000)
    static let eye_cosmetic = ProductTypeCategory(id: 20300, name: "눈화장용", mainCategoryID: 2000)
    static let perfume = ProductTypeCategory(id: 20400, name: "향수", mainCategoryID: 2000)
    static let scalp = ProductTypeCategory(id: 20500, name: "두발용", mainCategoryID: 2000)
    static let temp_hairdye = ProductTypeCategory(id: 20600, name: "임시염색용", mainCategoryID: 2000)
    static let makeup = ProductTypeCategory(id: 20700, name: "메이크업", mainCategoryID: 2000)
    static let manicure = ProductTypeCategory(id: 20800, name: "메니큐어", mainCategoryID: 2000)
    static let shave = ProductTypeCategory(id: 20900, name: "면도용", mainCategoryID: 2000)
    static let basic_cosmetic = ProductTypeCategory(id: 21000, name: "기초화장품", mainCategoryID: 2000)
    static let sunscreen = ProductTypeCategory(id: 21100, name: "선크림", mainCategoryID: 2000)
    static let other_cosmetic = ProductTypeCategory(id: 21900, name: "기타화장품", mainCategoryID: 2000)
}

// MARK: - Empty Category
extension ProductTypeCategory {
    static let empty = ProductTypeCategory(id: 0, name: "Empty")
}
