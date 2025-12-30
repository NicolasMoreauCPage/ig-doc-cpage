# Structure d'un projet IG FHIR

Un projet Implementation Guide FHIR suit une organisation précise des fichiers et dossiers. Cette structure garantit la compatibilité avec les outils (SUSHI, IG Publisher) et facilite la maintenance.

## Vue d'ensemble

```
mon-ig-fhir/
├── sushi-config.yaml      # Configuration principale
├── ig.ini                # Configuration IG Publisher
├── input/                 # Sources du projet
│   ├── pages/            # Documentation (Markdown)
│   ├── fsh/              # Artefacts FSH
│   ├── resources/        # Ressources FHIR additionnelles
│   ├── images/           # Images et médias
│   └── includes/         # Fragments réutilisables
├── fsh-generated/        # Artefacts générés (par SUSHI)
├── output/               # Site web généré (par IG Publisher)
├── temp/                 # Fichiers temporaires
└── template/             # Template Jekyll
```

## Fichiers de configuration

### sushi-config.yaml
**Rôle** : Configuration principale du projet IG
**Contenu essentiel** :
```yaml
id: mon-ig-fhir
canonical: https://example.org/ig/mon-ig
name: Mon Implementation Guide
title: "Guide d'implémentation FHIR"
version: 1.0.0
fhirVersion: 4.0.1
pages:
  index.md:
    title: Accueil
menu:
  Accueil: index.html
```

### ig.ini
**Rôle** : Configuration spécifique à IG Publisher
**Exemple** :
```ini
[IG]
ig = input/fsh/
template = template/
output = output/
```

## Dossier input/

### pages/
- **Contenu** : Pages de documentation en Markdown
- **Convention** : Un fichier par section/logique
- **Exemples** :
  - `index.md` : Page d'accueil
  - `introduction.md` : Présentation du domaine
  - `profils.md` : Liste des profils

### fsh/
- **Contenu** : Définition des artefacts en FHIR Shorthand
- **Organisation** : Par type ou par domaine
- **Exemples** :
  - `profiles.fsh` : Profils FHIR
  - `extensions.fsh` : Extensions
  - `terminologies.fsh` : Code systems et value sets

### resources/
- **Contenu** : Ressources FHIR additionnelles (JSON/XML)
- **Usage** : Quand FSH ne suffit pas ou pour des ressources externes

### images/
- **Contenu** : Images, schémas, logos
- **Format** : PNG, SVG, JPG
- **Bonnes pratiques** : Optimiser la taille, utiliser des noms descriptifs

### includes/
- **Contenu** : Fragments HTML/Markdown réutilisables
- **Usage** : Headers, footers, menus personnalisés

## Dossiers générés

### fsh-generated/
- **Créé par** : SUSHI
- **Contenu** : Ressources FHIR compilées (JSON)
- **Important** : Ne pas modifier manuellement

### output/
- **Créé par** : IG Publisher
- **Contenu** : Site web complet HTML/CSS/JS
- **Usage** : Aperçu local et déploiement

## Scripts et outils

### Scripts fournis
- `_genonce.sh` : Génération complète (SUSHI + IG Publisher)
- `_gencontinuous.sh` : Génération en continu (avec surveillance)
- `_refresh.sh` : Mise à jour des dépendances

### Outils externes
- **SUSHI** : Compilation FSH
- **IG Publisher** : Génération du site
- **Jekyll** : Moteur de templating

## Bonnes pratiques d'organisation

- **Un IG = Un dépôt** : Évitez de mélanger plusieurs IG
- **Versionnez tout** : Commitez régulièrement
- **Documentez** : README.md, commentaires dans le code
- **Testez localement** : Avant de pousser
- **Nommez clairement** : Fichiers et dossiers descriptifs

## Exemple concret

Pour un IG "Vaccination" :
```
vaccination-ig/
├── sushi-config.yaml
├── input/
│   ├── pages/
│   │   ├── index.md
│   │   ├── vaccination-process.md
│   │   └── examples.md
│   ├── fsh/
│   │   ├── profiles.fsh      # Profil VaccinationRecord
│   │   ├── extensions.fsh    # Extension lot number
│   │   └── terminologies.fsh # ValueSet vaccins
│   └── images/
│       └── vaccination-schema.png
└── fsh-generated/
    └── resources/
        └── StructureDefinition-vaccination-record.json
```

## Ressources complémentaires

- [Documentation SUSHI](https://fshschool.org/docs/sushi/)
- [Guide IG Publisher](https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation)
- [Template de base HL7](https://github.com/HL7/ig-template-base)

> **Astuce** : Utilisez le template HL7 comme point de départ pour respecter les conventions.
