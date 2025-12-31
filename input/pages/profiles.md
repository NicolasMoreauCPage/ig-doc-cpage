---
title: Profils FHIR
layout: default
permalink: /profiles.html
---


# Profils FHIR : Contraintes sur les ressources

Les profils FHIR sont au cœur des Implementation Guides. Ils permettent de contraindre les ressources FHIR génériques pour les adapter à des cas d'usage spécifiques, garantissant ainsi l'interopérabilité et la conformité.


## Qu'est-ce qu'un profil FHIR ?

Un profil définit des contraintes sur une ressource FHIR de base :
- Cardinalités : rendre obligatoire un élément optionnel (0..1 → 1..1)
- Types de données : restreindre à un sous-ensemble de valeurs
- Terminologies : imposer des code systems ou value sets spécifiques
- Extensions : ajouter des éléments personnalisés
- Invariants : règles de validation complexes

Exemple : Le profil Patient de base FHIR permet beaucoup de liberté. Un profil métier peut contraindre le nom à être obligatoire, limiter les identifiants possibles, etc.


## Pourquoi créer des profils ?

- Interopérabilité : assurer que tous les systèmes parlent le même langage
- Conformité : respecter les réglementations (RGPD, normes métier)
- Qualité : réduire les ambiguïtés et les erreurs d'implémentation
- Réutilisabilité : profils publiés peuvent être repris par d'autres IG


## Comment créer un profil ?

1. Analyse du besoin :
   - Identifier la ressource de base (Patient, Observation, etc.)
   - Définir les contraintes métier nécessaires
   - Vérifier l'existence de profils similaires dans l'écosystème
2. Définition en FSH (FHIR Shorthand) :

```fsh
Profile: MonPatient
Parent: Patient
Id: mon-patient
Title: "Profil Patient personnalisé"
Description: "Profil pour les patients dans le contexte métier X"

* name 1..* MS // Nom obligatoire et mustSupport
* name.family 1..1 // Prénom obligatoire
* identifier ^slicing.discriminator.type = #pattern
* identifier ^slicing.discriminator.path = "system"
* identifier ^slicing.rules = #open
* identifier contains
    nss 1..1 and
    ins 0..1
* identifier[nss].system = "urn:oid:1.2.250.1.213.1.4.8" // NSS français
* identifier[ins].system = "urn:oid:1.2.250.1.213.1.4.9" // INS
```

3. Compilation avec SUSHI :

```bash
sushi .
```
SUSHI génère le JSON/XML du profil dans `fsh-generated/resources/`.

### 4. Validation
- Utiliser IG Publisher pour valider le profil
- Tester avec des exemples d'instances

## Bonnes pratiques pour les profils

- **Nommez clairement** : `PatientVaccination` plutôt que `PatientV2`
- **Documentez abondamment** : Description, usage, exemples
- **Versionnez** : Chaque évolution doit être tracée
- **Testez** : Créez des instances valides/invalides
- **Réutilisez** : Héritez de profils existants quand possible
- **MustSupport** : Marquez les éléments critiques avec `MS`

## Exemples de profils courants

- **Patient** : Identifiants, noms, contacts
- **Observation** : Résultats de laboratoire, constantes vitales
- **MedicationRequest** : Prescriptions médicales
- **DocumentReference** : Documents cliniques

## Outils pour les profils

- **FSH** : Langage de définition lisible
- **SUSHI** : Compilation FSH → FHIR
- **Forge** : Éditeur web pour profils (simplifié)
- **IG Publisher** : Validation et génération de snapshots

## Ressources complémentaires

- [Documentation officielle profils](https://www.hl7.org/fhir/profiling.html)
- [FSH School - Profils](https://fshschool.org/docs/sushi/profiles/)
- [Exemples HL7](https://www.hl7.org/fhir/examples.html)

> **Astuce** : Commencez simple ! Créez un profil minimal, validez-le, puis ajoutez progressivement des contraintes.

Cette page liste les profils définis dans ce guide. Pour chaque profil, consultez la documentation détaillée et les exemples d'usage.

<!-- Liste des profils sera générée automatiquement par IG Publisher -->
<!-- End of canonical Profiles page -->
