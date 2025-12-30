
# Introduction aux Implementation Guides FHIR

Ce guide documentaire vous accompagne pas à pas dans la création, la publication et la maintenance d’Implementation Guides (IG) FHIR au sein de l’entreprise CPage. Il combine méthodologie éprouvée, exemples concrets et retours d’expérience pour garantir des IG de qualité professionnelle.

## Qu'est-ce que FHIR et pourquoi des IG ?

**FHIR (Fast Healthcare Interoperability Resources)** est un standard international d'interopérabilité en santé, développé par HL7. Il définit une API RESTful et un modèle de données pour échanger des informations médicales de manière standardisée et sécurisée.

Cependant, FHIR en lui-même est générique. Pour répondre à des besoins spécifiques (comme l'échange de données de vaccination en France ou la prescription électronique), il faut **contraindre et étendre** FHIR. C'est le rôle des **Implementation Guides**.

Un IG FHIR formalise :
- **Comment utiliser FHIR** pour un cas d'usage précis
- **Quelles contraintes appliquer** aux ressources (profils)
- **Quelles extensions ajouter** si nécessaire
- **Comment valider la conformité** des échanges
- **Comment documenter et publier** les spécifications

## Avantages des IG FHIR

- **Standardisation** : Alignement sur les meilleures pratiques internationales
- **Interopérabilité** : Échanges fiables entre systèmes hétérogènes
- **Réutilisabilité** : IG publiés peuvent être repris par d'autres projets
- **Qualité** : Validation automatique et documentation structurée
- **Évolutivité** : Versionnement et maintenance facilités

## Cycle de vie d'un IG

1. **Analyse des besoins** : Identifier le cas d'usage et les acteurs
2. **Modélisation** : Définir profils, extensions, terminologies
3. **Documentation** : Rédiger guides d'implémentation et exemples
4. **Validation** : Tests de conformité et qualité
5. **Publication** : Site web et package NPM
6. **Maintenance** : Évolutions, corrections, nouvelles versions

## Public concerné

Ce guide s'adresse à différents profils :

- **Débutants FHIR** : Découvrez les concepts fondamentaux
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

