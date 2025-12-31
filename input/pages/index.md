
# Guide documentaire IG FHIR – Accueil


Bienvenue sur le guide documentaire IG FHIR de l’entreprise CPage. Ce document vous accompagne dans la création, la publication et la maintenance d’Implementation Guides (IG) FHIR, en s’appuyant sur les pratiques de l’industrie et les standards HL7.

---


## Pourquoi un IG par projet ?

Créer un Implementation Guide (IG) par projet permet d’assurer un versionnage indépendant, une gestion claire des dépendances, des URLs explicites, la réutilisation et la spécialisation, ainsi qu’une meilleure interopérabilité avec l’écosystème national. Chaque IG CPage doit hériter des profils FHIR nationaux (InteropSanté, ANS) s’ils existent.

Pour aller plus loin : [ImplementationGuide](https://www.hl7.org/fhir/implementationguide.html), [NPM Package](https://confluence.hl7.org/display/FHIR/NPM+Package+Specification)



## Qu'est-ce qu'un IG FHIR ?

Un Implementation Guide FHIR est un document qui décrit comment utiliser le standard FHIR pour répondre à un besoin d’interopérabilité en santé. Il regroupe profils, extensions, exemples, documentation narrative et terminologies. L’IG est publié sous forme de site web interactif et de package NPM, pour faciliter sa réutilisation et son intégration.


## Objectifs du guide

Ce guide vise à structurer votre démarche, à présenter les outils nécessaires (SUSHI, IG Publisher…), à exposer les bonnes pratiques et à faciliter la collaboration autour des IG FHIR.


## Public visé

Ce guide s’adresse à tous les acteurs impliqués dans les projets FHIR : modélisateurs, développeurs, experts métier, architectes, ou toute personne souhaitant comprendre ou contribuer aux IG FHIR.


## Signaler un problème ou une suggestion

Vous avez identifié une erreur ou souhaitez proposer une amélioration ? Utilisez l'onglet "Issues" du [dépôt GitHub](https://github.com/NicolasMoreauCPage/ig-fhir-doc-cpage/issues) pour signaler un problème.

L'issue doit contenir :
- Un titre clair et descriptif
- Une description détaillée du problème
- Une proposition de solution si possible

## Plan du guide

1. **[Prise en main rapide](quickstart.html)** : Premiers pas en 5 minutes
2. **[Installation](installation.html)** : Configuration de l'environnement de développement
3. **[Structure d'un IG](structure-ig.html)** : Organisation des fichiers et dossiers
4. **[Profils](profiles.html)** : Création et gestion des profils FHIR
5. **[Extensions](extensions.html)** : Définition d'extensions personnalisées
6. **[Terminologies](terminologies.html)** : Gestion des codes et value sets
7. **[Bonnes pratiques](bonnes-pratiques.html)** : Recommandations essentielles
8. **[Publication et validation](publication-validation.html)** : Déploiement et qualité
9. **[Outils](outils.html)** : Écosystème technique FHIR
10. **[FAQ](faq.html)** : Questions fréquentes
11. **[Liens utiles](liens-utiles.html)** : Ressources complémentaires
12. **[Versionnement d'un IG](versioning.html)** : Stratégies de gestion des versions et bonnes pratiques
13. **[Utiliser les packages (.tgz / .zip)](packages.html)** : Création, publication et import de packages IG

Utilisez le menu de navigation pour explorer les sections qui vous intéressent.

Commencez par la page [Bonnes pratiques](bonnes-pratiques.html) pour comprendre les principes fondamentaux de qualité et conformité.

## Usage du template et de l'IG clonable

Ce guide documentaire et le template IG associé sont exclusivement destinés à la création d'Implementation Guides FHIR pour l'entreprise CPage.

Autorisé : Création d'IG pour des projets CPage (internes ou clients)
Non autorisé : Utilisation pour des projets externes à CPage
Non autorisé : Redistribution ou partage du template hors CPage

Pour des projets externes à CPage, utilisez :
- Le template officiel HL7 : https://github.com/HL7/ig-template-base
- Les outils standards FHIR : https://confluence.hl7.org/display/FHIR/IG+Publisher+Documentation

Ce template intègre des configurations, styles et processus spécifiques à CPage qui ne sont pas adaptés à d'autres contextes.

## Contribution

Ce guide est évolutif et ouvert à contribution. Pour proposer des améliorations :

- Ouvrez une **Issue** sur le dépôt GitHub
- Soumettez une **Pull Request** avec vos modifications
- Contactez l'équipe projet pour toute question

N'hésitez pas à partager vos retours d'expérience pour enrichir ce guide collectif !

---

## Navigation et ressources

- [Table des matières](toc.html) | [QA](output/qa.html) | [Historique](https://github.com/NicolasMoreauCPage/ig-fhir-doc-cpage/commits/main) | [Contact](mailto:interop@cpage.fr)

---
