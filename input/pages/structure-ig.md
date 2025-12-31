
# Structure d'un Implementation Guide FHIR

Un Implementation Guide FHIR organise et présente des spécifications d'interopérabilité. Cette page détaille l'architecture logique d'un IG et les bonnes pratiques de structuration.


## Vue d'ensemble d'un IG

Un IG FHIR regroupe plusieurs composants :
- Artefacts techniques : profils, extensions, terminologies
- Documentation narrative : guides d'implémentation, cas d'usage
- Exemples concrets : instances d'échange
- Métadonnées : informations de publication et conformité
- Ressources complémentaires : outils, tests, support

L'objectif est de transformer FHIR générique en spécifications opérationnelles pour un domaine donné.


## Organisation logique

1. Page d'accueil (index.md) : point d'entrée, présentation générale, plan du guide
2. Introduction et contexte : expliquer le pourquoi et le comment, bénéfices, limites, relations avec d'autres IG
3. Artefacts techniques : profils, extensions, terminologies, opérations, recherche
4. Guides d'implémentation : workflows métier, règles de validation, gestion des erreurs, exemples d'intégration
5. Exemples et cas d'usage : instances minimales, scénarios complexes, cas limites, tests d'interopérabilité

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