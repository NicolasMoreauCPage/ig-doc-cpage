---
title: Extensions FHIR
layout: default
permalink: /extensions.html
---

# Extensions FHIR : Étendre les ressources

Les **extensions FHIR** permettent d'ajouter des éléments de données personnalisés aux ressources FHIR, lorsque le core FHIR ne couvre pas tous les besoins métier.

## Quand utiliser une extension ?

Une extension est nécessaire quand :
- Le core FHIR n'a pas d'élément pour votre donnée
- Vous voulez ajouter des métadonnées spécifiques
- Vous devez spécialiser un élément existant

**Règle d'or** : Vérifiez toujours si une extension officielle HL7 existe déjà avant d'en créer une nouvelle !

## Types d'extensions

### 1. Extensions simples
Ajout d'un seul élément de donnée :
```json
{
  "resourceType": "Patient",
  "extension": [
    {
      "url": "http://example.org/extension/patient-nationality",
      "valueCode": "FR"
    }
  ]
}
```

### 2. Extensions complexes
Structures imbriquées avec plusieurs éléments :
```json
{
  "extension": [
    {
      "url": "http://example.org/extension/contact-details",
      "extension": [
        {"url": "phone", "valueString": "+33123456789"},
        {"url": "email", "valueString": "contact@example.org"}
      ]
    }
  ]
}
```

## Création d'une extension en FSH

### 1. Définition de l'extension
```fsh
Extension: PatientNationality
Id: patient-nationality
Title: "Nationalité du patient"
Description: "Extension pour indiquer la nationalité du patient"
* value[x] only code
* valueCode from http://hl7.org/fhir/ValueSet/iso3166-1-2 (required)
```

### 2. Utilisation dans un profil
```fsh
Profile: MonPatient
Parent: Patient
* extension contains
    http://example.org/StructureDefinition/patient-nationality named nationality 0..1
* extension[nationality] ^short = "Nationalité du patient"
* extension[nationality] ^definition = "Code pays ISO 3166-1 alpha-2"
```

## Bonnes pratiques

- **URL canonique** : Utilisez une URL stable et unique
- **Versionnez** : Chaque extension doit être versionnée
- **Documentez** : Description claire, exemples d'usage
- **Validez** : Testez avec des instances réelles
- **Réutilisez** : Cherchez des extensions existantes
- **Minimalisme** : N'ajoutez que ce qui est nécessaire

## Recherche d'extensions existantes

Avant de créer :
1. [Extensions HL7 officielles](https://www.hl7.org/fhir/extensibility-registry.html)
2. [Registre des extensions](https://www.hl7.org/fhir/extension-registry.html)
3. IG de référence (US Core, etc.)
4. Communauté FHIR locale

## Exemples courants

- **Identifiants métier** : Numéro de sécurité sociale, INS, etc.
- **Données démographiques** : Nationalité, situation familiale
- **Informations cliniques** : Stade de maladie, facteurs de risque
- **Métadonnées** : Source des données, niveau de confidentialité

## Outils pour les extensions

- **FSH** : Définition déclarative
- **SUSHI** : Compilation en StructureDefinition
- **Forge** : Éditeur visuel simplifié
- **IG Publisher** : Validation et documentation

## Ressources complémentaires

- [Guide des extensions](https://www.hl7.org/fhir/extensibility.html)
- [FSH School - Extensions](https://fshschool.org/docs/sushi/extensions/)
- [Registre HL7](https://www.hl7.org/fhir/extension-registry.html)

> **Attention** : Les extensions complexifient l'interopérabilité. Utilisez-les avec parcimonie !

Cette page liste les extensions définies dans ce guide. Chaque extension est documentée avec son usage, ses contraintes et des exemples.

<!-- Liste des extensions sera générée automatiquement par IG Publisher -->
<!-- End of canonical Extensions page -->
