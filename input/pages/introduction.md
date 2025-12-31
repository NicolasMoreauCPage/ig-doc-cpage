

# Introduction aux Implementation Guides FHIR

Ce guide vous accompagne dans la création, la publication et la maintenance d’Implementation Guides (IG) FHIR au sein de l’entreprise CPage. Il s’appuie sur la méthodologie, des exemples concrets et des retours d’expérience pour garantir des IG de qualité.


## Qu'est-ce que FHIR et pourquoi des IG ?

FHIR (Fast Healthcare Interoperability Resources) est un standard international d'interopérabilité en santé, développé par HL7. Il définit une API RESTful et un modèle de données pour échanger des informations médicales de manière standardisée.

FHIR est générique. Pour répondre à des besoins spécifiques (ex : vaccination, prescription électronique), il faut contraindre et étendre FHIR. C’est le rôle des Implementation Guides.

Un IG FHIR formalise :
- L’utilisation de FHIR pour un cas d’usage précis
- Les contraintes à appliquer aux ressources (profils)
- Les extensions à ajouter si nécessaire
- La validation de la conformité des échanges
- La documentation et la publication des spécifications


## Avantages des IG FHIR

- Standardisation : alignement sur les pratiques internationales
- Interopérabilité : échanges fiables entre systèmes
- Réutilisabilité : IG publiés réutilisables par d’autres projets
- Qualité : validation automatique et documentation structurée
- Évolutivité : versionnement et maintenance facilités


## Cycle de vie d’un IG

1. Analyse des besoins : identifier le cas d’usage et les acteurs
2. Modélisation : définir profils, extensions, terminologies
3. Documentation : rédiger guides d’implémentation et exemples
4. Validation : tests de conformité et qualité
5. Publication : site web et package NPM
6. Maintenance : évolutions, corrections, nouvelles versions


## Public concerné

Ce guide s’adresse à différents profils : débutants FHIR, modélisateurs, développeurs, experts métier, architectes, etc.
- **Modélisateurs** : Maîtrisez la création de profils et extensions
- **Développeurs** : Implémentez et validez les interfaces
- **Experts métier** : Spécifiez les besoins fonctionnels
- **Architectes** : Concevez l'écosystème d'interopérabilité
- **Managers** : Comprenez l'impact et les bénéfices

Quel que soit votre niveau, ce guide vous apporte les connaissances pratiques nécessaires.

## Prérequis

Avant de commencer, assurez-vous de disposer de :
- Connaissances de base en FHIR (ressources, API REST)
- Environnement de développement configuré (voir [Installation](installation.html))
- Accès au dépôt GitHub de l'IG

## ⚠️ Usage du template CPage

**Important : Ce guide et template sont réservés aux projets CPage**

Ce guide documentaire IG FHIR et le template associé sont **exclusivement conçus** pour la création d'Implementation Guides dans le contexte de l'entreprise CPage.

- ✅ **Utilisation autorisée** : IG pour projets CPage (internes, clients, partenaires)
- ❌ **Utilisation non autorisée** : Projets externes à CPage
- ❌ **Non autorisé** : Redistribution du template hors écosystème CPage

**Pourquoi cette restriction ?**
- Configurations spécifiques à CPage (styles, workflows, conformité)
- Intégration avec l'écosystème CPage
- Gouvernance et standards internes

Pour des projets externes à CPage, utilisez le [template officiel HL7](https://github.com/HL7/ig-template-base).

## Plan du guide

Ce guide est organisé de manière progressive :

- **[Prise en main rapide](quickstart.html)** : Premiers pas immédiats
- **[Installation](installation.html)** : Configuration technique
- **[Structure d'un IG](structure-ig.html)** : Organisation du projet
- **[Profils](profiles.html)** : Contraintes sur les ressources
- **[Extensions](extensions.html)** : Nouveaux éléments de données
- **[Terminologies](terminologies.html)** : Codes et value sets
- **[Bonnes pratiques](bonnes-pratiques.html)** : Qualité et conformité
- **[Publication](publication-validation.html)** : Déploiement et validation
- **[Outils](outils.html)** : Écosystème technique
- **[FAQ](faq.html)** et **[Liens utiles](liens-utiles.html)** : Support et ressources

Chaque section contient des exemples, des conseils pratiques et des liens vers la documentation officielle.

## Contribution et support

Ce guide évolue avec vos retours. Pour contribuer :
- **Signalez des problèmes** via les Issues GitHub
- **Proposez des améliorations** par Pull Request
- **Partagez vos expériences** dans la communauté

L'équipe projet est disponible pour vous accompagner dans vos premiers pas FHIR.

> **Prochaine étape** : Commencez par la [Prise en main rapide](quickstart.html) pour créer votre premier IG !

