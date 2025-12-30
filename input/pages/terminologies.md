---
title: Terminologies FHIR
layout: default
permalink: /terminologies.html
---

# Terminologies FHIR : Codes et value sets

Les **terminologies** sont essentielles en FHIR pour standardiser les codes utilisés dans les échanges. Elles garantissent l'interopérabilité sémantique entre systèmes.

## Concepts clés

### Code System
Un **code system** définit un ensemble de codes avec leurs significations :
- **Exemples** : SNOMED CT, LOINC, ICD-10
- **Structure** : Code, display, définition
- **Usage** : Identifier des concepts médicaux de manière standardisée

### Value Set
Un **value set** sélectionne un sous-ensemble de codes d'un ou plusieurs code systems :
- **Binding** : Faible (exemple), fort (requis), extensible
- **Usage** : Contrôler les valeurs autorisées dans un élément

## Création d'une terminologie en FSH

### 1. Définition d'un CodeSystem
```fsh
CodeSystem: TypeConsultation
Id: type-consultation
Title: "Type de consultation"
Description: "Classification des types de consultation médicale"
* #generale "Consultation générale" "Consultation de médecine générale"
* #specialiste "Consultation spécialiste" "Consultation chez un médecin spécialiste"
* #urgence "Urgence" "Consultation aux urgences"
```

### 2. Définition d'un ValueSet
```fsh
ValueSet: TypeConsultationVS
Id: type-consultation-vs
Title: "ValueSet Type de consultation"
Description: "Types de consultation autorisés"
* include codes from system TypeConsultation
```

### 3. Utilisation dans un profil
```fsh
Profile: MaConsultation
Parent: Encounter
* type from TypeConsultationVS (required)
```

## Bonnes pratiques

- **Réutilisez** : Privilégiez les terminologies internationales (SNOMED, LOINC)
- **Versionnez** : Chaque évolution doit être tracée
- **Documentez** : Description claire, exemples d'usage
- **Validez** : Vérifiez la cohérence des codes
- **Maintenez** : Mettez à jour régulièrement

## Terminologies de référence

### Internationales
- **SNOMED CT** : Concepts cliniques complets
- **LOINC** : Observations et mesures
- **ICD-10/11** : Diagnostics
- **UCUM** : Unités de mesure

### Nationales (France)
- **CCAM** : Classification commune des actes médicaux
- **CIM-10** : Classification internationale des maladies
- **TRE_R38** : Professions de santé
- **TRE_R20** : Spécialités médicales

## Outils pour les terminologies

- **FSH** : Définition déclarative
- **SUSHI** : Compilation en ressources FHIR
- **Terminologie Server** : Validation et expansion
- **Ontoserver** : Serveur de terminologie open source

## Ressources complémentaires

- [Guide terminologies FHIR](https://www.hl7.org/fhir/terminologies.html)
- [FSH School - Terminologies](https://fshschool.org/docs/sushi/terminologies/)
- [Registre des terminologies](https://terminology.hl7.org/)

> **Astuce** : Commencez par explorer les terminologies existantes avant d'en créer de nouvelles !

Cette page liste les terminologies (code systems et value sets) définies dans ce guide. Chaque terminologie est documentée avec ses codes, son usage et des exemples.

<!-- Liste des terminologies sera générée automatiquement par IG Publisher -->
<!-- End of canonical Terminologies page -->
