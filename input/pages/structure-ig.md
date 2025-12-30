# Structure d'un Implementation Guide FHIR

Un Implementation Guide FHIR est un document vivant qui organise et présente des spécifications d'interopérabilité. Cette page détaille l'architecture logique d'un IG et les bonnes pratiques de structuration.

## Vue d'ensemble d'un IG

Un IG FHIR regroupe plusieurs composants complémentaires :

- **Artefacts techniques** : Profils, extensions, terminologies
- **Documentation narrative** : Guides d'implémentation, cas d'usage
- **Exemples concrets** : Instances d'échange
- **Métadonnées** : Informations de publication et conformité
- **Ressources complémentaires** : Outils, tests, support

L'objectif : transformer FHIR générique en spécifications opérationnelles pour votre domaine.

## Organisation logique

### 1. Page d'accueil (index.md)
**Rôle** : Point d'entrée et présentation générale
**Contenu** :
- Résumé de l'IG et son domaine d'application
- Public cible et prérequis
- Plan du guide et navigation principale
- Liens vers les sections essentielles

### 2. Introduction et contexte
**Rôle** : Expliquer le "pourquoi" et le "comment"
**Contenu** :
- Problématique métier adressée
- Bénéfices de l'interopérabilité FHIR
- Portée et limites de l'IG
- Relations avec d'autres standards/IG

### 3. Artefacts techniques
**Rôle** : Spécifications formelles
**Sections** :
- **[Profils](profiles.html)** : Contraintes sur les ressources
- **[Extensions](extensions.html)** : Nouveaux éléments de données
- **[Terminologies](terminologies.html)** : Codes et value sets
- **Opérations** : Interactions personnalisées
- **Recherche** : Paramètres de recherche spécifiques

### 4. Guides d'implémentation
**Rôle** : Accompagner les développeurs
**Contenu** :
- Workflows métier
- Algorithmes de traitement
- Règles de validation
- Gestion des erreurs
- Exemples d'intégration

### 5. Exemples et cas d'usage
**Rôle** : Illustrer concrètement
**Types d'exemples** :
- Instances minimales valides
- Scénarios complexes
- Cas limites et erreurs
- Tests d'interopérabilité

### 6. Conformité et validation
**Rôle** : Assurer la qualité
**Contenu** :
- Critères de conformité
- Tests de validation
- Outils de vérification
- Niveaux de support (mustSupport)

### 7. Annexes techniques
**Rôle** : Ressources de référence
**Contenu** :
- Glossaire des termes
- Mapping avec d'autres standards
- Historique des versions
- Contacts et support

## Bonnes pratiques de structuration

### Principes généraux

- **Progression logique** : Du général au spécifique
- **Navigation claire** : Menu intuitif et liens croisés
- **Cohérence** : Terminologie et style uniformes
- **Maintenabilité** : Structure évolutive

### Organisation par audience

- **Développeurs** : Artefacts techniques en premier
- **Architectes** : Vue d'ensemble et contraintes
- **Métiers** : Cas d'usage et exemples
- **Tous** : Introduction accessible

### Gestion du contenu

- **Modularité** : Pages spécialisées et réutilisables
- **Versionning** : Historique traçable
- **Recherche** : Contenu indexable
- **Accessibilité** : Formats alternatifs (PDF, etc.)

## Structure technique du projet

### Arborescence recommandée
```
mon-ig-fhir/
├── sushi-config.yaml      # Configuration IG
├── ig.ini                # Configuration Publisher
├── input/
│   ├── pages/            # Documentation Markdown
│   │   ├── index.md
│   │   ├── introduction.md
│   │   ├── profiles.md
│   │   └── ...
│   ├── fsh/              # Artefacts FSH
│   │   ├── profiles.fsh
│   │   ├── extensions.fsh
│   │   └── terminologies.fsh
│   ├── resources/        # Ressources additionnelles
│   ├── images/           # Médias
│   └── includes/         # Fragments réutilisables
├── fsh-generated/        # Artefacts compilés (auto)
├── output/               # Site généré (auto)
└── template/             # Template Jekyll
```

### Fichiers de configuration

#### sushi-config.yaml
```yaml
id: mon-ig-fhir
canonical: https://example.org/ig/mon-ig
name: Mon Implementation Guide
title: "Guide d'implémentation FHIR"
version: 1.0.0
fhirVersion: 4.0.1

pages:
  index.md: {title: "Accueil"}
  introduction.md: {title: "Introduction"}
  profiles.md: {title: "Profils"}

menu:
  Accueil: index.html
  Introduction: introduction.html
  Artefacts:
    "Profils": profiles.html
    "Extensions": extensions.html
```

#### ig.ini
```ini
[IG]
ig = input/fsh/
template = template/
output = output/
```

## Exemples d'IG bien structurés

### US Core (HL7)
- Structure claire : Artefacts → Guides → Exemples
- Navigation intuitive avec menu hiérarchique
- Documentation complète pour chaque profil

### IPS (International Patient Summary)
- Focus sur l'usage : Cas d'usage → Artefacts → Validation
- Exemples concrets et scénarios réalistes
- Support multilingue

### mCODE (Minimal Common Oncology Data)
- Approche modulaire : Domaines spécialisés
- Évolution continue avec feedback communauté
- Tests d'interopérabilité intégrés

## Évolution et maintenance

### Principes d'évolution

- **Incrémentale** : Versions mineures pour ajouts
- **Compatible** : Éviter les breaking changes
- **Documentée** : Changelog détaillé
- **Testée** : Validation régressive

### Gestion des versions

- **Semantic versioning** : 1.0.0, 1.1.0, 2.0.0
- **Branches** : main (stable), develop (évolution)
- **Tags** : Marquage des releases
- **Archives** : Conservation des anciennes versions

### Feedback et amélioration

- **Issues GitHub** : Signalement de problèmes
- **Pull Requests** : Contributions communautaires
- **Reviews** : Validation par experts
- **Métriques** : Analyse d'usage du site

## Ressources complémentaires

- [IG Guidance - Structure](https://build.fhir.org/ig/FHIR/ig-guidance/ig-structure.html)
- [Template HL7](https://github.com/HL7/ig-template-base)
- [Exemples d'IG](https://confluence.hl7.org/display/FHIR/IG+Registry)

> **Astuce** : Commencez simple avec le template HL7, puis spécialisez selon vos besoins. La structure idéale est celle qui sert le mieux vos utilisateurs finaux.